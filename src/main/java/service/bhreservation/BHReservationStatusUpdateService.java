package service.bhreservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHReservationDTO;
import repository.BHReservationRepository;

@Service
public class BHReservationStatusUpdateService {

	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public void bHReservationStatusUpdate(BHReservationDTO dto) {
		bHReservationRepository.bHReservationStatusUpdate(dto);
	}
	
}
