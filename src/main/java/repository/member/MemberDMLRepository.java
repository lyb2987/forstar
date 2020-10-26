package repository.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.MemberDTO;

@Repository
public class MemberDMLRepository {
	private final String namespace = "mappers.memberDML_Mapper";
	@Autowired
	private SqlSession sqlSession;
	
	public void memberDelete(MemberDTO dto) {
		String statement = namespace + ".memberDelete";
		Integer i = sqlSession.update(statement,dto);
	}
	public Integer memberUpdate(MemberDTO dto) {
		String statement = namespace + ".memberUpdate";
		Integer i = 0; 
		i = sqlSession.update(statement,dto);
		return i;
	}
	
}
