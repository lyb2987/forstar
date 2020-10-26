package service.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.InquiryDTO;
import repository.InquiryRepository;

@Service
public class InquiryModifyService {

	@Autowired
	private InquiryRepository inquiryRepository;
	
	public void inquiryModify(Integer inquiryNum, String inquiryContent) {
		InquiryDTO dto = new InquiryDTO();
		
		dto.setInquiryNum(inquiryNum);
		dto.setInquiryContent(inquiryContent);
		
		inquiryRepository.inquiryModify(dto);
	}
	
	
}
