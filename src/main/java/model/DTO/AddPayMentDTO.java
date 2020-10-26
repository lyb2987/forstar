package model.DTO;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddPayMentDTO implements Serializable{
	String menuName;
	Long menuPrice;
	Long orderCount;
	Long orderNum;
	Long totalSum;
	
}
