package service.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import controller.main.PageAction;
import model.InquiryDTO;
import model.StartEndPageDTO;
import repository.InquiryRepository;

@Service
public class InquiryListService {

	@Autowired
	InquiryRepository inquiryRepository;
	
	public void inquiryListSelcet(Integer page, Model model) {
		int limit = 10;
		int limitPage = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		
		
		List<InquiryDTO> list = inquiryRepository.inquiryListSelect(sePage);
		int count = inquiryRepository.getInquiryCount();

		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(model, count, limit, limitPage, page, "InquiryList?");	
		
	}
}
