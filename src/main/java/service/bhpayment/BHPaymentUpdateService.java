package service.bhpayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.BHPaymentRepository;

@Service
public class BHPaymentUpdateService {

	@Autowired
	private BHPaymentRepository bHPaymentRepository;
	
	public void bHPaymentCompleUpdate(Long tpNum) {
		bHPaymentRepository.bHPaymentCompleUpdate(tpNum);
	}
	
}
