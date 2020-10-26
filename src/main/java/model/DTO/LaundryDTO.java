package model.DTO;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LaundryDTO implements Serializable{
	Integer laundryNum;
	Timestamp laundryBad;
	Timestamp laundryChange;
	Timestamp laundryPrevention;
		
}
