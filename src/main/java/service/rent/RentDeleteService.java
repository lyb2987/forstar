package service.rent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.RentRepository;

@Service
public class RentDeleteService {

	@Autowired
	private RentRepository rentRepository;
	
	public void rentDelete(Long rentNum) {
		rentRepository.rentDelete(rentNum);
	}
}
