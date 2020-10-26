package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TotalPaymentDTO {
	private Long tpNum;
	private Long tpTotalPrice; 
}
