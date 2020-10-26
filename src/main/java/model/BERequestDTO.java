package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BERequestDTO {
	private Long bERequestNum;
	private Long bHReservationNum;
	private Long bENum;
	private Long employeeNum;
	private Long memberNum;
	private Timestamp bERequestDate;
	private Timestamp bERequestTime;
}
