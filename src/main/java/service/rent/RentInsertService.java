package service.rent;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.RentCommand;
import model.RentDTO;
import repository.RentRepository;

@Service
public class RentInsertService {
	
	@Autowired
	private RentRepository rentRepository;
	
	public void rentInsert(RentCommand rentCommand) {
		RentDTO dto = new RentDTO();
		dto.setRentBanquetHall(rentCommand.getRentBanquetHall());
		dto.setRentCharge(rentCommand.getRentCharge());
		
		rentCommand.setRentDate(rentCommand.getRentDate().replace("/", "-")+":00.0");
		Timestamp rentDate = Timestamp.valueOf(rentCommand.getRentDate());
		rentCommand.setRentTime(rentCommand.getRentTime().replace("/", "-")+":00.0");
		Timestamp rentTime = Timestamp.valueOf(rentCommand.getRentTime());
		dto.setRentDate(rentDate);
		dto.setRentTime(rentTime);
		
		rentRepository.rentInsert(dto);
	}
}
