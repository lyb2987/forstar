package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BHPaymentDTO;

@Repository
public class BHPaymentRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.bhpayment.BHPayment_Mapper";
	
	public void bHPaymentInsert(BHPaymentDTO dto) {
		String statement = namespace+".bHPaymentInsert";
		sqlSession.insert(statement, dto);
	}

	public BHPaymentDTO bHPaymentSelect(Long randNum) {
		String statement = namespace+".bHPaymentSelect";
		return sqlSession.selectOne(statement, randNum);
	}
	
	public void bHPaymentDelete(Long tpNum) {
		String statement = namespace+".bHPaymentDelete";
		sqlSession.delete(statement, tpNum);
	}
	
	public void bHPaymentCompleUpdate(Long tpNum) {
		String statement = namespace+".bHPaymentCompleUpdate";
		sqlSession.update(statement, tpNum);
	}
	
}
