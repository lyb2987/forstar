package service.Room;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.RoomCommand.AddPayMentMainCommand;
import command.RoomCommand.PayMentCommand;
import command.RoomCommand.RoomOrderCommand;
import command.RoomCommand.RoomReserCommand;
import model.MenuDTO;
import model.DTO.AddPayMentDTO;
import model.DTO.AddPayMentMainDTO;
import model.DTO.AuthInfo;
import model.DTO.OpenRoomDTO;
import model.DTO.PayMentDTO;
import model.DTO.RoomOrderDTO;
import model.DTO.RoomReserDTO;
import repository.Room.RoomRepository;



@Service
public class RoomService {
	@Autowired
	RoomRepository roomRepository;
	
	//객실 예약 등록
	public void roomReserInsert(RoomReserCommand roomReserCommand,HttpSession session) {
		RoomReserDTO dto = new RoomReserDTO();
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		dto.setMemberNum((authInfo.getMemberNum()));
		dto.setRoomReserNum(roomReserCommand.getRoomReserNum());
		dto.setRoomNum(roomReserCommand.getRoomNum());
		Timestamp reserDate = 
				Timestamp.valueOf(roomReserCommand.getReserDate());
		dto.setReserDate(reserDate);
		dto.setReserCharge(roomReserCommand.getReserCharge());
		Timestamp reserStart = 
				new Timestamp(roomReserCommand.getReserStart().getTime());
		dto.setReserStart(reserStart);
		Timestamp reserEnd = 
				new Timestamp(roomReserCommand.getReserEnd().getTime());
		dto.setReserEnd(reserEnd);
		dto.setReserStatus(roomReserCommand.getReserStatus());
		dto.setReserCustom(roomReserCommand.getReserCustom());
		System.out.println(dto);
			roomRepository.roomReserInsert(dto);
		
	}
	
	//예약 리스트
	public void roomReserList(Model model) {
		List<RoomReserDTO> list =roomRepository.roomReserList();
		model.addAttribute("rrlist", list);
	}
	//고객정보로 예약리스트 불러오기
	public void roomReserMemberList(Model model,HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		Integer memberId = authInfo.getMemberNum();
		List<RoomReserDTO> list =roomRepository.roomReserMemberList(memberId);
		System.out.println(list);
		model.addAttribute("mrlist", list);
	}
	//임시 메뉴리스트 불러오기
	public void restaurantList(Model model) {
		List<MenuDTO> list =roomRepository.restaurantList();
		System.out.println(list);
		model.addAttribute("rnlist", list);
		
	}
	//룸서비스 등록
	public void roomOrderInsert(RoomOrderCommand roomOrderCommand) {
		RoomOrderDTO dto = new RoomOrderDTO();
		dto.setOrderNum(roomOrderCommand.getOrderNum());
		dto.setRoomReserNum(roomOrderCommand.getRoomReserNum());
		dto.setMemberNum(roomOrderCommand.getMemberNum());
		dto.setMenuName(roomOrderCommand.getMenuName());
		dto.setRestaurantNum(roomOrderCommand.getRestaurantNum());
		dto.setOrderCount(roomOrderCommand.getOrderCount());
		dto.setOrderEtc(roomOrderCommand.getOrderEtc());
		
		roomRepository.roomOrderInsert(dto);
	}
	//메뉴 레스토랑 명 리스트
	public void roomRestaurantList(Long restaurantNum, Model model) {
		List<MenuDTO> list =roomRepository.restaurantMenuList(restaurantNum);
		model.addAttribute("mmlist", list);
		
	}
	
	//룸서비스 주문 주문번호 리스트
	public void roomOrderList(Model model,HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		Integer memberId = authInfo.getMemberNum();
		System.out.println(authInfo.getMemberNum());
		List<RoomOrderDTO> list =roomRepository.roomOrderList(memberId);
		model.addAttribute("rolist", list);
	}
	//추가결제 고객번호로 주문번호 리스트
	public void roomOrderMemberList(Long orderNum, Model model) {
		List<RoomOrderDTO> list = roomRepository.roomOrderMemberList(orderNum);
		model.addAttribute("romlist", list);
	}
	//추가결제 총합계금액 리스트 
	public void addPayMentList(Long orderNum,Model model) {
		List<AddPayMentDTO> list = roomRepository.addPayMentList(orderNum);
		System.out.println(list);
		model.addAttribute("apmlist", list);
	}
	//추가결제 등록
	public void addPaymentInsert(AddPayMentMainCommand addPayMentMainCommand) {
		AddPayMentMainDTO dto = new AddPayMentMainDTO();
		dto.setAddpaymentNum(addPayMentMainCommand.getAddpaymentNum());
		dto.setOrderNum(addPayMentMainCommand.getOrderNum());
		dto.setRoomReserNum(addPayMentMainCommand.getRoomReserNum());
		dto.setMemberNum(addPayMentMainCommand.getMemberNum());
		dto.setAddpaymentStatus(addPayMentMainCommand.getAddpaymentStatus());
		dto.setAddpaymentMeans(addPayMentMainCommand.getAddpaymentMeans());
		dto.setAddpaymentCharge(addPayMentMainCommand.getAddpaymentCharge());
		roomRepository.addPaymentInsert(dto);
	}
	//객실결제 총요금
	public void roomPaymentList(String roomReserNum, Model model) {
		List<RoomReserDTO> list = roomRepository.roomPaymentList(roomReserNum);
		System.out.println(list);
		model.addAttribute("rplist", list);
	}

	public void roomPaymentInsert(PayMentCommand payMentCommand) {
		 PayMentDTO dto = new PayMentDTO(); 
		dto.setRoomReserNum(payMentCommand.getRoomReserNum());
		dto.setMemberNum(payMentCommand.getMemberNum());
		dto.setTpNum(payMentCommand.getTpNum());
		dto.setRoomCharge(payMentCommand.getRoomCharge());
		dto.setRoomMeans(payMentCommand.getRoomMeans());
		
		Timestamp roomDate = 
				Timestamp.valueOf(payMentCommand.getRoomDate());
		
		dto.setRoomDate(roomDate);
		dto.setRoomStatus(payMentCommand.getRoomStatus());
		System.out.println(dto);
		roomRepository.roomPaymentInsert(dto);
	}
	
	//객실대여가능리스트
	public void openroomList(String reserEnd, Model model) {
		List<OpenRoomDTO> list = roomRepository.openroomList(reserEnd);
		System.out.println(list);
		model.addAttribute("orlist", list);
	}
	
	//추가결제 요청
	public void roomTotalpaymentList(Model model,Integer memberNum) {
		List<AddPayMentMainDTO> list = roomRepository.roomTotalpaymentList(memberNum);
		System.out.println(list);
		model.addAttribute("paylist", list);
	}

	public void roomtotalpaymentpro(AddPayMentMainCommand addPayMentMainCommand) {
		AddPayMentMainDTO dto = new AddPayMentMainDTO();
		dto.setOrderNum(addPayMentMainCommand.getOrderNum());
		dto.setAddpaymentMeans(addPayMentMainCommand.getAddpaymentMeans());
		roomRepository.addPaymentUpdate(dto);
	}

}
