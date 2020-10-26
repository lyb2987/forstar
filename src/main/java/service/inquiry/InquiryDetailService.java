package service.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.InquiryDTO;
import model.StartEndPageDTO;
import repository.InquiryRepository;

@Service
public class InquiryDetailService {

	@Autowired
	private InquiryRepository inquiryRepository;
	
	public void inquirySelect(Long inquiryNum, Integer page, Model model) {
		int limit = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		sePage.setSelectNum(inquiryNum);
		
		List<InquiryDTO> list = inquiryRepository.inquiryListSelect(sePage);
		
		model.addAttribute("inquiryDTO", list.get(0));
		
	}
	
}
