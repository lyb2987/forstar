package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class InquiryCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "inquirySubject","required");
		ValidationUtils.rejectIfEmpty(errors, "inquiryType","required");
		ValidationUtils.rejectIfEmpty(errors, "inquiryContent","required");
	}

}
