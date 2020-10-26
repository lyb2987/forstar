package service.totalpayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.TotalPaymentDTO;
import repository.TotalPaymentRepository;

@Service
public class TotalPaymentInsertService {

	@Autowired
	private TotalPaymentRepository totalPaymentRepository;
	
	public void totalPaymentInsert(Long randNum, Long totalCharge) {
		TotalPaymentDTO dto = new TotalPaymentDTO();
		dto.setTpNum(randNum);
		dto.setTpTotalPrice(totalCharge);
		totalPaymentRepository.totalPaymentInsert(dto);
	}
}
