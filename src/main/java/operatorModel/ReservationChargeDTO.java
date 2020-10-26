package operatorModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationChargeDTO {
		private Long bHReservationNum;
		private Long charge;
}
