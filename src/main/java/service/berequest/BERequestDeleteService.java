package service.berequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.BERequestRepository;

@Service
public class BERequestDeleteService {

	@Autowired
	private BERequestRepository bERequestRepository;
	
	public void bERequestListDelete(List<String> bHReservationNumList) {
		bERequestRepository.bERequestListDelete(bHReservationNumList);
	}
	
	public void bERequesDelete(Long bHReservationNum) {
		bERequestRepository.bERequesDelete(bHReservationNum);
	}
}
