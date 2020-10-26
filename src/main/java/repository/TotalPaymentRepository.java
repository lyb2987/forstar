package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.TotalPaymentDTO;

@Repository
public class TotalPaymentRepository {
	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.totalpayment.TOTAL_PAYMENT_Mapper";
	
	public int totalPaymentNumCheck(Long randNum) {
		String statement = namespace+".totalPaymentNumCheck";
		return sqlSession.selectOne(statement, randNum);
	}
	
	public void totalPaymentInsert(TotalPaymentDTO dto) {
		String statement = namespace+".totalPaymentInsert";
		sqlSession.insert(statement, dto);
	}

	public TotalPaymentDTO totalPaymentSelect(Long randNum) {
		String statement = namespace+".totalPaymentSelect";
		return sqlSession.selectOne(statement, randNum);
	}
	
	public void totalPaymentDelete(Long tpNum) {
		String statement = namespace+".totalPaymentDelete";
		sqlSession.delete(statement, tpNum);
	}
}
