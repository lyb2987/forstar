package service.fab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FABDTO;
import repository.FABRepository;

@Service
public class FABSelectService {

	@Autowired
	private FABRepository fabRepository;
	
	public FABDTO fabSelect(Long bHReservationNum) {
		return fabRepository.fabSelect(bHReservationNum);
	}
}
