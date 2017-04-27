package com.coin.coin_projec;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.persistence.Calendar;
import org.zerock.persistence.Project;
import org.zerock.persistence.Request;
import org.zerock.service.CalendarService;
import org.zerock.service.RequestService;
import org.zerock.service.UserService;

@Controller
public class RequestController {
	@Inject
	private UserService service;
	
	@Inject
	private RequestService rService;
	
	@Inject
	private CalendarService calService;
	
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);
	
	@RequestMapping(value = "/book")
	public String book(@RequestParam ("email") String email, Project project, Model model, Calendar calendar) {
		model.addAttribute(service.read(email));
		if(calService.bookManager(calendar) != null){
			model.addAttribute("list1", calService.bookManager(calendar));
		}
		
		return "/request/book";
	}
	
	@RequestMapping(value = "/bookRequest", method=RequestMethod.POST)
	public String bookRequest(@RequestParam ("email") String email, Project project, Model model, Request request) {
		model.addAttribute(service.read(email));
		rService.bookRequest(request);
		
		return "redirect:/book?email=" + email;
	}
	
	@RequestMapping(value = "/article")
	public String article(@RequestParam ("email") String email, Project project, Model model, Calendar calendar) {
		model.addAttribute(service.read(email));
		
		if(calService.articleManager(calendar) != null){
			model.addAttribute("list1", calService.articleManager(calendar));
		}
		
		return "/request/article";
	}
	
	@RequestMapping(value = "/articleRequest", method=RequestMethod.POST)
	public String articleRequest(@RequestParam ("email") String email, Project project, Model model, Request request) {
		model.addAttribute(service.read(email));
		rService.articleRequest(request);
		
		return "redirect:/article?email=" + email;
	}
}
