package service.berequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import operatorModel.RentDateTimeDTO;
import repository.BERequestRepository;

@Service
public class BERequestDateChangeService {

	@Autowired
	private BERequestRepository bERequestRepository;
	
	public List<Long> bERequestDateChange(RentDateTimeDTO dto){
		return bERequestRepository.bERequestDateChange(dto);
	}
}
