package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BanquetDTO {
	private Long banquetNum;
	private String banquetType;
	private String banquetPurpose;
	private String banquetRequest;
	private Long banquetCharge;
}
