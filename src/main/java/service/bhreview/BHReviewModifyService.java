package service.bhreview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHReviewDTO;
import repository.BHReviewRepository;

@Service
public class BHReviewModifyService {

	@Autowired
	private BHReviewRepository bHReviewRepository;
	
	public void bHReviewModify(BHReviewDTO dto) {
		bHReviewRepository.bHReviewModify(dto);
	}
}
