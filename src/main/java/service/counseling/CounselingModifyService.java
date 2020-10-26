package service.counseling;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CounselingDTO;
import repository.CounselingRepository;

@Service
public class CounselingModifyService {

	@Autowired
	private CounselingRepository counselingRepository;
	
	public void counselingOngoingModify(Long counselingNum, HttpSession session) {
		CounselingDTO dto = new CounselingDTO();
		dto.setCounselingNum(counselingNum);
		dto.setEmployeeNum((long) 12345);
		dto.setCounselingStatus("상담 진행중");
		counselingRepository.counselingOngoingModify(dto);
	}
	
	public void counselingCompleModify(Long counselingNum, String counselingContent, String counselingUniqueness) {
		CounselingDTO dto = new CounselingDTO();
		dto.setCounselingNum(counselingNum);
		dto.setCounselingContent(counselingContent);
		dto.setCounselingUniqueness(counselingUniqueness);
		dto.setCounselingStatus("상담 완료");
		counselingRepository.counselingCompleModify(dto);
	}
	
	public void counselingCancleModify(Long counselingNum) {
		CounselingDTO dto = new CounselingDTO();
		dto.setCounselingNum(counselingNum);
		dto.setEmployeeNum(null);
		dto.setCounselingStatus("상담 예정");
		counselingRepository.counselingCancleModify(dto);
	}
	
	public void counselingReserveModify(Long counselingNum) {
		CounselingDTO dto = new CounselingDTO();
		dto.setCounselingNum(counselingNum);
		dto.setCounselingStatus("예약 진행중");
		counselingRepository.counselingReserveModify(dto);
	}
	
	public void counselingReserveCancleModify(Long counselingNum) {
		CounselingDTO dto = new CounselingDTO();
		dto.setCounselingNum(counselingNum);
		dto.setCounselingStatus("상담완료");
		counselingRepository.counselingReserveCancleModify(dto);
	}
	
	public void counselingReservationCompleModify(CounselingDTO dto) {
		counselingRepository.counselingReservationCompleModify(dto);
	}
}
