package command.RoomCommand;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LaundryCommand {
	Integer laundryNum;
	 @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) 
	LocalDateTime laundryBad;
	 @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	LocalDateTime laundryChange;
	 @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	LocalDateTime laundryPrevention;
	
}
