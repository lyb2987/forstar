package model.DTO;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddPayMentMainDTO implements Serializable{
	Long addpaymentNum;
	Long orderNum;
	String roomReserNum;
	Integer memberNum;
	String addpaymentStatus;
	String addpaymentMeans;
	Long addpaymentCharge;
}
