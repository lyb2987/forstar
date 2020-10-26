package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BEDTO {
	private Long bENum;
	private Long employeeNum;
	private Long bECharge;
	private String bEDuties;
}
