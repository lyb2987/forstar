package model.DTO;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomReserDTO implements Serializable{
	String roomReserNum;
	Integer memberNum;
	Long roomNum; 
	Timestamp reserDate;
	String reserStatus;
	Long reserCharge;
	Timestamp reserStart;
	Timestamp reserEnd;
	String reserCustom;
	
}
