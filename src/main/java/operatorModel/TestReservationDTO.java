package operatorModel;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import model.BERequestDTO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestReservationDTO {
	private Long bHReservationNum;
	private Long memberNum;
	private Long banquetNum;
	private Long rentNum;
	private String reservationStatus;
	private Timestamp reservationDate;
	private Long reservationCharge;
	
	private List<BERequestDTO> bERequest;
}
