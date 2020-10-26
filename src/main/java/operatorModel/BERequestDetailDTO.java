package operatorModel;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import model.BEDTO;
import model.EmployeeDTO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BERequestDetailDTO {
	private Long bERequestNum;
	private Long bHReservationNum;
	private Long bENum;
	private Long employeeNum;
	private Long memberNum;
	private Timestamp bERequestDate;
	private Timestamp bERequestTime;
	
	private BEDTO be;
	private EmployeeDTO employee;
}
