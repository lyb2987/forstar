package service.bhreservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHReservationDTO;
import operatorModel.ReservationChargeDTO;
import repository.BHReservationRepository;

@Service
public class BHReservationChargeUpdateService {

	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public void bHReservationChargeUpdate(BHReservationDTO dto){
		bHReservationRepository.bHReservationChargeUpdate(dto);
	}
	
	public void bHReservationModifyCharge(ReservationChargeDTO dto) {
		bHReservationRepository.bHReservationModifyCharge(dto);
	}
	
}
