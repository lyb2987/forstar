package service.bhreview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import controller.main.PageAction;
import model.BHReviewDTO;
import model.StartEndPageDTO;
import repository.BHReviewRepository;

@Service
public class BHReviewSelectService {

	@Autowired
	private BHReviewRepository bHReviewRepository;
	
	public void bHReviewListSelect(Integer page, Model model){
		int limit = 10;
		int limitPage = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		
		List<BHReviewDTO> list = bHReviewRepository.bHReviewListSelect(sePage);
		int count = bHReviewRepository.getBHReviewCount();
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(model, count, limit, limitPage, page, "BHReviewList?");	
		
		
	}
	
	public void bHReviewSelect(Integer page, Long bHReviewNum, Model model) {
		int limit = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		sePage.setSelectNum(bHReviewNum);
		
		List<BHReviewDTO> list = bHReviewRepository.bHReviewListSelect(sePage);
		
		model.addAttribute("dto", list.get(0));
	}
}
