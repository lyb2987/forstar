package service.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.CounselingRepository;

@Service
public class CounselingDeleteService {

	@Autowired
	private CounselingRepository counselingRepository;
	
	public void counselingDelete(Long counselingNum) {
		counselingRepository.counselingDelete(counselingNum);
	}
}
