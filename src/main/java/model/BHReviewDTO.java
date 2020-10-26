package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BHReviewDTO {
	private Long bHReviewNum;
	private Long bHReservationNum;
	private Long memberNum;
	private String bHReviewSubject;
	private Long bHReviewSatisfaction;
	private String bHReviewContent;
	private String bHReviewImprovement;
	private Timestamp bHReviewRegister;
}
