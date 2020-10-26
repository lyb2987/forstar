package command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RentCommand {
	private String rentBanquetHall;
	private String rentDate;
	private String rentTime;
	private Long rentCharge;
	private Long counselingNum;
	private Long reservationType;
	private Long banquetNum;
}
