package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.InquiryDTO;
import model.StartEndPageDTO;

@Repository
public class InquiryRepository {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace="mappers.inquiry.Inquiry_Mapper";
	
	public void inquiryInsert(InquiryDTO dto) {
		String statement = namespace+".inquiryInsert";
		sqlSession.insert(statement, dto);
	}
	
	public List<InquiryDTO> inquiryListSelect(StartEndPageDTO dto) {
		String statement = namespace+".inquiryListSelect";
		return sqlSession.selectList(statement, dto);
	}
	
	public int getInquiryCount() {
		String statement = namespace+".getInquiryCount";
		return sqlSession.selectOne(statement);
	}
	
	public void inquiryDelete(Integer inquiryNum) {
		String statement = namespace+".inquiryDelete";
		sqlSession.insert(statement, inquiryNum);
		
	}
	
	public void inquiryModify(InquiryDTO dto) {
		String statement = namespace+".inquiryModify";
		sqlSession.insert(statement, dto);
	}
}
