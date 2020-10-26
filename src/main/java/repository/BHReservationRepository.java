package repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BHReservationDTO;
import model.StartEndPageDTO;
import operatorModel.ReservationChargeDTO;
import operatorModel.TotalReservationDTO;

@Repository
public class BHReservationRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.bhreservation.BHReservation_Mapper";
	
	public void bHReservationInsert(BHReservationDTO dto) {
		String statement = namespace+".bHReservationInsert";
		sqlSession.insert(statement, dto);
	}
	
	public int bHReservationNumSelect(BHReservationDTO dto) {
		String statement = namespace+".bHReservationNumSelect";
		return sqlSession.selectOne(statement, dto);
	}
	
	public void bHReservationChargeUpdate(BHReservationDTO dto) {
		String statement = namespace+".bHReservationChargeUpdate";
		sqlSession.update(statement, dto);
	}
	
	public TotalReservationDTO totalReservationSelect(Long bHReservationNum){
		String statement = namespace+".totalReservationSelect";
		return sqlSession.selectOne(statement, bHReservationNum);
	}
	
	public List<BHReservationDTO> bHReservationListSelect(StartEndPageDTO sePage){
		String statement = namespace+".bHReservationListSelect";
		return sqlSession.selectList(statement, sePage);
	}
	
	public Integer bHReservationCountSelect() {
		String statement = namespace+".bHReservationCountSelect";
		return sqlSession.selectOne(statement);
	}
	
	public void bHReservationModifyCharge(ReservationChargeDTO dto) {
		String statement = namespace+".bHReservationModifyCharge";
		sqlSession.update(statement, dto);
	}
	
	public void bHReservationDelete(Long bHReservationNum) {
		String statement = namespace+".bHReservationDelete";
		sqlSession.delete(statement, bHReservationNum);
	}
	
	public void bHReservationStatusUpdate(BHReservationDTO dto) {	
		String statement = namespace+".bHReservationStatusUpdate";
		sqlSession.update(statement, dto);
	}
}
