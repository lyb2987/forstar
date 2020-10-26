package service.bhreservation;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import operatorModel.TotalReservationDTO;
import repository.BHReservationRepository;

@Service
public class BHReservationTotalSelectService {

	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public TotalReservationDTO totalReservationSelect(Long bHReservationNum){
		return bHReservationRepository.totalReservationSelect(bHReservationNum);
	}
	
	
}
