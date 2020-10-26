package service.bhpayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHPaymentDTO;
import repository.BHPaymentRepository;

@Service
public class BHPaymentInsertService {

	@Autowired
	private BHPaymentRepository bHPaymentRepository;
	
	public void bHPaymentInsert(BHPaymentDTO dto) {
		bHPaymentRepository.bHPaymentInsert(dto);
	}
}
