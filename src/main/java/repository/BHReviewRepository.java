package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BHReviewDTO;
import model.StartEndPageDTO;

@Repository
public class BHReviewRepository {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace="mappers.bhreview.BHReview_Mapper";
	
	public void bHReviewInsert(BHReviewDTO dto) {
		String statement = namespace + ".bHReviewInsert";
		sqlSession.insert(statement, dto);
	}
	
	public List<BHReviewDTO> bHReviewListSelect(StartEndPageDTO dto){
		String statement = namespace + ".bHReviewListSelect";
		return sqlSession.selectList(statement, dto);
	}
	
	public int getBHReviewCount() {
		String statement = namespace + ".getBHReviewCount";
		return sqlSession.selectOne(statement);
	}
	
	public void bHReviewModify(BHReviewDTO dto) {
		String statement = namespace + ".bHReviewModify";
		sqlSession.update(statement, dto);
	}
	

	public void bHReviewDelete(Long bHReviewNum) {
		String statement = namespace + ".bHReviewDelete";
		sqlSession.delete(statement, bHReviewNum);
	}
}
