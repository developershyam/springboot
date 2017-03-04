package com.sample.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.data.model.User;
import com.sample.service.SecurityService;
import com.sample.service.UserService;
import com.sample.validator.UserValidator;

/**
 * This class is designed for REST service end-points for User which take
 * incoming request and perform corresponding business logic.
 * 
 * @author shyam.pareek
 *
 */
@Controller
public class WebController {
	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		
		User userForm =new User();
		model.addAttribute("userForm", userForm);

		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		securityService.autologin(userForm.getEmail(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcome(Model model) {

		Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder
				.getContext().getAuthentication().getAuthorities();
		System.out.println("User: " + SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		System.out.println("authorities: " + authorities.size() + " >>> " + authorities);

		return "welcome";
	}

	@RequestMapping(value = "/managementView", method = RequestMethod.GET)
	public String management(Model model) {

		return "management";
	}

	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	public String employees(Model model) {

		return "employees";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(Model model) {

		return "error";
	}
}