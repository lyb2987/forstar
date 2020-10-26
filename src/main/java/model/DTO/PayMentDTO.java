package model.DTO;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayMentDTO {
	String roomReserNum;
	Integer memberNum;
	Long tpNum;
	Long roomCharge;
	String roomMeans;
	Timestamp roomDate;
	String roomStatus;
	
}
