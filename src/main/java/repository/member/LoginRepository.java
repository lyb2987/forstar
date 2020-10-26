package repository.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.MemberDTO;
@Repository
public class LoginRepository {
	private final String namespace = "mappers.login_Mapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO selectByUserId(MemberDTO member) {
			String statement = namespace + ".selectUser";
			MemberDTO member1 = sqlSession.selectOne(statement, member);
			return member1;
		
	}
	
	// 비밀번호 가져오지 않는 버전
	public MemberDTO selectByUserId2(MemberDTO member) {
		String statement = namespace + ".selectUserExceptionPW";
		return sqlSession.selectOne(statement, member);
	
	}
}
