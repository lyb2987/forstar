package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import command.RentCommand;
import model.RentDTO;
import operatorModel.RentDateTimeDTO;

@Repository
public class RentRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.rent.Rent_Mapper";
	
	public List<String> rentDateChange(RentDateTimeDTO dto){
		String statement = namespace+".rentDateChange";
		return sqlSession.selectList(statement, dto);
	}
	
	public void rentInsert(RentDTO dto) {
		String statement = namespace+".rentInsert";
		sqlSession.insert(statement, dto);
	}
	
	public int rentNumSelect(RentCommand rc) {
		String statement = namespace+".rentNumSelect";
		return sqlSession.selectOne(statement, rc);
	}
	
	public void rentDelete(Long rentNum) {
		String statement = namespace+".rentDelete";
		sqlSession.delete(statement, rentNum);
	}
	
}
