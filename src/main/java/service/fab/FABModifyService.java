package service.fab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FABDTO;
import repository.FABRepository;

@Service
public class FABModifyService {

	@Autowired
	private FABRepository fabRepository;
	
	public void fabModify(FABDTO dto) {
		
		String [] splitMenuName = dto.getMenuName().split(",");
		dto.setMenuName(splitMenuName[0]);
		fabRepository.fabModify(dto);
	}
	
}
