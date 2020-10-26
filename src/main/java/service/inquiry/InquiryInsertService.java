package service.inquiry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.InquiryCommand;
import model.InquiryDTO;
import repository.InquiryRepository;

@Service
public class InquiryInsertService {
	
	@Autowired
	private InquiryRepository inquiryRepository;
	
	public void inquiryInsert(InquiryCommand inquiryCommand, HttpSession session, HttpServletRequest request) {
		InquiryDTO dto = new InquiryDTO();
		dto.setMemberNum(11111);
		dto.setEmployeeNum(12345);
		dto.setInquirySubject(inquiryCommand.getInquirySubject());
		dto.setInquiryType(inquiryCommand.getInquiryType());
		dto.setInquiryContent(inquiryCommand.getInquiryContent());
		dto.setInquiryStatus("처리 대기중");
		
		inquiryRepository.inquiryInsert(dto);
	}
	
}
