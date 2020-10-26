package service.bhreservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import controller.main.PageAction;
import model.BHReservationDTO;
import model.InquiryDTO;
import model.StartEndPageDTO;
import repository.BHReservationRepository;

@Service
public class BHReservationListSelectService {

	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public void bHReservationListSelect(Integer page, Model model){
		int limit = 10;
		int limitPage = 10;
		Long startRow = ((long)page -1 ) * 10 +1;
		Long endRow = startRow + limit -1;
		
		StartEndPageDTO sePage = new StartEndPageDTO();
		sePage.setEndPage(endRow);
		sePage.setStartPage(startRow);
		
		
		List<BHReservationDTO> list = bHReservationRepository.bHReservationListSelect(sePage);
		int count = bHReservationRepository.bHReservationCountSelect();

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(model, count, limit, limitPage, page, "BHReservationList?");
	}
	
	public BHReservationDTO bHReservationSelect(StartEndPageDTO dto) {
		List<BHReservationDTO> list = bHReservationRepository.bHReservationListSelect(dto);
		return list.get(0);
	}
}
