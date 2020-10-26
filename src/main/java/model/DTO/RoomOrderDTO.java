package model.DTO;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomOrderDTO implements Serializable{
	Long orderNum;
	String roomReserNum;
	Integer memberNum;
	String menuName;
	Long restaurantNum;
	Long orderCount;
	String orderEtc;
	
}
