package repository.Room;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MenuDTO;
import model.DTO.AddPayMentDTO;
import model.DTO.AddPayMentMainDTO;
import model.DTO.OpenRoomDTO;
import model.DTO.PayMentDTO;
import model.DTO.RoomOrderDTO;
import model.DTO.RoomReserDTO;

@Repository
public class RoomRepository {
	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "roomReser_Mapper";

	//객실예약 insert
	public Integer roomReserInsert(RoomReserDTO dto) {
		String statement = namespace + ".roomReserInsert";
		Integer result = sqlSession.insert(statement, dto);
		return result;
	}

	public List<RoomReserDTO> roomReserList() {
		String statement = namespace + ".roomReserList";
		List<RoomReserDTO> list = sqlSession.selectList(statement);
		return list;
	}

	public List<RoomReserDTO> roomReserMemberList(Integer memberId) {
		String statement = namespace + ".roomReserMemberList";
		List<RoomReserDTO> list = sqlSession.selectList(statement,memberId);
		return list;
	}

	public List<MenuDTO> restaurantList() {
		String statement = namespace + ".restaurantList";
		List<MenuDTO> list = sqlSession.selectList(statement);
		return list;
	}

	public void roomOrderInsert(RoomOrderDTO dto) {
		String statement = namespace + ".roomOrderInsert";
	    sqlSession.insert(statement, dto);
	}

	public List<MenuDTO> restaurantMenuList(Long restaurantNum) {
		String statement = namespace + ".restaurantMenuList";
		List<MenuDTO> list = sqlSession.selectList(statement,restaurantNum);
		return list;
	}

	public List<RoomOrderDTO> roomOrderList(Integer memberId) {
		String statement = namespace + ".roomOrderList";
		List<RoomOrderDTO> list = sqlSession.selectList(statement,memberId);
		return list;
	}

	public List<RoomOrderDTO> roomOrderMemberList(Long orderNum) {
		String statement = namespace + ".roomOrderMemberList";
		System.out.println(orderNum);
		List<RoomOrderDTO> list = sqlSession.selectList(statement,orderNum);
		return list;
	}

	public List<AddPayMentDTO> addPayMentList(Long orderNum) {
		String statement = namespace + ".addPayMentList";
		List<AddPayMentDTO> list = sqlSession.selectList(statement,orderNum);
		return list;
	}

	public void addPaymentInsert(AddPayMentMainDTO dto) {
		String statement = namespace + ".addPaymentInsert";
	    sqlSession.insert(statement, dto);
	}

	public List<RoomReserDTO> roomPaymentList(String roomReserNum) {
		String statement = namespace + ".roomPaymentList";
		List<RoomReserDTO> list = sqlSession.selectList(statement,roomReserNum);
		return list;
	}

	public void roomPaymentInsert(PayMentDTO dto) {
		String statement = namespace + ".roomPaymentInsert";
	    sqlSession.insert(statement, dto);
	}
	
	public List<OpenRoomDTO> openroomList(String reserEnd) {
		String statement = namespace + ".openroomList";
		List<OpenRoomDTO> list = sqlSession.selectList(statement, reserEnd);
		return list;
	}

	public List<AddPayMentMainDTO> roomTotalpaymentList(Integer memberNum) {
		String statement = namespace + ".roomTotalpaymentList";
		List<AddPayMentMainDTO> list = sqlSession.selectList(statement,memberNum);
		return list;
	}

	public void addPaymentUpdate(AddPayMentMainDTO dto) {
		String statement = namespace + ".addPaymentUpdate";
	    sqlSession.insert(statement, dto);
	}

}
