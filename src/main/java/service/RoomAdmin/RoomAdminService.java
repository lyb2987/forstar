package service.RoomAdmin;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import command.RoomCommand.CleaningCommand;
import command.RoomCommand.LaundryCommand;
import command.RoomCommand.RoomClassCommand;
import command.RoomCommand.RoomInfoCommand;
import model.DTO.CleaningDTO;
import model.DTO.LaundryDTO;
import model.DTO.RoomAdminClassDTO;
import model.DTO.RoomInfoDTO;
import repository.RoomAdmin.RoomAdminRepository;


@Service
public class RoomAdminService {
	@Autowired
	RoomAdminRepository roomAdminRepository;
	private RoomInfoDTO RoomInfoDTO; 
	
	//객실예약룸 리스트
	public void roomClist(Integer roomNum, Model model) {
		List<RoomInfoDTO> list =roomAdminRepository.roomClist(roomNum);
		model.addAttribute("rclist", list);
				
	}
	
	//객실등급 불러오기
	public void roomClassList(Model model) {
		List<RoomAdminClassDTO> list =roomAdminRepository.roomClassList();
		model.addAttribute("list", list);
	}
	
	//객실등급 등록
	public void roomClassInsert(RoomClassCommand roomClassCommand) {
		RoomAdminClassDTO dto = new RoomAdminClassDTO();
		dto.setRatingNum(roomClassCommand.getRatingNum());
		dto.setRatingName(roomClassCommand.getRatingName());
		dto.setRatingBad(roomClassCommand.getRatingBad());
		dto.setRatingAcreage(roomClassCommand.getRatingAcreage());
		dto.setRatingView(roomClassCommand.getRatingView());
		dto.setRatingPeople(roomClassCommand.getRatingPeople());
		roomAdminRepository.roomClassInsert(dto);
	}
	//객실 등록
	public void roomInfoPro(RoomInfoCommand roomInfoCommand, HttpSession session, HttpServletRequest request) {
			RoomInfoDTO dto = new RoomInfoDTO();
			dto.setRoomNum(roomInfoCommand.getRoomNum());
			dto.setRatingNum(roomInfoCommand.getRatingNum());
			dto.setRoomContent(roomInfoCommand.getRoomContent());
			dto.setRoomPay(roomInfoCommand.getRoomPay());
			String storeTotal = "";
			
			for(MultipartFile mf : roomInfoCommand.getRoomPic()) {
				String original = mf.getOriginalFilename();
				String originalFileExtension = 
						original.substring(original.lastIndexOf("."));
				String store = UUID.randomUUID().toString().replace("-", "")
						+ originalFileExtension;
				

				storeTotal += store +"`";

				String path = request.getServletContext().getRealPath("/");
				path += "WEB-INF\\view\\room_admin\\upload\\";
				
				File file = new File(path + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dto.setRoomPic(storeTotal);
			roomAdminRepository.roomInsert(dto);
					
	}
	//객실 리스트
	public void roomList(Model model) {
		List<RoomInfoDTO> list =roomAdminRepository.roomList();
		int listCount = roomAdminRepository.roomCount();
		model.addAttribute("list", list);
		model.addAttribute("roomCount", listCount);
	}
	
	//객실 수정 
	public void roomModify(Integer roomNum, Model model) {
		RoomInfoDTO dto = roomAdminRepository.roomModify(roomNum);
		model.addAttribute("list", dto);
		List<RoomAdminClassDTO> list = roomAdminRepository.roomClassList();
		model.addAttribute("rclist", list);
				
	}

	public String roomModifyPro(RoomInfoCommand roomInfoCommand, HttpSession session) {
		
		String originalTotal = "";
		String storeTotal = "";
		
		File file = null;
		String path1 = "WEB-INF\\view\\room_admin\\upload\\";
		String filePath = session.getServletContext().getRealPath(path1);
		
		 
			RoomInfoDTO dto = new RoomInfoDTO();
			dto.setRoomNum(roomInfoCommand.getRoomNum());
			dto.setRatingNum(roomInfoCommand.getRatingNum());
			dto.setRoomContent(roomInfoCommand.getRoomContent());
			dto.setRoomPay(roomInfoCommand.getRoomPay());
			
			Integer roomNum = roomInfoCommand.getRoomNum();
			
			try {
		if (roomInfoCommand.getRoomPic() != null) {
			for(MultipartFile mf : roomInfoCommand.getRoomPic()) {
			String original = mf.getOriginalFilename();
			String originalFileExtension = 
					original.substring(original.lastIndexOf("."));
			String store = UUID.randomUUID().toString().replace("-", "")
					+ originalFileExtension;
			storeTotal += store +"`";
			file = new File(filePath + "/" + store);
			System.out.println("파일경로"+file);
			try {
				mf.transferTo(file);
			}catch(Exception e) {e.printStackTrace();}
		  }
			dto.setRoomPic(storeTotal);
			roomAdminRepository.roomUpdate(dto);
		}
		if (roomInfoCommand.getRoomPic() == null) {
		RoomInfoDTO list =  roomAdminRepository.roomModifyList(roomNum);
		dto.setRoomPic((list.getRoomPic()));
		roomAdminRepository.roomUpdate(dto);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/roomadmin/roomList";
	}
	
	//청소목록 등록
	public void laundryPro(LaundryCommand laundryCommand) {
		LaundryDTO dto = new LaundryDTO();
		dto.setLaundryNum(laundryCommand.getLaundryNum());
		Timestamp laundryBad = 
				Timestamp.valueOf(laundryCommand.getLaundryBad());
		Timestamp laundryChange = 
				Timestamp.valueOf(laundryCommand.getLaundryChange());
		Timestamp laundryPrevention = 
				Timestamp.valueOf(laundryCommand.getLaundryPrevention());
		dto.setLaundryBad(laundryBad);
		dto.setLaundryChange(laundryChange);
		dto.setLaundryPrevention(laundryPrevention);
		roomAdminRepository.laundryInsert(dto);
		
	}
	//청소요청 등록
	public void cleaningPro(CleaningCommand cleaningCommand) {
		CleaningDTO dto = new CleaningDTO();
		dto.setCleaningNum(cleaningCommand.getCleaningNum());
		dto.setRoomReserNum(cleaningCommand.getRoomReserNum());
		dto.setLaundryNum(cleaningCommand.getLaundryNum());
		dto.setEmployeeNum(cleaningCommand.getEmployeeNum());
		dto.setMemberNum(cleaningCommand.getMemberNum());
		Timestamp cleaningClear = 
				new Timestamp(cleaningCommand.getCleaningClear().getTime());
		dto.setCleaningClear(cleaningClear);
		roomAdminRepository.cleaningInsert(dto);
	}

	public void laundryList(Model model) {
		List<LaundryDTO> list =roomAdminRepository.laundryList();
		model.addAttribute("ldlist", list);
	}

}
