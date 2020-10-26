package service.counseling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.CounselingDTO;
import model.StartEndPageDTO;
import repository.CounselingRepository;

@Service
public class CounselingDetailService {

	@Autowired
	private CounselingRepository counselingRepository;
	
	public void counselingSelect(Long counselingNum, Integer page, Model model) {
		int limit = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		sePage.setSelectNum(counselingNum);
		
		List<CounselingDTO> list = counselingRepository.counselingListSelect(sePage);
		model.addAttribute("counselingDTO", list.get(0));
	}
	
	
}
