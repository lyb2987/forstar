package command.RoomCommand;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RoomInfoCommand {
	Integer roomNum;
	Integer ratingNum;
	MultipartFile [] roomPic;
	String roomContent;
	Integer roomPay;
	
}
