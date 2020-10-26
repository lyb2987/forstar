package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CounselingDTO {

	private Long counselingNum;
	private Long memberNum;
	private Long employeeNum;
	private String counselingSubject;
	private Timestamp counselingDate;
	private String counselingType;
	private String counselingPurpose;
	private String counselingContent;
	private String counselingStatus;
	private String counselingUniqueness;
	private Long bHReservationNum;
}
