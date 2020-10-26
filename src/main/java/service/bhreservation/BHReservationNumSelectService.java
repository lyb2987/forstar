package service.bhreservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BHReservationDTO;
import repository.BHReservationRepository;

@Service
public class BHReservationNumSelectService {
	
	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public Long bHReservationNumSelect(Long banquetNum, Long rentNum, Long memberNum) {
		BHReservationDTO dto = new BHReservationDTO();
		dto.setBanquetNum(banquetNum);
		dto.setRentNum(rentNum);
		dto.setMemberNum(memberNum);
		Long bHReservationNum = (long) bHReservationRepository.bHReservationNumSelect(dto);
		return bHReservationNum;
	}
	
}
