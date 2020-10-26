package repository.RoomAdmin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CleaningDTO;
import model.DTO.LaundryDTO;
import model.DTO.RoomAdminClassDTO;
import model.DTO.RoomInfoDTO;

@Repository
public class RoomAdminRepository {
	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "roomAdmin_Mapper";

	// 객실등급 list
	public List<RoomAdminClassDTO> roomClassList() {
		String statement = namespace + ".roomClassList";
		List<RoomAdminClassDTO> list = sqlSession.selectList(statement);
		return list;

	}

	// 객실등급 insert
	public Integer roomClassInsert(RoomAdminClassDTO dto) {
		String statement = namespace + ".roomClassInsert";
		Integer result = sqlSession.insert(statement, dto);
		return result;
	}

	// 객실 insert
	public void roomInsert(RoomInfoDTO dto) {
		String statement = namespace + ".roomInsert";
		sqlSession.insert(statement, dto);
	}

	public List<RoomInfoDTO> roomList() {
		String statement = namespace + ".roomList";
		List<RoomInfoDTO> list = sqlSession.selectList(statement);
		return list;
	}

	public RoomInfoDTO roomModifyList(Integer roomNum) {
		String statement = namespace + ".roomModifyList";
		RoomInfoDTO list = sqlSession.selectOne(statement, roomNum);
		return list;
	}

	public Integer roomCount() {
		String statement = namespace + ".roomCount";
		Integer i = sqlSession.selectOne(statement);
		return i;
	}

	public RoomInfoDTO roomModify(Integer roomNum) {
		String statement = namespace + ".roomModify";
		RoomInfoDTO dto = sqlSession.selectOne(statement, roomNum);
		return dto;
	}

	public void roomUpdate(RoomInfoDTO dto) {
		String statement = namespace + ".roomUpdate";
		sqlSession.update(statement, dto);

	}

	public void laundryInsert(LaundryDTO dto) {
		String statement = namespace + ".laundryInsert";
		sqlSession.insert(statement, dto);

	}

	public List<RoomInfoDTO> roomClist(Integer roomNum) {
		String statement = namespace + ".roomClist";
		List<RoomInfoDTO> list = sqlSession.selectList(statement, roomNum);
		return list;
	}

	public void cleaningInsert(CleaningDTO dto) {
		String statement = namespace + ".cleaningInsert";
		sqlSession.insert(statement, dto);
	}

	public List<LaundryDTO> laundryList() {
		String statement = namespace + ".laundryList";
		List<LaundryDTO> list = sqlSession.selectList(statement);
		return list;
	}
}
