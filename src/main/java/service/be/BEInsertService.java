package service.be;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.BECommand;
import model.BEDTO;
import repository.BERepository;

@Service
public class BEInsertService {

	@Autowired
	private BERepository bERepository;
	
	public void bEInsert(BECommand bECommand) {
		BEDTO dto = new BEDTO();
		dto.setBENum(bECommand.getBENum());
		dto.setEmployeeNum(bECommand.getBENum());
		dto.setBECharge(bECommand.getBECharge());
		dto.setBEDuties(bECommand.getBEDuties());
		bERepository.bEInsert(dto);
		
	}
	
}
