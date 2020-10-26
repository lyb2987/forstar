package service.banquet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.BanquetRepository;

@Service
public class BanquetDeleteService {

	@Autowired
	private BanquetRepository banquetRepository;
	
	public void banquetDelete(Long banquetNum) {
		banquetRepository.banquetDelete(banquetNum);
	}
}
