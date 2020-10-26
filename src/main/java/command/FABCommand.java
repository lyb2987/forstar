package command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FABCommand {
	private Long bHReservationNum;
	private Long memberNum;
	private String menuName;
	private Long restaurantNum;
	private Long fabNoP;
	private Long fabCharge;
	private Long reservationType;
	private Long counselingNum;
}
