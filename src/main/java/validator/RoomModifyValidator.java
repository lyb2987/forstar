package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.RoomCommand.RoomInfoCommand;

public class RoomModifyValidator implements Validator{

	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return RoomInfoCommand.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(errors, "roomNum", "required");
		ValidationUtils.rejectIfEmpty(errors, "ratingNum", "required");
		ValidationUtils.rejectIfEmpty(errors, "roomPic", "required");
		ValidationUtils.rejectIfEmpty(errors, "roomContent", "required");
		ValidationUtils.rejectIfEmpty(errors, "roomPay", "required");
		

	}

}
