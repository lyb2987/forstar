package service.banquet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.BanquetCommand;
import model.BanquetDTO;
import repository.BanquetRepository;

@Service
public class BanquetSelectService {

	@Autowired
	private BanquetRepository banquetRepository;
	
	public Long banquetNumSelect(BanquetCommand bc) {
		Long banquetNum = (long) banquetRepository.banquetNumSelect(bc);
		return banquetNum;
	}
	
	public BanquetDTO banquetSelect(Long bHReservationNum) {
		return banquetRepository.banquetSelect(bHReservationNum);
	}
	
}
