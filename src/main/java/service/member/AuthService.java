package service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import command.member.LoginCommand;
import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.LoginRepository;
@Service
public class AuthService {
	@Autowired
	LoginRepository loginRepository; 
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private AuthInfo authInfo;
	
	public void authenticate(LoginCommand loginCommand, HttpSession session, Errors errors, RedirectAttributes redirect) {
		MemberDTO member = new MemberDTO();
		member.setMemberId(loginCommand.getId1());
		member = loginRepository.selectByUserId(member);
		if(member == null) {
			errors.rejectValue("id1","notId");	
			String loginError = "아이디가 존재하지 않습니다.";
			redirect.addAttribute("loginError", loginError);
		}else {
			if(bcryptPasswordEncoder.matches(loginCommand.getPw() , member.getMemberPw())) {
				authInfo = new AuthInfo(member.getMemberId(), member.getMemberNum(), member.getMemberEmail(), member.getMemberName());
				session.setAttribute("authInfo", authInfo);
			}else {
				errors.rejectValue("pw","wrong");
				String loginError = "비밀번호가 틀립니다.";
				redirect.addAttribute("loginError", loginError);
			}
		}
	}
	
	// 직원 로그인 생성자 매개변수 순서로 empNum 또는 memNum에 값이 들어가게 해놨음
	public void authenticateEMP(LoginCommand loginCommand, HttpSession session, Errors errors, RedirectAttributes redirect) {
		MemberDTO member = new MemberDTO();
		member.setMemberId(loginCommand.getId1());
		member = loginRepository.selectByUserId(member);
		if(member == null) {
			errors.rejectValue("id1","notId");	
			String loginError = "아이디가 존재하지 않습니다.";
			redirect.addAttribute("loginError", loginError);
		}else {
			if(bcryptPasswordEncoder.matches(loginCommand.getPw() , member.getMemberPw())) {
				authInfo = new AuthInfo(member.getMemberNum(), member.getMemberId(), member.getMemberEmail(), member.getMemberName());
				session.setAttribute("authInfo", authInfo);
			}else {
				errors.rejectValue("pw","wrong");
				String loginError = "비밀번호가 틀립니다.";
				redirect.addAttribute("loginError", loginError);
			}
		}
	}
	
	
}
