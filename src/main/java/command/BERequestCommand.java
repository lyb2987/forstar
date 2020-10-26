package command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BERequestCommand {
	private Long [] bENum;
	private String bERequestDate;
	private String bERequestTime;
	private Long bHReservationNum;
	private Long memberNum;
	private Long counselingNum;
}
