package repository.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.MemberDTO;


@Repository
public class MemberRepository {
	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "mappers.member_Mapper";
	
	public List<String> selectMemberAll(){
			String statement =  namespace + ".selectMemberAll";
			List<String> list = sqlSession.selectList(statement);
			return list;
	}
	
	public List<MemberDTO> memberList(){
			String statement = namespace + ".memberList";
			System.out.println(statement);
			List<MemberDTO> lists = sqlSession.selectList(statement);
			return lists;
			
	}
	public Integer memberCount() {
			String statement = namespace + ".memberCount";
			Integer i = sqlSession.selectOne(statement);
			return i;
	}
	public Integer insertMember(MemberDTO dto) {
		String statement = namespace + ".insertMember";
		System.out.println(statement);
		Integer	result = sqlSession.insert(statement, dto) ;
		return result;
	}
	
	public Integer memberNumCheck(Long randNum) {
		String statement = namespace + ".memberNumCheck";
		return sqlSession.selectOne(statement, randNum);
	}
	
	public Integer memberNumSelectById(MemberDTO memDTO) {
		String statement = namespace + ".memberNumSelectById";
		return sqlSession.selectOne(statement, memDTO);
	}
		
}
