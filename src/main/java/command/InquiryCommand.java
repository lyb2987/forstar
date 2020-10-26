package command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryCommand {
	private String inquirySubject;
	private String inquiryType;
	private String inquiryContent;
	
}
