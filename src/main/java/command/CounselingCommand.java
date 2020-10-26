package command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CounselingCommand {

	private Long memberNum;
	private String counselingSubject;
	private String counselingDate;
	private String counselingType;
	private String counselingPurpose;
	private String counselingContent;
}
