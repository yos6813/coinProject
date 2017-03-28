package com.coin.coin_projec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.persistence.Calendar;
import org.zerock.persistence.User;
import org.zerock.service.CalendarService;
import org.zerock.service.UserService;

import com.google.gson.Gson;

@Controller
public class CalendarController {
	@Inject
	private UserService service;
	
	@Inject
	private CalendarService calService;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@RequestMapping(value = "/test1")
	@ResponseBody
	public List<Calendar> test1(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar,
						HttpServletResponse response) {
		model.addAttribute(service.read(email));
		List<Calendar> result = calService.scheduleList(calendar);
		return result;
	}
	

	@RequestMapping(value = "/test", method=RequestMethod.GET)
	public String test(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		model.addAttribute(calService.scheduleList(calendar));
		
		return "/test";
	}
	
	@RequestMapping(value = "/testWrite", method=RequestMethod.POST)
	public String testWrite(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		calService.insertSchedule(calendar);
		
		return "redirect:/test?email=" + email;
	}
}
