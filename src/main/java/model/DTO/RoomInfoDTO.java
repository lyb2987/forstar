package model.DTO;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomInfoDTO implements Serializable{
	Integer roomNum;
	Integer ratingNum;
	String roomPic;
	String roomContent;
	Integer roomPay;
	
	
}
