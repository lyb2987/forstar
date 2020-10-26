package controller.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.member.MemberCommand;
import service.employee.EmployeeListService;
import service.member.MemberDeleteSevice;
import service.member.MemberDetailService;
import service.member.MemberJoinService;
import service.member.MemberListService;
import service.member.MemberModifyService;
import validator.MemberCommandValidator;

@Controller
public class MemberController {
	@Autowired
	MemberJoinService memberJoinService;
	
	@Autowired
	MemberListService memberListService;
	
	@Autowired
	MemberDetailService memberDetailService;
	
	@Autowired
	MemberModifyService memberModifyService; 
	
	@Autowired
	MemberDeleteSevice memberDeleteSevice;
	
	@Autowired
	EmployeeListService employeeListService;
	
	@RequestMapping("/edit/memberInfoDel")
	public String memberDelete(@RequestParam(value = "id") String userId) {
		memberDeleteSevice.memberDelete(userId);
		return "redirect:/member/list";  
	}
	
	@RequestMapping(value = "/edit/memberModifyPro", method = RequestMethod.POST)
	public String membermodify(MemberCommand memberCommand, 
			Model model,Errors errors) {
		System.out.println(memberCommand);
		Integer i = memberModifyService.memberModify(memberCommand, model);
		if(i > 0) {
			return "redirect:/edit/memberInfo/"+memberCommand.getMemberId();
		}else {
			errors.rejectValue("memberPw", "badPw");
			return "member/memberModify";
		}
	}
	
	@RequestMapping(value = "/edit/memberInfo/{id}")
	public String memberInfo(@PathVariable(value = "id") String memberId, 
			Model model) {
		memberDetailService.memberDetail(memberId, model);
		return "member/memberInfo";
	}
	@RequestMapping(value = "/edit/memberModify")
	public String memberModify(@RequestParam(value = "id") String memberId,
			Model model) {
		memberDetailService.memberDetail(memberId, model);
		return "member/memberModify";
	}
	@RequestMapping("/member/list")
	public String memberlist(Model model)  {
		memberListService.memberList(model);
		return "member/memberList";
	}
	
	@RequestMapping("/register/agree")
	public String agree() {
		return "member/agree";
	}
	
	@RequestMapping(value = "/register/regist",method ={RequestMethod.POST, RequestMethod.GET})
	public String  memberForm(@RequestParam(value="agree",defaultValue ="false") Boolean agree, 
			@RequestParam(value="employeeNumError",defaultValue ="none") String employeeNumError,
			Model model) {
		if(!agree) {
			return "member/agree";
		}
		if(employeeNumError.equals("none")) {
			
		}
		else {
			model.addAttribute("employeeNumError", employeeNumError);
		}
		model.addAttribute("memberCommand", new MemberCommand());
		return "member/memberForm";
	}
	
	@RequestMapping(value="/register/memberJoinAction", method=RequestMethod.POST)
	public String  memberJoin(MemberCommand memberCommand, Errors errors, Model model) {
		new MemberCommandValidator().validate(memberCommand, errors);
		if(errors.hasErrors()) {
			System.out.println(memberCommand);
			model.addAttribute("err", "1");
			return "member/memberForm";
		}
		Integer i = null;
		Long randNum = (long)0;
		
		// 직원, 회원 체크
		if(memberCommand.getEmployeeNum() == null) {
			// 랜덤 회원번호 생성
			Integer checkNum = 0;
			Integer checkEmpNum = 0;
			while(true) {
				randNum = (long)Math.floor(Math.random()*100000+1);
				checkEmpNum = employeeListService.employeeNumCheck(randNum);
				checkNum = memberListService.memberNumCheck(randNum);
				System.out.println(randNum);
				// 다섯자리 이상이면서, 이미 사용되고있는 번호인지 또는 사원번호로 등록된 번호는 아닌지 체크 후 사용
				if(randNum>9999 && checkNum == 0 & checkEmpNum == 0)
					break;
			}
		}
		else {
			// 직원 번호 존재하는지 체크
			int empleCheck = employeeListService.employeeSelectByEmployeeNum(memberCommand.getEmployeeNum().longValue());
			if(empleCheck == 1) {
				randNum = memberCommand.getEmployeeNum().longValue();
			}
			else {
				String employeeNumError = "사원번호가 존재하지 않습니다 확인후 다시 시도해주세요.";
				model.addAttribute("memberCommand", memberCommand);
				model.addAttribute("employeeNumError", employeeNumError);
				return "redirect:/register/regist?agree=true";
			}
		}
		i = memberJoinService.execute(memberCommand, randNum);
		
		
		if(i == null) {// 중복 아이디 확인
			errors.rejectValue("memberId", "duplicate");
			return "member/memberForm";
		}
		return "member/memberWelcome";
	}
	
}
