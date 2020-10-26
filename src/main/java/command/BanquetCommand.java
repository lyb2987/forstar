package command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BanquetCommand {
	private String banquetType;
	private String banquetPurpose;
	private String banquetRequest;
	private Long banquetCharge;
	private Long counselingNum;
	private Long reservationType;
}
