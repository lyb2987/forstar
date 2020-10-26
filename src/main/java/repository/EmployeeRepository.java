package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EmployeeDTO;

@Repository
public class EmployeeRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.employee.Employee_Mapper";
	
	public List<EmployeeDTO> employeeListSelect(){
		String statement = namespace+".employeeListSelect";
		return sqlSession.selectList(statement);
	}
	
	public int employeeSelectByEmployeeNum(Long employeeNum) {
		String statement = namespace+".employeeSelectByEmployeeNum";
		return sqlSession.selectOne(statement, employeeNum);
	}
	
	public int employeeNumCheck(Long randNum) {
		String statement = namespace+".employeeNumCheck";
		return sqlSession.selectOne(statement, randNum);
	}
}
