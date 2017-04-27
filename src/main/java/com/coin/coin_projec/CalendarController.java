package com.coin.coin_projec;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
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

@Controller
public class CalendarController {
	@Inject
	private UserService service;
	
	@Inject
	private CalendarService calService;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@RequestMapping(value = "/test1")
	@ResponseBody
	public Calendar test1(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar,
						HttpServletResponse response, @RequestParam("start") String start, @RequestParam("end") String end) {
		model.addAttribute(service.read(email));
		Calendar result = calService.holidayCount(calendar);
		
		return result;
	}
	
	@RequestMapping(value = "/calendarEvent")
	@ResponseBody
	public List<Calendar> calendarEvent(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar,
						HttpServletResponse response) {
		model.addAttribute(service.read(email));
		List<Calendar> result = calService.scheduleList(calendar);
		
		return result;
	}

	@RequestMapping(value = "/calendar", method=RequestMethod.GET)
	public String test(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		
		if(calService.annualList(email) != null){
			model.addAttribute(calService.annualList(email));
		}
		
		if(calService.annualManager(calendar) != null){
			model.addAttribute("list1", calService.annualManager(calendar));
		}
		
		if(calService.scheduleList(calendar) != null){
			model.addAttribute("list", calService.scheduleList(calendar));
		}
		
		return "/calendar/calendar";
	}
	
	@RequestMapping(value = "/requestAnnual", method=RequestMethod.POST)
	public String requestAnnual(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		calService.annualRequest(calendar);
		
		return "redirect:/calendar?email=" + email;
	}
	
	@RequestMapping(value = "/testWrite", method=RequestMethod.POST)
	public String testWrite(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		calService.insertSchedule(calendar);
		
		return "redirect:/calendar?email=" + email;
	}
	
	@RequestMapping(value = "/userAnnual", method=RequestMethod.GET)
	public String userAnnual(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		if(calService.annualListAll(calendar) != null){
			model.addAttribute("list", calService.annualListAll(calendar));
		}
		
		return "/calendar/userAnnual";
	}
	
	@RequestMapping(value = "/modalUserAnnual")
	public String modalUserAnnual(@RequestParam("email") String email, @RequestParam("id") int id,
								  Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		model.addAttribute(calService.searchUserAnnual(id));
		
		return "include/userAnnualModal";
	}
	
	@RequestMapping(value = "/modUserAnnual", method=RequestMethod.POST)
	public String modUserAnnual(@RequestParam("email") String email, Locale locale, Model model, User user, Calendar calendar) {
		model.addAttribute(service.read(email));
		calService.updateAnnual(calendar);
		
		return "redirect:/userAnnual?email=" + email;
	}
}
