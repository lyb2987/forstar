package controller.banquet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.BanquetCommand;
import command.RentCommand;
import model.BanquetDTO;
import operatorModel.ReservationChargeDTO;
import service.banquet.BanquetInsertService;
import service.banquet.BanquetModifyService;
import service.banquet.BanquetSelectService;
import service.bhreservation.BHReservationChargeUpdateService;
import service.counseling.CounselingDetailService;
import service.counseling.CounselingModifyService;
import validator.BanquetCommandValidator;

@Controller
@RequestMapping("Banquet")
public class BanquetController {
	
	@Autowired
	private CounselingDetailService counselingDetailService;
	
	@Autowired
	private CounselingModifyService counselingModifyService;
	
	@Autowired
	private BanquetInsertService banquetInsertService;
	
	@Autowired
	private BanquetSelectService banqetSelectService;
	
	@Autowired
	private BanquetModifyService banquetModifyService;
	
	@Autowired
	private BHReservationChargeUpdateService bHReservationChargeUpdateService;
	
	// 연회 예약 페이지
	@RequestMapping("BanquetInsertForm")
	public String banquetInsertForm(BanquetCommand banquetCommand, @RequestParam(value="counselingNum") Long counselingNum, 
			@RequestParam(value="reservationType") Long reservationType, Model model) {
		Integer page = 1;
		counselingModifyService.counselingReserveModify(counselingNum);
		counselingDetailService.counselingSelect(counselingNum, page, model);
		banquetCommand.setCounselingNum(counselingNum);
		banquetCommand.setReservationType(reservationType);
		return "Banquet/Banquet_Form";
	}
	
	// 연회 예약
	@RequestMapping("BanquetInsert")
	public String banquetInsert(BanquetCommand banquetCommand, Errors errors, Model model) {
		Integer page = 1;
		counselingDetailService.counselingSelect(banquetCommand.getCounselingNum(), page, model);
		new BanquetCommandValidator().validate(banquetCommand, errors);
		if(errors.hasErrors()) {
			return "Banquet/Banquet_Form";
		}
		banquetInsertService.banquetInsert(banquetCommand);
		RentCommand rentCommand = new RentCommand();
		rentCommand.setBanquetNum(banqetSelectService.banquetNumSelect(banquetCommand));
		rentCommand.setCounselingNum(banquetCommand.getCounselingNum());
		rentCommand.setReservationType(banquetCommand.getReservationType());
		model.addAttribute("rentCommand", rentCommand);
		return "Rent/Rent_Form";
	}
	
	// 연회 수정 폼
	@RequestMapping("BanquetModifyForm")
	public String banquetModifyForm(@RequestParam(value="bHReservationNum") Long bHReservationNum, Model model) {
		BanquetDTO dto = banqetSelectService.banquetSelect(bHReservationNum);
		model.addAttribute("bHReservationNum", bHReservationNum);
		model.addAttribute("dto", dto);
		return "Banquet/Banquet_Modify";
	}
	
	@RequestMapping("BanquetModify")
	public String banquetModify(@RequestParam(value="bHReservationNum") Long bHReservationNum,
			@RequestParam(value="banquetNum") Long banquetNum,
			@RequestParam(value="banquetType") String banquetType,
			@RequestParam(value="banquetPurpose") String banquetPurpose,
			@RequestParam(value="banquetRequest") String banquetRequest,
			@RequestParam(value="banquetCharge") Long banquetCharge,
			@RequestParam(value="diffrentCharge") Long diffrentCharge) {
		BanquetDTO dto = new BanquetDTO(banquetNum, banquetType, banquetPurpose, banquetRequest, banquetCharge);
		System.out.println(bHReservationNum);
		ReservationChargeDTO reservationChargeDTO = new ReservationChargeDTO(bHReservationNum, diffrentCharge);
		bHReservationChargeUpdateService.bHReservationModifyCharge(reservationChargeDTO);
		banquetModifyService.banquetModify(dto);
		
		return "redirect:../BHReservation/TotalReservationDetail?bHReservationNum="+bHReservationNum;
	}
	
	
}
