package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.RoomCommand.LaundryCommand;

public class LaundryValidator implements Validator{

	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return LaundryCommand.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(errors, "laundryNum", "required");
		ValidationUtils.rejectIfEmpty(errors, "laundryBad", "required");
		ValidationUtils.rejectIfEmpty(errors, "laundryChange", "required");
		ValidationUtils.rejectIfEmpty(errors, "laundryPrevention", "required");
		
		

	}

}
