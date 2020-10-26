package validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.member.MemberCommand;



public class MemberCommandValidator implements Validator{
	private static final String emailRegExp =
			"^[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	private Pattern pattern;
	public MemberCommandValidator() {
		pattern = Pattern.compile(emailRegExp);
	}
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}
	public void validate(Object target, Errors errors) {
		MemberCommand regReq = (MemberCommand) target;
		if(regReq.getMemberEmail() == null || 
				regReq.getMemberEmail().trim().isEmpty()	) {
			errors.rejectValue("memberEmail", "required"); 
		}else {
			Matcher matcher = pattern.matcher(regReq.getMemberEmail());
			if(!matcher.matches()) {
				errors.rejectValue("memberEmail", "bad"); 
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(
				errors, "memberName", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberPw", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberId", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberTel", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberAddr", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberBirth", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberPwCon", "required");
		if(!regReq.getMemberPw().isEmpty()) {
			if(!regReq.isUserPwEqualToUserPwCon()) {
				errors.rejectValue("memberPwCon", "nomatch");
			}
		}
	}
	
	
}
