package service.bhreview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.BHReviewRepository;

@Service
public class BHReviewDeleteService {

	@Autowired
	private BHReviewRepository bHReviewRepository;
	
	public void bHReviewDelete(Long bHReviewNum) {
		bHReviewRepository.bHReviewDelete(bHReviewNum);
	}
}
