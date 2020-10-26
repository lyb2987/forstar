package model.DTO;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomAdminClassDTO implements Serializable{
	Integer ratingNum;
	String ratingName; 
	Integer ratingBad;
	Integer ratingAcreage;
	String ratingView;
	Integer ratingPeople;
}
