package service.banquet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.BanquetDTO;
import repository.BanquetRepository;

@Service
public class BanquetModifyService {

	@Autowired
	private BanquetRepository banquetRepository;
	
	public void banquetModify(BanquetDTO dto) {
		banquetRepository.banquetModify(dto);
	}
}
