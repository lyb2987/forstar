package service.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.InquiryRepository;

@Service
public class InquiryDeleteService {

	@Autowired
	private InquiryRepository inquiryRepository;
	
	public void inquiryDelete(Integer inquiryNum) {
		inquiryRepository.inquiryDelete(inquiryNum);
	}
	
}
