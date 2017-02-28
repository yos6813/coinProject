package com.coin.coin_projec;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.persistence.User;
import org.zerock.service.UserService;

@Controller
public class cardController {
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(cardController.class);
	
	@RequestMapping(value = "/cardList", method=RequestMethod.GET)
	public String cardList(@RequestParam("email") String email, Locale locale, Model model, User user) {
		model.addAttribute(service.read(email));
		
		return "/card/cardList";
	}
}
