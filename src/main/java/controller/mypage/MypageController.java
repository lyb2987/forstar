package controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.DTO.AuthInfo;
import service.Room.RoomService;
import service.member.MemberDetailService;

@Controller

@RequestMapping("mypage")
public class MypageController {
	@Autowired
	MemberDetailService memberDetailService;
	@Autowired
	RoomService roomService;
	
	@RequestMapping("MyHome")
	public String myHome(Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String memberId = authInfo.getId();
		roomService.roomReserMemberList(model,session);
		memberDetailService.memberDetail(memberId, model);
		return "Myhome/My_Page";
	}
}
