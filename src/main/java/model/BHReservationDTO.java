package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BHReservationDTO {
	private Long bHReservationNum;
	private Long memberNum;
	private Long banquetNum;
	private Long rentNum;
	private String reservationStatus;
	private Timestamp reservationDate;
	private Long reservationCharge;
}
