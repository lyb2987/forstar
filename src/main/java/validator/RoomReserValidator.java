package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.RoomCommand.RoomReserCommand;

public class RoomReserValidator implements Validator{

	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return RoomReserCommand.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(errors, "roomReserNum", "required");
		ValidationUtils.rejectIfEmpty(errors, "roomNum", "required");
		ValidationUtils.rejectIfEmpty(errors, "reserDate", "required");
		ValidationUtils.rejectIfEmpty(errors, "reserCharge", "required");
		ValidationUtils.rejectIfEmpty(errors, "reserStart", "required");
		ValidationUtils.rejectIfEmpty(errors, "reserEnd", "required");
		

	}

}
