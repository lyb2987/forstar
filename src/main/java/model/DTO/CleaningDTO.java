package model.DTO;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CleaningDTO implements Serializable{
	Long cleaningNum;
	String roomReserNum;
	Long laundryNum;
	Long employeeNum;
	Integer memberNum;
	Timestamp cleaningClear;
	
}
