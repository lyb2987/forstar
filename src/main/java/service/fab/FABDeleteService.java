package service.fab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.FABRepository;

@Service
public class FABDeleteService {

	@Autowired
	private FABRepository fabRepository;
	
	public void fabDelete(Long bHReservationNum) {
		fabRepository.fabDelete(bHReservationNum);
	}
}
