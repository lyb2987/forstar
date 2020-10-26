package service.rent;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import operatorModel.RentDateTimeDTO;
import repository.RentRepository;

@Service
public class RentDateChangeService {

	@Autowired
	private RentRepository rentRepository;
	
	public List<String> rentDateChange(String rentDate, String rentTime){
		
		String [] banquetHallList = new String[]{"다이너스티FULL", "다이너스티1", "다이너스티2", "다이너스티3", "다이너스티A", "다이너스티B", "루비", "토파즈", "에메랄드", "내정", "후정", " 라일락", "오키드", "마로니에", "메이플"};
		List<String> list = new ArrayList<String>(Arrays.asList(banquetHallList));
		
		rentDate = rentDate.replace(" ", "");
		rentDate = rentDate.replace("/", "");
		rentDate = rentDate.replace(":", "");
		
		rentTime = rentTime.replace(" ", "");
		rentTime = rentTime.replace("/", "");
		rentTime = rentTime.replace(":", "");
		
		RentDateTimeDTO dto = new RentDateTimeDTO();
		dto.setRentDate(rentDate);
		dto.setRentTime(rentTime);
		
		List<String> deleteList = rentRepository.rentDateChange(dto);
		
		for(int i=0; i<deleteList.size(); i++) {
			for(int j=0; j<list.size(); j++) {
				list.remove(deleteList.get(i));
			}
		}

		return list;
	}
	
}
