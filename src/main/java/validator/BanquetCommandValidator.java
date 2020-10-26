package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class BanquetCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "banquetType","required");
		ValidationUtils.rejectIfEmpty(errors, "banquetPurpose","required");
		ValidationUtils.rejectIfEmpty(errors, "banquetRequest","required");
		ValidationUtils.rejectIfEmpty(errors, "banquetCharge","required");
	}

}
