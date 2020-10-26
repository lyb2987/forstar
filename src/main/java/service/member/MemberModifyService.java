package service.member;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.member.MemberCommand;
import model.DTO.MemberDTO;
import repository.member.LoginRepository;
import repository.member.MemberDMLRepository;
@Service
public class MemberModifyService {
	@Autowired
	MemberDMLRepository memberDMLRepository; 
	@Autowired
	LoginRepository loginRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	public Integer memberModify(MemberCommand memberCommand,Model model) {
		MemberDTO dto = new MemberDTO();
		dto.setMemberAddr(memberCommand.getMemberAddr());
		dto.setMemberBirth(new Timestamp(memberCommand.getMemberBirth().getTime()));
		dto.setMemberEmail(memberCommand.getMemberEmail());
		dto.setMemberGender(memberCommand.getMemberGender());
		dto.setMemberId(memberCommand.getMemberId());
		dto.setMemberName(memberCommand.getMemberName());
		dto.setMemberTel(memberCommand.getMemberTel());
		MemberDTO member = new MemberDTO();
		System.out.println(dto);
		member = loginRepository.selectByUserId(dto);
		if(bcryptPasswordEncoder.matches(
				memberCommand.getMemberPw() , member.getMemberPw())) {
			dto.setMemberPw(member.getMemberPw());
			return memberDMLRepository.memberUpdate(dto);
		}
		return 0;
	}
}
