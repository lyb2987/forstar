package service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MemberDTO;
import repository.member.LoginRepository;

@Service
public class MemberDetailService {
	@Autowired
	LoginRepository loginRepository;
	public void memberDetail(String memberId,Model model) {
		MemberDTO member = new MemberDTO();
		member.setMemberId(memberId);
		member = loginRepository.selectByUserId(member);
		System.out.println("멤버"+member);
		model.addAttribute("memberCommand", member);
	}
}
