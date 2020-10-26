package model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeDTO {
	private Long employeeNum;
	private Long departmentNum;
	private Long positionNum;
	private String employeeEmail;
	private String employeePhone;
	private String employeePhone2;
	private Long employeePay;
	private String employeeBank;
	private Long employeeBankNum;
	private Timestamp employeeJoinDay;
	private String employeeName;
}
