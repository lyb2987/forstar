package service.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MenuDTO;
import repository.MenuRepository;

@Service
public class MenuListSelectService {
	
	@Autowired
	private MenuRepository menuRepository;
	
	public List<MenuDTO> menuListSelect(){
		return menuRepository.menuListSelect();
	}
}
