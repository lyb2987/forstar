package controller.fab;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.BERequestCommand;
import command.FABCommand;
import model.BHReservationDTO;
import model.CounselingDTO;
import model.FABDTO;
import model.MenuDTO;
import operatorModel.ReservationChargeDTO;
import operatorModel.TotalReservationDTO;
import service.bhreservation.BHReservationChargeUpdateService;
import service.bhreservation.BHReservationTotalSelectService;
import service.counseling.CounselingModifyService;
import service.fab.FABInsertService;
import service.fab.FABModifyService;
import service.fab.FABSelectService;
import service.menu.MenuListSelectService;

@Controller
@RequestMapping("FAB")
public class FABController {
	
	@Autowired
	private FABInsertService fabInsertService;
	
	@Autowired
	private BHReservationChargeUpdateService bHReservationChargeUpdateService;
	
	@Autowired
	private BHReservationTotalSelectService bHReservationTotalSelectService;
	
	@Autowired
	private FABSelectService fabSelectService;

	@Autowired
	private MenuListSelectService menuListSelectService;
	
	@Autowired
	private FABModifyService fabModifyService;
	
	@Autowired
	private CounselingModifyService counselingModifyService;
	
	@RequestMapping("FABInsert")
	public String fabInsert(FABCommand fabcommand, Model model) {
		BHReservationDTO dto = new BHReservationDTO();
		dto.setBHReservationNum(fabcommand.getBHReservationNum());
		dto.setReservationCharge(fabcommand.getFabCharge());
		bHReservationChargeUpdateService.bHReservationChargeUpdate(dto);
		fabInsertService.fabInsert(fabcommand);
		System.out.println(fabcommand.getReservationType());
		if(fabcommand.getReservationType().equals((long)4)) {
			BERequestCommand bERequestCommand = new BERequestCommand();
			bERequestCommand.setBHReservationNum(fabcommand.getBHReservationNum());
			bERequestCommand.setMemberNum(fabcommand.getMemberNum());
			model.addAttribute("bERequestCommand", bERequestCommand);
			return "BE_Request/BE_Request_Form";
		}
		else {
			TotalReservationDTO totalReservationDTO = bHReservationTotalSelectService.totalReservationSelect(fabcommand.getBHReservationNum());
			model.addAttribute("dto", totalReservationDTO);
			
			CounselingDTO counselingDTO = new CounselingDTO();
			counselingDTO.setCounselingNum(fabcommand.getCounselingNum());
			counselingDTO.setBHReservationNum(fabcommand.getBHReservationNum());
			counselingDTO.setCounselingStatus("예약완료");
			counselingModifyService.counselingReservationCompleModify(counselingDTO);
			
			return "BHReservation/BHReservation_Detail";
		}
	}
	
	@RequestMapping("FABModifyForm")
	public String fabModifyForm(@RequestParam(value="bHReservationNum") Long bHReservationNum, Model model) {
		FABDTO dto = fabSelectService.fabSelect(bHReservationNum);
		List<MenuDTO> menuList = menuListSelectService.menuListSelect();
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("dto", dto);
		return "FAB/FAB_Modify";
	}
	
	@RequestMapping("FABModify")
	public String fabModify(FABDTO dto, Long diffrentCharge) {
		fabModifyService.fabModify(dto);
		ReservationChargeDTO reservationChargeDTO = new ReservationChargeDTO();
		reservationChargeDTO.setBHReservationNum(dto.getBHReservationNum());
		reservationChargeDTO.setCharge(diffrentCharge);
		System.out.println("diffrentCharge : " + diffrentCharge);
		bHReservationChargeUpdateService.bHReservationModifyCharge(reservationChargeDTO);;
		return "redirect:../BHReservation/TotalReservationDetail?bHReservationNum="+dto.getBHReservationNum();
	}
	
}
