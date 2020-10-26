package controller.bhreservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.BHReservationDTO;
import model.CounselingDTO;
import model.StartEndPageDTO;
import operatorModel.TotalReservationDTO;
import service.berequest.BERequestDeleteService;
import service.bhreservation.BHReservationDeleteService;
import service.bhreservation.BHReservationListSelectService;
import service.bhreservation.BHReservationTotalSelectService;
import service.counseling.CounselingSelectService;
import service.fab.FABDeleteService;
import service.rent.RentDeleteService;
import service.banquet.BanquetDeleteService;

@Controller
@RequestMapping("BHReservation")
public class BHReservationController {
	
	@Autowired
	private BHReservationTotalSelectService bHReservationTotalSelectService;
	
	@Autowired
	private BHReservationListSelectService bHReservationListSelectService;
	
	@Autowired
	private BERequestDeleteService bERequestDeleteService;
	
	@Autowired
	private FABDeleteService fabDeleteService;
	
	@Autowired
	private RentDeleteService rentDeleteService;
	
	@Autowired
	private BanquetDeleteService banquetDeleteService;
	
	@Autowired
	private BHReservationDeleteService bHReservationDeleteService;
	
	@Autowired
	private CounselingSelectService counselingSelectService;
	
	@RequestMapping("BHReservationIRChoose")
	public String bhReservationIRChoose(@RequestParam(value="counselingNum") Long counselingNum, Model model) {
		model.addAttribute("counselingNum", counselingNum);
		return "BHReservation/BHReservation_IR_Choose";
	}
	

	@RequestMapping(value="TotalReservationDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String totalReservationDetail(@RequestParam(value="bHReservationNum") Long bHReservationNum, Model model) {
		TotalReservationDTO dto = bHReservationTotalSelectService.totalReservationSelect(bHReservationNum);
		model.addAttribute("dto", dto);
		return "BHReservation/BHReservation_Detail";
	}
	
	@RequestMapping("BHReservationModifyChoose")
	public String bHReservationModifyChoose(@RequestParam(value="bHReservationNum") Long bHReservationNum, Model model) {
		model.addAttribute("bHReservationNum", bHReservationNum);
		return "BHReservation/BHReservation_Modify_Choose";
	}
	
	@RequestMapping("BHReservationList")
	public String bHReservationList(@RequestParam(value = "page" , defaultValue = "1") Integer page, Model model) {
		bHReservationListSelectService.bHReservationListSelect(page, model);
		return "BHReservation/BHReservation_List";
	}
	
	@RequestMapping("Rebook")
	public String rebook(@RequestParam(value = "bHReservationNum") Long bHReservationNum, Model model) {
		StartEndPageDTO sePage = new StartEndPageDTO();
		Integer page = 1;
		
		int limit = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		sePage.setSelectNum(bHReservationNum);
		
		BHReservationDTO dto = bHReservationListSelectService.bHReservationSelect(sePage);
		banquetDeleteService.banquetDelete(dto.getBanquetNum());
		rentDeleteService.rentDelete(dto.getRentNum());
		
		CounselingDTO counselingDTO = counselingSelectService.counselingSelectByBHRNum(bHReservationNum);
		
		return "redirect:/BHReservation/BHReservationIRChoose?counselingNum="+counselingDTO.getCounselingNum();
	}
	
	@RequestMapping("BHReservationDelete")
	public String bHReservationDelete(@RequestParam(value="bHRservationNum") Long bHReservationNum) {
		StartEndPageDTO sePage = new StartEndPageDTO();
		Integer page = 1;
		
		int limit = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		sePage.setSelectNum(bHReservationNum);
		BHReservationDTO dto = bHReservationListSelectService.bHReservationSelect(sePage);
		
		banquetDeleteService.banquetDelete(dto.getBanquetNum());
		rentDeleteService.rentDelete(dto.getRentNum());
		
		return "main/main";
	}
}
