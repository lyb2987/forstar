package service.fab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.FABCommand;
import model.FABDTO;
import repository.FABRepository;

@Service
public class FABInsertService {

	@Autowired
	private FABRepository fabRepository;
	
	public void fabInsert(FABCommand fabCommand) {
		FABDTO dto = new FABDTO();
		dto.setFabCharge(fabCommand.getFabCharge());
		dto.setBHReservationNum(fabCommand.getBHReservationNum());
		dto.setFabNoP(fabCommand.getFabNoP());
		dto.setMemberNum(fabCommand.getMemberNum());
		dto.setRestaurantNum(fabCommand.getRestaurantNum());
		String [] menuSplit = fabCommand.getMenuName().split(","); 
		String menuName = menuSplit[0];
		dto.setMenuName(menuName);
		
		fabRepository.fabInsert(dto);
	}
}
