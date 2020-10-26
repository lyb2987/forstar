package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import command.BanquetCommand;
import model.BanquetDTO;

@Repository
public class BanquetRepository {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace="mappers.banquet.Banquet_Mapper";
	
	public void banquetInsert(BanquetDTO dto) {
		String statement = namespace+".banquetInsert";
		sqlSession.insert(statement, dto);
	}
	
	public int banquetNumSelect(BanquetCommand bc) {
		String statement = namespace+".banquetNumSelect";
		return sqlSession.selectOne(statement, bc);
	}
	
	public BanquetDTO banquetSelect(Long bHReservationNum) {
		String statement = namespace+".banquetSelect";
	return sqlSession.selectOne(statement, bHReservationNum);
	}
	
	public void banquetModify(BanquetDTO dto) {
		String statement = namespace+".banquetModify";
		sqlSession.update(statement, dto);
	}
	
	public void banquetDelete(Long banquetNum) {
		String statement = namespace+".banquetDelete";
		sqlSession.update(statement, banquetNum);
	}
}
