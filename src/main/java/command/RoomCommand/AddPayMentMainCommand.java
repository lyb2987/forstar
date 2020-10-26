package command.RoomCommand;


import lombok.Data;

@Data
public class AddPayMentMainCommand {
	Long addpaymentNum;
	Long orderNum;
	String roomReserNum;
	Integer memberNum;
	String addpaymentStatus;
	String addpaymentMeans;
	Long addpaymentCharge;
}
