package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BEDTO;
import operatorModel.BEDetailDTO;
import operatorModel.BERequestDetailDTO;

@Repository
public class BERepository {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace="mappers.be.BE_Mapper";
	
	public List<BEDTO> bEListSelect(){
		String statement = namespace+".bEListSelect";
		return sqlSession.selectList(statement);
	}
	
	public void bEInsert(BEDTO dto) {
		String statement = namespace+".bEInsert";
		sqlSession.insert(statement, dto);
	}
	
	public List<BEDetailDTO> bEDetailListSelect(){
		String statement = namespace + ".bEDetailListSelect";
		return sqlSession.selectList(statement);
	}
	
}
