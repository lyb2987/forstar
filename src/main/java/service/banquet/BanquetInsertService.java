package service.banquet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.BanquetCommand;
import model.BanquetDTO;
import repository.BanquetRepository;

@Service
public class BanquetInsertService {

	@Autowired
	private BanquetRepository banquetRepository;
	
	public void banquetInsert(BanquetCommand banquetCommand) {
		BanquetDTO dto = new BanquetDTO();
		dto.setBanquetType(banquetCommand.getBanquetType());
		dto.setBanquetPurpose(banquetCommand.getBanquetPurpose());
		dto.setBanquetRequest(banquetCommand.getBanquetRequest());
		dto.setBanquetCharge(banquetCommand.getBanquetCharge());
		
		banquetRepository.banquetInsert(dto);
	}
	
}
