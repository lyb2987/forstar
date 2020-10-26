package service.bhpayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.BHPaymentRepository;

@Service
public class BHPaymentDeleteService {

	@Autowired
	private BHPaymentRepository bHPaymentRepository;
	
	public void bHPaymentDelete(Long tpNum) {
		bHPaymentRepository.bHPaymentDelete(tpNum);
	}
	
}
