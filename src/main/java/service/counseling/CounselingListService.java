package service.counseling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import controller.main.PageAction;
import model.CounselingDTO;
import model.StartEndPageDTO;
import repository.CounselingRepository;

@Service
public class CounselingListService {

	@Autowired
	private CounselingRepository counselingRepository;
	
	public void counselingListSelcet(Integer page,	Model model) {
		int limit = 10;
		int limitPage = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		
		List<CounselingDTO> list = counselingRepository.counselingListSelect(sePage);
		int count = counselingRepository.counselingCount(sePage);
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(model, count, limit, limitPage, page, "CounselingList?");	
	}
}
