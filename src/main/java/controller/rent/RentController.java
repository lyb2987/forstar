package controller.rent;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import command.BERequestCommand;
import command.FABCommand;
import command.RentCommand;
import model.CounselingDTO;
import model.MenuDTO;
import operatorModel.TotalReservationDTO;
import service.bhreservation.BHReservationInsertService;
import service.bhreservation.BHReservationNumSelectService;
import service.bhreservation.BHReservationTotalSelectService;
import service.counseling.CounselingMemberNumSelectService;
import service.counseling.CounselingModifyService;
import service.menu.MenuListSelectService;
import service.rent.RentDateChangeService;
import service.rent.RentInsertService;
import service.rent.RentSelectNumService;

@Controller
@RequestMapping("Rent")
public class RentController {

	@Autowired
	private RentDateChangeService rentDateChangeService;
	
	@Autowired
	private RentInsertService rentInsertService;
	
	@Autowired
	private RentSelectNumService rentSelectNumService;
	
	@Autowired
	private BHReservationInsertService bHReservationInsertService;

	@Autowired
	private BHReservationNumSelectService bHReservationNumSelectService;
	
	@Autowired
	private CounselingMemberNumSelectService counselingMemberNumSelectService;
	
	@Autowired
	private MenuListSelectService menuListSelectService;
	
	@Autowired
	private CounselingModifyService counselingModifyService;
	
	// 대관 시간 입력 (대관 가능 연회장 리턴)
	@ResponseBody
	@RequestMapping("RentDateChange")
	public List<String> rentDateChange(@RequestParam(value = "rentDate") String rentDate, @RequestParam(value = "rentTime") String rentTime){
		List<String> list = rentDateChangeService.rentDateChange(rentDate, rentTime);
		return list;
	}
	
	// 대관 처리 및 예약타입에 따라 예약페이지 또는 식음료 요청 페이지로 이동
	@RequestMapping("RentInsert")
	public String rentInsert(RentCommand rentCommand, HttpServletResponse response, Model model) throws Exception{
		rentInsertService.rentInsert(rentCommand);
		Long rentNum = rentSelectNumService.rentNumSelect(rentCommand);
		Long memberNum = counselingMemberNumSelectService.memberNumSelect(rentCommand.getCounselingNum());
		bHReservationInsertService.bHReservationInsert(rentCommand, rentNum, memberNum);
		Long bHReservationNum = bHReservationNumSelectService.bHReservationNumSelect(rentCommand.getBanquetNum(), rentNum, memberNum);
		if(rentCommand.getReservationType().equals((long)2) || rentCommand.getReservationType().equals((long)4)) {
			FABCommand fabCommand = new FABCommand();
			fabCommand.setBHReservationNum(bHReservationNum);
			fabCommand.setMemberNum(memberNum);
			fabCommand.setReservationType(rentCommand.getReservationType());
			fabCommand.setCounselingNum(rentCommand.getCounselingNum());
			List<MenuDTO> menuList = menuListSelectService.menuListSelect();
			model.addAttribute("menuList", menuList);
			model.addAttribute("fabCommand", fabCommand);
			return "FAB/FAB_Form";
		}
		else if(rentCommand.getReservationType().equals((long)3)) {
			BERequestCommand bERequestCommand = new BERequestCommand();
			bERequestCommand.setBHReservationNum(bHReservationNum);
			bERequestCommand.setMemberNum(memberNum);
			bERequestCommand.setCounselingNum(rentCommand.getCounselingNum());
			model.addAttribute("bERequestCommand", bERequestCommand);
			return "BE_Request/BE_Request_Form";
		}
		else {	
			CounselingDTO counselingDTO = new CounselingDTO();
			counselingDTO.setCounselingNum(rentCommand.getCounselingNum());
			counselingDTO.setBHReservationNum(bHReservationNum);
			counselingDTO.setCounselingStatus("예약완료");
			counselingModifyService.counselingReservationCompleModify(counselingDTO);
			String path = "../BHReservation/TotalReservationDetail?bHReservationNum=";
			path += bHReservationNum.toString();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('연회일정과 대관일정이 예약되었습니다.'); location.href='" + path + "'</script>");
			out.flush();
			out.close();
			
			return "";
		}
	}
	
}
