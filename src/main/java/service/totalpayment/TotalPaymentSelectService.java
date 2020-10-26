package service.totalpayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.TotalPaymentDTO;
import repository.TotalPaymentRepository;

@Service
public class TotalPaymentSelectService {

	@Autowired
	private TotalPaymentRepository totalPaymentRepository;
	
	public int totalPaymentNumCheck(Long randNum) {
		return totalPaymentRepository.totalPaymentNumCheck(randNum);
	}
	
	public TotalPaymentDTO totalPaymentSelect(Long randNum) {
		return totalPaymentRepository.totalPaymentSelect(randNum);
	}
}
