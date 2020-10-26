package controller.berequest;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import command.BERequestCommand;
import model.BERequestDTO;
import model.BHReservationDTO;
import model.CounselingDTO;
import operatorModel.BEDetailDTO;
import operatorModel.BERDandBED;
import operatorModel.BERequestDetailDTO;
import operatorModel.RentDateTimeDTO;
import operatorModel.ReservationChargeDTO;
import operatorModel.TotalReservationDTO;
import service.be.BEDetailListService;
import service.berequest.BEReqeustInsertService;
import service.berequest.BERequestDateChangeService;
import service.berequest.BERequestDeleteService;
import service.berequest.BERequestDetailListSelectService;
import service.bhreservation.BHReservationChargeUpdateService;
import service.bhreservation.BHReservationTotalSelectService;
import service.counseling.CounselingModifyService;

@Controller
@RequestMapping("BERequest")
public class BERequestController {

	@Autowired
	private BEDetailListService bEDetailListService;
	
	@Autowired
	private BERequestDateChangeService bERequestDateChangeService;
	
	@Autowired
	private BEReqeustInsertService bEReqeustInsertService;
	
	@Autowired
	private BHReservationChargeUpdateService bHReservationChargeUpdateService;
	
	@Autowired
	private BHReservationTotalSelectService bHReservationTotalSelectService;
	
	@Autowired
	private BERequestDetailListSelectService bERequestDetailListSelectService;	

	@Autowired
	private BERequestDeleteService bERequestDeleteService;
	
	@Autowired
	private CounselingModifyService counselingModifyService;
	
	@ResponseBody
	@RequestMapping(value = "BERequestDateChange", method = {RequestMethod.POST, RequestMethod.GET})
	public List<BEDetailDTO> bERequestDateChange(@RequestParam(value = "rentDate") String rentDate, @RequestParam(value = "rentTime") String rentTime){
		rentDate = rentDate.replace(" ", "");
		rentDate = rentDate.replace("/", "");
		rentDate = rentDate.replace(":", "");
		
		rentTime = rentTime.replace(" ", "");
		rentTime = rentTime.replace("/", "");
		rentTime = rentTime.replace(":", "");
		
		RentDateTimeDTO dto = new RentDateTimeDTO();
		dto.setRentDate(rentDate);
		dto.setRentTime(rentTime);
		
		List<BEDetailDTO> list = bEDetailListService.bEDetailListSelect();
		System.out.println("list : " + list.size());
		List<Long> deleteBEList = bERequestDateChangeService.bERequestDateChange(dto);
		System.out.println("deleteBEList : " + deleteBEList.size());
		
		for(int j=0; j<list.size(); j++) {
			System.out.println(list.get(j).getBECharge() + " / " + list.get(j).getEmployeeNum() + " / " + list.get(j).getBEDuties());
		}
		
		for(int i=0; i<deleteBEList.size(); i++) {
			for(int j=0; j<list.size(); j++) {
				if(deleteBEList.get(i).equals(list.get(j).getEmployeeNum()))
					list.remove(j);
			}
		}
		
		return list;
	}
	
	// 연회인력 요청 등록, 예약 가격 업데이트
	@RequestMapping("BERequestInsert")
	public String bERequestInsert(BERequestCommand bERequestCommand, 
			@RequestParam(value="bENum") Long [] bENum, 
			@RequestParam(value="bETotalCharge") Long bETotalCharge,
			Model model) {
		bERequestCommand.setBENum(bENum);
		bEReqeustInsertService.bEReqeustInsert(bERequestCommand);
		BHReservationDTO dto = new BHReservationDTO();
		dto.setBHReservationNum(bERequestCommand.getBHReservationNum());
		dto.setReservationCharge(bETotalCharge);
		bHReservationChargeUpdateService.bHReservationChargeUpdate(dto);
		
		CounselingDTO counselingDTO = new CounselingDTO();
		counselingDTO.setCounselingNum(bERequestCommand.getCounselingNum());
		counselingDTO.setBHReservationNum(bERequestCommand.getBHReservationNum());
		counselingDTO.setCounselingStatus("예약완료");
		counselingModifyService.counselingReservationCompleModify(counselingDTO);
		
		TotalReservationDTO totalReservationDTO = bHReservationTotalSelectService.totalReservationSelect(bERequestCommand.getBHReservationNum());
		model.addAttribute("dto", totalReservationDTO);
		
		return "BHReservation/BHReservation_Detail";
	}
	
	// 연회인력 수정 폼
	@RequestMapping("BERequestModifyForm")
	public String bERequestModifyForm(@RequestParam(value = "bHReservationNum") Long bHReservationNum, Model model) {
		List<BERequestDetailDTO> list = bERequestDetailListSelectService.bERequestDetailListSelectByRNum(bHReservationNum);
		model.addAttribute("list", list);
		
		RentDateTimeDTO dto = new RentDateTimeDTO();
		String rentDate = list.get(0).getBERequestDate().toString();
		String rentTime = list.get(0).getBERequestTime().toString();
		
		rentDate = rentDate.substring(0, 16).replace(":", "").replace("-", "").replace(" ", "");
		rentTime = rentTime.substring(0, 16).replace(":", "").replace("-", "").replace(" ", "");
		
		dto.setRentDate(rentDate);
		dto.setRentTime(rentTime);
		
		List<BEDetailDTO> beList = bEDetailListService.bEDetailListSelect();

		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<beList.size(); j++) {
				if(list.get(i).getEmployeeNum().equals(beList.get(j).getEmployeeNum()))
					beList.remove(j);
			}
		}
		
		model.addAttribute("beList", beList);
		return "BE_Request/BE_Request_Modify";
	}
	
	// 연회 인력 추가
	@ResponseBody
	@RequestMapping("BERequestAdd")
	public BERDandBED bERequestAdd(String selectnuseBE, Long memberNum, Timestamp bERequestDate, Timestamp bERequestTime, Long bHReservationNum) {
		String [] splitBENumAndChargeList = selectnuseBE.split("/");
		List<BERequestDTO> addBERquestList = new ArrayList<BERequestDTO>();
		Long addCharge = (long)0;
		for(int i=0; i<splitBENumAndChargeList.length; i++) {
			String [] splitBENumAndCharge = splitBENumAndChargeList[i].split(",");
			addCharge += Long.parseLong(splitBENumAndCharge[1]);
			BERequestDTO dto = new BERequestDTO(null, bHReservationNum, Long.parseLong(splitBENumAndCharge[0]), 
					Long.parseLong(splitBENumAndCharge[0]),memberNum, bERequestDate, bERequestTime);
			addBERquestList.add(dto);
		}
		bEReqeustInsertService.bEReqeustInsertList(addBERquestList);
		
		List<BERequestDetailDTO> list = bERequestDetailListSelectService.bERequestDetailListSelectByRNum(bHReservationNum);
		
		RentDateTimeDTO dto = new RentDateTimeDTO();
		String rentDate = bERequestDate.toString();
		String rentTime = bERequestTime.toString();
		rentDate = rentDate.substring(0, 16).replace(":", "").replace("-", "").replace(" ", "");
		rentTime = rentTime.substring(0, 16).replace(":", "").replace("-", "").replace(" ", "");
		dto.setRentDate(rentDate);
		dto.setRentTime(rentTime);
		
		List<BEDetailDTO> beList = bEDetailListService.bEDetailListSelect();

		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<beList.size(); j++) {
				if(list.get(i).getEmployeeNum().equals(beList.get(j).getEmployeeNum()))
					beList.remove(j);
			}
		}
		BERDandBED data = new BERDandBED(list, beList);
		
		ReservationChargeDTO reservationChargeDTO = new ReservationChargeDTO(bHReservationNum, addCharge);
		bHReservationChargeUpdateService.bHReservationModifyCharge(reservationChargeDTO);
		
		return data;
	}
	
	// 연회 인력 취소
	@ResponseBody
	@RequestMapping("BERequestCancel")
	public BERDandBED bERequestCancel(String selectBE, Long bHReservationNum, Timestamp bERequestDate, Timestamp bERequestTime) {
		String [] splitBERequestList = selectBE.split("/");
		Long minusCharge = (long)0;
		List<String> bHReservationNumList = new ArrayList<String>();
		for(int i=0; i<splitBERequestList.length; i++) {
			String [] splitBERequestNumAndCharge = splitBERequestList[i].split(",");
			minusCharge += Long.parseLong(splitBERequestNumAndCharge[1]);
			bHReservationNumList.add(splitBERequestNumAndCharge[0]);
		}		
		bERequestDeleteService.bERequestListDelete(bHReservationNumList);
		
		List<BERequestDetailDTO> list = bERequestDetailListSelectService.bERequestDetailListSelectByRNum(bHReservationNum);
		
		RentDateTimeDTO dto = new RentDateTimeDTO();
		String rentDate = bERequestDate.toString();
		String rentTime = bERequestTime.toString();
		rentDate = rentDate.substring(0, 16).replace(":", "").replace("-", "").replace(" ", "");
		rentTime = rentTime.substring(0, 16).replace(":", "").replace("-", "").replace(" ", "");
		dto.setRentDate(rentDate);
		dto.setRentTime(rentTime);
		
		List<BEDetailDTO> beList = bEDetailListService.bEDetailListSelect();

		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<beList.size(); j++) {
				if(list.get(i).getEmployeeNum().equals(beList.get(j).getEmployeeNum()))
					beList.remove(j);
			}
		}
		
		BERDandBED data = new BERDandBED(list, beList);
		
		ReservationChargeDTO reservationChargeDTO = new ReservationChargeDTO(bHReservationNum, minusCharge * -1);
		bHReservationChargeUpdateService.bHReservationModifyCharge(reservationChargeDTO);
		
		return data;
	}
	
}
