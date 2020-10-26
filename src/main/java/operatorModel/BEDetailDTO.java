package operatorModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import model.EmployeeDTO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BEDetailDTO {
	private Long bENum;
	private Long employeeNum;
	private Long bECharge;
	private String bEDuties;
	
	private EmployeeDTO employee;
}
