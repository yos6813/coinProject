package com.coin.coin_projec;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.persistence.User;
import org.zerock.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String home(String email, Locale locale, Model model, User user) {
		model.addAttribute("list", service.listAll());
//		model.addAttribute(service.read(email));
//		service.update(user);
		return "home";
	}
	
	@RequestMapping(value = "/login")
	public String login(Locale locale) {
		
		return "login";
	}
}
