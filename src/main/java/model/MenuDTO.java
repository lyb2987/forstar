package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {
	private String menuName;
	private Long restaurantNum;
	private Long menuPrice;
	private String menuDescription;
	private String menuImage;
}
