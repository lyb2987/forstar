package command.RoomCommand;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RoomReserCommand {
	String roomReserNum;
	Integer memberNum;
	Long roomNum;
	 @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) 
	LocalDateTime reserDate;
	String reserStatus;
	Long reserCharge;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	Date reserStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	Date reserEnd;
	String reserCustom;
}
