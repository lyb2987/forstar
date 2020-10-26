package service.bhreservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.RentCommand;
import model.BHReservationDTO;
import repository.BHReservationRepository;

@Service
public class BHReservationInsertService {

	@Autowired
	private BHReservationRepository bHReservationRepository;
	
	public void bHReservationInsert(RentCommand rc, Long rentNum, Long memberNum) {
		BHReservationDTO dto = new BHReservationDTO();
		dto.setBanquetNum(rc.getBanquetNum());
		dto.setRentNum(rentNum);
		dto.setMemberNum(memberNum);
		dto.setReservationStatus("결제 대기중");
		
		bHReservationRepository.bHReservationInsert(dto);
	}
	
}
