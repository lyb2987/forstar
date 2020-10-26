package command.RoomCommand;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CleaningCommand {
	Long cleaningNum;
	String roomReserNum;
	Long laundryNum;
	Long employeeNum;
	Integer memberNum;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	Date cleaningClear;
	
}
