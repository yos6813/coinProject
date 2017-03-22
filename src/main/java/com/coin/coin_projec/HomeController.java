package com.coin.coin_projec;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.persistence.Project;
import org.zerock.persistence.User;
import org.zerock.service.ProjectService;
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
	@RequestMapping(value = "/home", method=RequestMethod.GET)
	public String home(@RequestParam("email") String email, Locale locale, Model model, User user) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", service.listAll(email));
		
		return "notifycation/notifyList";
	}
	
	@RequestMapping(value="/exchange", method=RequestMethod.POST)
    public String createUser(@RequestParam("email") String email, User user, RedirectAttributes rttr) {
    	logger.info("post+++++++++++++++++++++++++++");
    	
    	service.update(user);
    	service.update2(user);
    	logger.info(user.toString());
    	
        return "redirect:home?email=" + email;
    }
	
	@RequestMapping(value = "/")
	public String login(Locale locale) {
		
		return "login";
	}
	
	@RequestMapping(value = "/home1")
	public String home1(@RequestParam("email") String email, Locale locale, Model model, User user) {
		String[][] test = {{"1", "23"}};
//		model.addAttribute(service.read(email));
		
		logger.info(test[0][1]);
		
		return "redirect:home?email=" + email;
	}
}
