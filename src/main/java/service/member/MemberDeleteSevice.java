package service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.DTO.MemberDTO;
import repository.member.MemberDMLRepository;

@Service
public class MemberDeleteSevice {
	@Autowired
	MemberDMLRepository memberDMLRepository;
	public void memberDelete(String memberId) {
		MemberDTO member = new MemberDTO();
		member.setMemberId(memberId);
		memberDMLRepository.memberDelete(member);
	}
}
