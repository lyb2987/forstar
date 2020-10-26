package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import command.member.LoginCommand;
import model.DTO.MemberDTO;
import service.employee.EmployeeListService;
import service.member.AuthService;
import service.member.MemberListService;
import validator.LoginCommandValidator;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	AuthService authService;
	
	@Autowired
	EmployeeListService employeeListService;
	
	@Autowired
	MemberListService memberListService;
	
	@RequestMapping(value="/loginForm", method =RequestMethod.GET)
	public String form(LoginCommand loginCommand, @RequestParam(value="loginError", defaultValue = "")String loginError, Model model) {
		// 로그인 실패시 에러 문장 띄워주기 위한 부분
		if(loginError.equals("")) {	}
		else 
			model.addAttribute("loginError", loginError);
		return "Login/Login";
	}
	
	@RequestMapping("/loginSubmit")
	public String submit(LoginCommand loginCommand,Errors errors, HttpSession session, RedirectAttributes redirect) {
		new LoginCommandValidator().validate(loginCommand, errors);
		
		// 회원, 관리자 로그인 분리
		if(loginCommand.getSortation().equals("mem")) {
			authService.authenticate(loginCommand,session,errors, redirect);
		}
		else if(loginCommand.getSortation().equals("emp")) {
			MemberDTO memDTO = new MemberDTO();
			memDTO.setMemberId(loginCommand.getId1());
			// 관리자 번호가 유효한지 확인
			Integer memberNum = memberListService.memberNumSelectById(memDTO);
			if(memberNum == null) {
				redirect.addAttribute("loginError", "아이디가 존재하지 않습니다.");
				return "redirect:/login/loginForm";
			}
			Integer empNumCheck = employeeListService.employeeSelectByEmployeeNum(memberNum.longValue());
			if(empNumCheck == 1) {
				authService.authenticateEMP(loginCommand,session,errors, redirect);
			}
			else {
				redirect.addAttribute("loginError", "사원번호가 존재하지 않습니다.");
				return "redirect:/login/loginForm";
			}
		}
		if (errors.hasErrors()) {
			return "redirect:/login/loginForm";
		}
		return "redirect:/main";
	}
}
