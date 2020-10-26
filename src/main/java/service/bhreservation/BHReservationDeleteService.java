package service.bhreservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.BHReservationRepository;

@Service
public class BHReservationDeleteService {

	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public void bHReservationDelete(Long bHReservationNum) {
		bHReservationRepository.bHReservationDelete(bHReservationNum);
	}
}
