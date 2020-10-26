package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BHPaymentDTO {
	private Long bHReservationNum;
	private Long memberNum;
	private Long tpNum;
	private String bHMeans;
	private Long bHCharge;
	private Timestamp bHDate;
	private String bHStatus;
}
