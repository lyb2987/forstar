package service.totalpayment;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import repository.TotalPaymentRepository;

@Service
public class TotalPaymentDeleteService {

	@Autowired
	private TotalPaymentRepository totalPaymentRepository;
	
	public void totalPaymentDelete(Long tpNum) {
		totalPaymentRepository.totalPaymentDelete(tpNum);
	}
}
