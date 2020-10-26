package controller.room;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.RoomCommand.AddPayMentMainCommand;
import command.RoomCommand.PayMentCommand;
import command.RoomCommand.RoomOrderCommand;
import command.RoomCommand.RoomReserCommand;
import model.DTO.AuthInfo;
import service.Room.RoomService;
import service.RoomAdmin.RoomAdminService;
import service.member.MemberDetailService;
import validator.RoomReserValidator;

@Controller
public class RoomController {
	@Autowired
	RoomService roomService;
	@Autowired
	RoomAdminService roomAdminService;
	@Autowired
	MemberDetailService memberDetailService;
	
	// 객실 예약
	@RequestMapping(value = "/room/roomreser")
	public String roomReser(RoomReserCommand roomReserCommand, Model model) {
		System.out.println("room_reser");
		return "room/room_Reser";
	}

	// 객실 대여 리스트
	@RequestMapping(value = "/room/openroomlist")
	public String openroomlist(@RequestParam(value = "date") String reserEnd, Model model) {
		System.out.println(reserEnd);
		roomService.openroomList(reserEnd, model);
		return "room/room_OpenRoom";
	}

	// 객실정보
	@RequestMapping(value = "/room/roomclist")
	public String roomClist(@RequestParam(value = "num") Integer roomNum, Model model) {
		roomAdminService.roomClist(roomNum, model);
		return "room_admin/room_Clist";
	}

	// 객실 예약 등록 컨트롤러
	@RequestMapping(value = "/room/roomReserPro", method = RequestMethod.POST)
	public String roomReserPro(RoomReserCommand roomReserCommand, Errors errors,HttpSession session) {
		System.out.println(roomReserCommand);
		new RoomReserValidator().validate(roomReserCommand, errors);
		if (errors.hasErrors()) {
			return "room/room_Reser";
		}

		roomService.roomReserInsert(roomReserCommand, session);

		return "room/room_success";
	}

	// 룸서비스 주문
	@RequestMapping(value = "/room/roomorder")
	public String roomOrder(RoomOrderCommand roomOrderCommand, Model model, HttpSession session) {
		System.out.println("room_order");
		roomService.roomReserMemberList(model,session);
		roomService.restaurantList(model); // 임시메뉴서비스리스트불러오기
		return "room/room_Order";
	}

	// 메뉴정보 임시
	@RequestMapping(value = "/room/roomrestaurantlist")
	public String roomRestaurantList(@RequestParam(value = "num") Long restaurantNum, Model model) {
		roomService.roomRestaurantList(restaurantNum, model);
		return "room/room_RmenuList";
	}

	// 룸서비스 주문 등록 컨트롤러
	@RequestMapping(value = "/room/roomOrderPro", method = RequestMethod.POST)
	public String roomOrderPro(RoomOrderCommand roomOrderCommand) {
		System.out.println(roomOrderCommand);
		roomService.roomOrderInsert(roomOrderCommand);
		return "redirect:/roomadmin";
	}

	// 추가결제
	@RequestMapping(value = "/room/roomaddpayment")
	public String roomAddPayment(Model model, HttpSession session) {
		System.out.println("room_addpayment");
		roomService.roomOrderList(model,session);
		return "room/room_AddPayment";
	}
	// 추가결제 요청API
	@RequestMapping(value = "/room/roomtotalpayment")
	public String roomtotalpayment(Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String memberId = authInfo.getId();
		Integer memberNum = authInfo.getMemberNum();
		memberDetailService.memberDetail(memberId, model);
		roomService.roomTotalpaymentList(model,memberNum);
		return "room/room_Totalpayment";
	}
	// 추가결제 요청API
		@RequestMapping(value = "/room/roomtotalpaymentpro")
		public String roomtotalpaymentpro(AddPayMentMainCommand addPayMentMainCommand) {
			roomService.roomtotalpaymentpro(addPayMentMainCommand);
			return "room/room_Totalpayment";
		}

	// 추가결제 룸서비스 주문 정보
	@RequestMapping(value = "/room/roomorderlist")
	public String roomOrderMemberList(@RequestParam(value = "list") Long orderNum, Model model) {
		roomService.roomOrderMemberList(orderNum, model);
		roomService.addPayMentList(orderNum, model);
		return "room/room_RmenuOrderList";
	}

	// 추가결제 등록 컨트롤러
	@RequestMapping(value = "/room/addpaymentPro", method = RequestMethod.POST)
	public String addPaymentPro(AddPayMentMainCommand addPayMentMainCommand) {
		System.out.println(addPayMentMainCommand);
		roomService.addPaymentInsert(addPayMentMainCommand);
		return "redirect:/room/roomtotalpayment";
	}

	// 객실결제
	@RequestMapping(value = "/room/roompayment")
	public String roomPayment(Model model, HttpSession session) {
		System.out.println("room_roompayment");
		roomService.roomReserMemberList(model, session);
		return "room/room_Payment";
	}

	// 객실결제 총 요금
	@RequestMapping(value = "/room/roompaymentlist")
	public String roomPaymentList(@RequestParam(value = "num") String roomReserNum, Model model) {
		roomService.roomPaymentList(roomReserNum, model);
		return "room/room_RoomPaymentList";
	}

	// 객실결제 등록 컨트롤러
	@RequestMapping(value = "/room/roompaymentPro", method = RequestMethod.POST)
	public String roompaymentPro(PayMentCommand payMentCommand) {
		System.out.println(payMentCommand);
		roomService.roomPaymentInsert(payMentCommand);
		return "redirect:/roomadmin";
	}
}
