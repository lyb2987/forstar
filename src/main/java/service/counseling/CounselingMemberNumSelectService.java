package service.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.CounselingRepository;

@Service
public class CounselingMemberNumSelectService {

	@Autowired
	private CounselingRepository counselingRepository;

	
	public Long memberNumSelect(Long counselingNum) {
		Long memberNum = (long)counselingRepository.memberNumSelect(counselingNum);
		return memberNum;
	}
	
}
