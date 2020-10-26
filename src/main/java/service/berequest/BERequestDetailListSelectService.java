package service.berequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import operatorModel.BERequestDetailDTO;
import repository.BERequestRepository;

@Service
public class BERequestDetailListSelectService {

	@Autowired
	private BERequestRepository bERequestRepository;
	
	public List<BERequestDetailDTO> bERequestDetailListSelectByRNum(Long bHReservationNum){
		return bERequestRepository.bEDRequestetailListSelectByRNum(bHReservationNum);
	}
}
