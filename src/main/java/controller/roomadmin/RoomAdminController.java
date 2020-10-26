package controller.roomadmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.RoomCommand.CleaningCommand;
import command.RoomCommand.LaundryCommand;
import command.RoomCommand.RoomClassCommand;
import command.RoomCommand.RoomInfoCommand;
import service.Room.RoomService;
import service.RoomAdmin.RoomAdminService;
import validator.LaundryValidator;
import validator.RoomAdminCommandValidator;

@Controller
public class RoomAdminController {
	@Autowired
	RoomAdminService roomAdminService;
	@Autowired
	RoomService roomService;

	@RequestMapping(value = "/roomadmin")
	public String roomAdmin() {
		System.out.println("room_admin");
		return "room_admin/room_admin";
	}

	// 객실등급 등록 시작페이지
	@RequestMapping(value = "/roomadmin/roomclass")
	public String roomClass(RoomClassCommand roomClassCommand) {
		System.out.println("room_class");
		return "room_admin/room_Class";
	}

	// 객실등급 등록 컨트롤러
	@RequestMapping(value = "/roomadmin/roomClassPro", method = RequestMethod.POST)
	public String roomClassPro(RoomClassCommand roomClassCommand, Errors errors) {
		new RoomAdminCommandValidator().validate(roomClassCommand, errors);
		if (errors.hasErrors()) {
			return "room_admin/room_Class";
		}
		roomAdminService.roomClassInsert(roomClassCommand);

		return "redirect:/roomadmin";
	}

	// 객실 등록 시작페이지
	@RequestMapping("/roomadmin/roominfo")
	public String roomInfo(Model model) {
		System.out.println("room_info");
		roomAdminService.roomClassList(model);
		return "room_admin/room_Info";
	}

	// 객실 등록 컨트롤러
	@RequestMapping(value = "/roomadmin/roomInfoPro", method = RequestMethod.POST)
	public String roomInfoPro(RoomInfoCommand roomInfoCommand, HttpSession session, HttpServletRequest request) {
		roomAdminService.roomInfoPro(roomInfoCommand, session, request);
		return "redirect:/roomadmin/roomList";
	}

	// 객실 리스트
	@RequestMapping("/roomadmin/roomList")
	public String roomList(Model model) {
		System.out.println("room_list");
		roomAdminService.roomList(model);
		return "room_admin/room_List";
	}

	// 객실 정보
	@RequestMapping("/roomadmin/roomModify")
	public String roomModify(@RequestParam(value = "num") Integer roomNum, Model model) {
		roomAdminService.roomClassList(model);
		roomAdminService.roomModify(roomNum, model);
		return "room_admin/room_Modify";
	}

	// 객실 수정 컨트롤러
	@RequestMapping("/roomadmin/roomModifyPro")
	public String roomModifyPro(RoomInfoCommand roomInfoCommand, HttpSession session) {
		String path = roomAdminService.roomModifyPro(roomInfoCommand, session);
		return path;
	}

	// 청소목록 시작페이지
	@RequestMapping("/roomadmin/laundry")
	public String laundry(LaundryCommand LaundryCommand) {
		System.out.println("room_laundry");
		return "room_admin/room_Laundry";
	}

	// 청소목록 등록 컨트롤러
	@RequestMapping(value = "/roomadmin/laundryPro", method = RequestMethod.POST)
	public String laundryPro(LaundryCommand laundryCommand, Errors errors) {
		new LaundryValidator().validate(laundryCommand, errors);
		System.out.println(laundryCommand);
		if (errors.hasErrors()) {
			return "room_admin/room_Laundry";
		}
		roomAdminService.laundryPro(laundryCommand);
		return "redirect:/roomadmin";
	}
	
	//청소요청 시작페이지
	@RequestMapping("/roomadmin/cleaning")
	public String cleaNing(LaundryCommand LaundryCommand,Model model) {
		System.out.println("room_cleaning");
		roomAdminService.laundryList(model); //청소목록
		roomService.roomReserList(model); //객실예약
		//직원가져올것
		//고객가져올것
		return "room_admin/room_Cleaning";
	}
	@RequestMapping(value = "/roomadmin/cleaningPro", method = RequestMethod.POST)
	public String cleaningPro(CleaningCommand cleaningCommand) {
		System.out.println(cleaningCommand);
		roomAdminService.cleaningPro(cleaningCommand);
		return "redirect:/roomadmin";
	}
}
