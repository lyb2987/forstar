package command.RoomCommand;

import lombok.Data;

@Data
public class RoomOrderCommand {
	Long orderNum;
	String roomReserNum;
	Integer memberNum;
	String menuName;
	Long restaurantNum;
	Long orderCount;
	String orderEtc;
	
}
