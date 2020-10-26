package service.rent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.RentCommand;
import repository.RentRepository;

@Service
public class RentSelectNumService {

	@Autowired
	private RentRepository rentRepository;
	
	public Long rentNumSelect(RentCommand rc) {
		Long rentNum = (long)rentRepository.rentNumSelect(rc);
		return rentNum;
	}
	
}
