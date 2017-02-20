package com.coin.coin_projec;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.persistence.Project;
import org.zerock.persistence.User;
import org.zerock.service.ProjectService;
import org.zerock.service.UserService;

@Controller
public class AdmitController {

	@Inject
	private UserService service;
	
	@Inject
	private ProjectService pService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdmitController.class);
	
	@RequestMapping(value = "/admit")
	public String view(@RequestParam ("email") String email, Project project, Model model) {
		model.addAttribute("list", pService.viewList());
		model.addAttribute("list1", pService.viewPT());
		model.addAttribute(service.read(email));
		return "/admit/admitView";
	}
	
	@RequestMapping(value = "/registProject")
	public String registProject(@RequestParam ("email") String email, Project project, Model model, User user) {
		pService.insertProject(project);
		
		return "redirect:/admit?email=" + email;
	}
	
	@RequestMapping(value = "/registTOA")
	public String registTOA(@RequestParam ("email") String email, Project project, Model model, User user) {
		pService.insertTOA(project);
		
		return "redirect:/admit?email=" + email;
	}
}
