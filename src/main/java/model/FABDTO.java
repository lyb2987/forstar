package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FABDTO {
	private Long fabNum;
	private Long bHReservationNum;
	private Long memberNum;
	private String menuName;
	private Long restaurantNum;
	private Timestamp fabDate;
	private Long fabNoP;
	private Long fabCharge;
}
