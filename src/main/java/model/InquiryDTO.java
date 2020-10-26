package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryDTO {

	private int inquiryNum;
	private int memberNum;
	private int employeeNum;
	private String inquirySubject;
	private String inquiryType;
	private String inquiryContent;
	private Timestamp inquiryDate;
	private String inquiryAnswer;
	private String inquiryStatus;
	
}
