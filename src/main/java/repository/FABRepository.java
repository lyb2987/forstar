package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FABDTO;

@Repository
public class FABRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.fab.FAB_Mapper";
	
	public void fabInsert(FABDTO dto) {
		String statement = namespace+".fabInsert";
		sqlSession.insert(statement, dto);
	}
	
	public FABDTO fabSelect(Long bHReservationNum) {
		String statement = namespace+".fabSelect";
		return sqlSession.selectOne(statement, bHReservationNum);
	}
	
	public void fabModify(FABDTO dto) {
		String statement = namespace+".fabModify";
		sqlSession.update(statement, dto);
	}
	
	public void fabDelete(Long bHReservationNum) {
		String statement = namespace+".fabDelete";
		sqlSession.delete(statement, bHReservationNum);
	}
}
