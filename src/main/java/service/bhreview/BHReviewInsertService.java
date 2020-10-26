package service.bhreview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHReviewDTO;
import repository.BHReviewRepository;

@Service
public class BHReviewInsertService {

	@Autowired
	private BHReviewRepository bHReviewRepository;
	
	public void bHReviewInsert(BHReviewDTO dto) {
		bHReviewRepository.bHReviewInsert(dto);
	}
}
