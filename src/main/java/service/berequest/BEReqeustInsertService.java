package service.berequest;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.BERequestCommand;
import model.BERequestDTO;
import repository.BERequestRepository;

@Service
public class BEReqeustInsertService {
	
	@Autowired
	private BERequestRepository bERequestRepository;
	
	public void bEReqeustInsert(BERequestCommand bERequestCommand) {
		bERequestRepository.bEReqeustInsert(bERequestCommand);
	}
	
	public void bEReqeustInsertList(List<BERequestDTO> addBERquestList) {
		bERequestRepository.bEReqeustInsertList(addBERquestList);
	}
}
