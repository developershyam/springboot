package com.sample.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.sample.data.model.User;
import com.sample.service.UserService;

/**
 * This class is used for validation on user fields.
 * 
 * @author shyam.pareek
 *
 */
@Component
public class UserValidator implements Validator {
	@Autowired
	private UserService userService;

	@Override
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		User user = (User) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		if (!ValidationUtil.validateEmail(user.getEmail())) {

			errors.rejectValue("email", "Invalid");
		}
		if (userService.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "Duplicate");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		if (user.getPassword().length() < 6 || user.getPassword().length() > 32) {
			errors.rejectValue("password", "Size");
		}

		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff");
		}
	}
}