package service.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.EmployeeDTO;
import repository.EmployeeRepository;

@Service
public class EmployeeListService {
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	public List<EmployeeDTO> employeeListSelect(){
		return employeeRepository.employeeListSelect();
	}
	
	public int employeeSelectByEmployeeNum(Long employeeNum) {
		return employeeRepository.employeeSelectByEmployeeNum(employeeNum);
	}
	
	public int employeeNumCheck(Long randNum) {
		return employeeRepository.employeeNumCheck(randNum);
	}
}
