package repository;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import command.BERequestCommand;
import model.BERequestDTO;
import operatorModel.BERequestDetailDTO;
import operatorModel.RentDateTimeDTO;

@Repository
public class BERequestRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.berequest.BE_Request_Mapper";
	
	public List<Long> bERequestDateChange(RentDateTimeDTO dto){
		String statement = namespace+".bERequestDateChange";
		return sqlSession.selectList(statement, dto);
	}
	
	public void bEReqeustInsert(BERequestCommand bERequestCommand) {
		BERequestDTO dto = new BERequestDTO();
		dto.setMemberNum(bERequestCommand.getMemberNum());
		dto.setBHReservationNum(bERequestCommand.getBHReservationNum());
		
		bERequestCommand.setBERequestDate(bERequestCommand.getBERequestDate().replace("/", "-")+":00.0");
		Timestamp bERequestDate = Timestamp.valueOf(bERequestCommand.getBERequestDate());
		bERequestCommand.setBERequestTime(bERequestCommand.getBERequestTime().replace("/", "-")+":00.0");
		Timestamp bERequestTime = Timestamp.valueOf(bERequestCommand.getBERequestTime());
		
		dto.setBERequestDate(bERequestDate);
		dto.setBERequestTime(bERequestTime);
		
		System.out.println("BENum [] Length : "+bERequestCommand.getBENum().length);
		for(int i=0; i<bERequestCommand.getBENum().length; i++) {
			dto.setBENum(bERequestCommand.getBENum()[i]);
			System.out.println("BENum : " + bERequestCommand.getBENum()[i]);
			dto.setEmployeeNum(bERequestCommand.getBENum()[i]);
			String statement = namespace+".bEReqeustInsert";
			sqlSession.selectList(statement, dto);
		}
	}
	
	public List<BERequestDetailDTO> bEDRequestetailListSelectByRNum(Long bHReservationNum){
		String statement = namespace + ".bEDRequestetailListSelectByRNum";
		return sqlSession.selectList(statement, bHReservationNum);
	}
	
	public void bEReqeustInsertList(List<BERequestDTO> addBERquestList) {
		for(int i=0; i<addBERquestList.size(); i++) {
			String statement = namespace+".bEReqeustInsert";
			sqlSession.selectList(statement, addBERquestList.get(i));
		}
	}
	
	public void bERequestListDelete(List<String> bHReservationNumList) {
		for(int i=0; i<bHReservationNumList.size(); i++) {
			String statement = namespace+".bERequestListDelete";
			sqlSession.delete(statement, bHReservationNumList.get(i));
		}
	}
	
	public void bERequesDelete(Long bHReservationNum) {
		String statement = namespace+".bERequesDelete";
		sqlSession.delete(statement, bHReservationNum);
	}
}
