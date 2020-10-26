package service.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CounselingDTO;
import repository.CounselingRepository;

@Service
public class CounselingSelectService {

	@Autowired
	private CounselingRepository counselingRepository;
	
	public CounselingDTO counselingSelectByBHRNum(Long bHReservationNum) {
		return counselingRepository.counselingSelectByBHRNum(bHReservationNum);
	}
}
