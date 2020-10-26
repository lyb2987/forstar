package command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BECommand {
	private Long bENum;
	private Long bECharge;
	private String bEDuties;
}
