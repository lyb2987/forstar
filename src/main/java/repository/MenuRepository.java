package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MenuDTO;

@Repository
public class MenuRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace="mappers.menu.Menu_Mapper";
	
	public List<MenuDTO> menuListSelect(){
		String statement = namespace+".menuListSelect";
		return sqlSession.selectList(statement);
	}
	
}
