package command.RoomCommand;


import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayMentCommand implements Serializable{
	String roomReserNum;
	Integer memberNum;
	Long tpNum;
	Long roomCharge;
	String roomMeans;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) 
	LocalDateTime roomDate;
	String roomStatus;
	
}
