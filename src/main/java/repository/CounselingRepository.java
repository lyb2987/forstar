package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CounselingDTO;
import model.StartEndPageDTO;

@Repository
public class CounselingRepository {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace="mappers.counseling.Counseling_Mapper";
	
	public void counselingInsert(CounselingDTO dto) {
		String statement = namespace+".counselingInsert";
		sqlSession.insert(statement, dto);
	}
	
	public List<CounselingDTO> counselingListSelect(StartEndPageDTO dto){
		String statement = namespace+".counselingSelect";
		return sqlSession.selectList(statement, dto);
	}
	
	public int counselingCount(StartEndPageDTO dto) {
		String statement = namespace+".counselingCount";
		return sqlSession.selectOne(statement, dto);
	}
	
	public void counselingOngoingModify(CounselingDTO dto) {
		String statement = namespace+".counselingOngoingModify";
		sqlSession.update(statement, dto);
	}
	
	public void counselingCompleModify(CounselingDTO dto) {
		String statement = namespace+".counselingCompleModify";
		sqlSession.update(statement, dto);
	}
	
	public void counselingCancleModify(CounselingDTO dto) {
		String statement = namespace+".counselingCancleModify";
		sqlSession.update(statement, dto);
	}
	
	public void counselingDelete(Long counselingDelete) {
		String statement = namespace+".counselingDelete";
		sqlSession.delete(statement, counselingDelete);
	}
	
	public void counselingReserveModify(CounselingDTO dto) {
		String statement = namespace+".counselingReserveModify";
		sqlSession.update(statement, dto);
	}
	
	public void counselingReserveCancleModify(CounselingDTO dto) {
		String statement = namespace+".counselingReserveCancleModify";
		sqlSession.update(statement, dto);
	}
	
	public void counselingReservationCompleModify(CounselingDTO dto) {
		String statement = namespace+".counselingReservationCompleModify";
		sqlSession.update(statement, dto);
	}
	
	public int memberNumSelect(Long counselingNum) {
		String statement = namespace+".memberNumSelect";
		return sqlSession.selectOne(statement, counselingNum);
	}
	
	public CounselingDTO counselingSelectByBHRNum(Long bHReservationNum) {
		String statement = namespace+".counselingSelectByBHRNum";
		return sqlSession.selectOne(statement, bHReservationNum);
	}
}
