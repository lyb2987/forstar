package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class CounselingCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "counselingSubject","required");
		ValidationUtils.rejectIfEmpty(errors, "counselingDate","required");
		ValidationUtils.rejectIfEmpty(errors, "counselingType","required");
		ValidationUtils.rejectIfEmpty(errors, "counselingPurpose","required");
		ValidationUtils.rejectIfEmpty(errors, "counselingContent","required");
	}

}
