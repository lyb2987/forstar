package service.counseling;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.CounselingCommand;
import model.CounselingDTO;
import repository.CounselingRepository;

@Service
public class CounselingInsertService {

	@Autowired
	private CounselingRepository counselingRepository;
	
	public void counselingInsert(CounselingCommand counselingCommand, HttpSession session) {
		CounselingDTO dto = new CounselingDTO();
		
		dto.setMemberNum(counselingCommand.getMemberNum());
		dto.setCounselingSubject(counselingCommand.getCounselingSubject());
		dto.setCounselingType(counselingCommand.getCounselingType());
		dto.setCounselingPurpose(counselingCommand.getCounselingPurpose());
		dto.setCounselingContent(counselingCommand.getCounselingContent());
		dto.setCounselingStatus("상담 예정");
		dto.setCounselingUniqueness("상담 예정");
		
		counselingCommand.setCounselingDate(counselingCommand.getCounselingDate().replace("/", "-")+":00.0");
		Timestamp counselingDate = Timestamp.valueOf(counselingCommand.getCounselingDate());
		
		dto.setCounselingDate(counselingDate);
		
		counselingRepository.counselingInsert(dto);
		
	}
	
}
