package service.be;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BEDTO;
import repository.BERepository;

@Service
public class BEListService {

	@Autowired
	private BERepository bERepository;
	
	public List<BEDTO> bEListSelect(){
		return bERepository.bEListSelect();
	}
	
}
