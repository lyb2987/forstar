package service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberListService {
	
	@Autowired
	MemberRepository memberRepository;
	
	
	public void memberList(Model model) {
		List<MemberDTO> members = memberRepository.memberList();
		int listCount = memberRepository.memberCount();
		model.addAttribute("count", listCount);
		model.addAttribute("memberList", members);
	}
	
	public Integer memberNumCheck(Long randNum) {
		return memberRepository.memberNumCheck(randNum);
	}
	
	public Integer memberNumSelectById(MemberDTO memDTO) {
		return memberRepository.memberNumSelectById(memDTO);
	}
	
	
}
