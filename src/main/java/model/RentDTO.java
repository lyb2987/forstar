package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RentDTO {
	private Long rentNum;
	private String rentBanquetHall;
	private Timestamp rentDate;
	private Timestamp rentTime;
	private Long rentCharge;
}
