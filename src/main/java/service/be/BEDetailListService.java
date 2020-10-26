package service.be;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import operatorModel.BEDetailDTO;
import operatorModel.BERequestDetailDTO;
import repository.BERepository;

@Service
public class BEDetailListService {

	@Autowired
	private BERepository bERepository;
	
	public List<BEDetailDTO> bEDetailListSelect(){
		return bERepository.bEDetailListSelect();
	}
	
	
	
}
