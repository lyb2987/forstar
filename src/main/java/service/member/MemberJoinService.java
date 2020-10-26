package service.member;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import command.member.MemberCommand;
import controller.main.SmsSend;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;



@Service
public class MemberJoinService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public Integer execute(MemberCommand memberCommand, Long randNum) {
		Integer result = null; 
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setMemberNum(randNum.intValue());
		memberDTO.setMemberAddr(memberCommand.getMemberAddr());
		Timestamp userBirth = 
				new Timestamp(memberCommand.getMemberBirth().getTime());
		memberDTO.setMemberBirth(userBirth);
		memberDTO.setMemberEmail(memberCommand.getMemberEmail());
		memberDTO.setMemberGender(memberCommand.getMemberGender());
		memberDTO.setMemberId(memberCommand.getMemberId());
		memberDTO.setMemberName(memberCommand.getMemberName());
		memberDTO.setMemberTel(memberCommand.getMemberTel());
		Long memberPoint = (long) 0;
		memberDTO.setMemberPoint(memberPoint);
		memberDTO.setMemberPw(
				bcryptPasswordEncoder.encode(memberCommand.getMemberPw()));
		System.out.println(memberDTO.getMemberPw());
		System.out.println(memberDTO);
		result = memberRepository.insertMember(memberDTO);
		if(result != null) {
			SmsSend ss = new SmsSend();
			ss.smsSend(memberDTO.getMemberTel(), 
					memberDTO.getMemberName()+"님 회원가입을 축하합니다.");
		}
		return result;
	}
	
}
