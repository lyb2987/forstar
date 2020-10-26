package service.bhpayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHPaymentDTO;
import repository.BHPaymentRepository;

@Service
public class BHPaymentSelectService {

	@Autowired
	private BHPaymentRepository bHPaymentRepository;
	
	public BHPaymentDTO bHPaymentSelect(Long randNum) {
		return bHPaymentRepository.bHPaymentSelect(randNum);
	}
	
}
