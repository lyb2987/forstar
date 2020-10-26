package operatorModel;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import model.BanquetDTO;
import model.FABDTO;
import model.RentDTO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TotalReservationDTO {
	private Long bHReservationNum;
	private Long memberNum;
	private Long banquetNum;
	private Long rentNum;
	private String reservationStatus;
	private Timestamp reservationDate;
	private Long reservationCharge;
	
	private BanquetDTO banquet;
	private RentDTO rent;
	private FABDTO fab;
	private List<BERequestDetailDTO> bERequestDetail;
}
