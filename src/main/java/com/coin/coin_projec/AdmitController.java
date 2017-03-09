package com.coin.coin_projec;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.persistence.Admit;
import org.zerock.persistence.Criteria;
import org.zerock.persistence.PageMaker;
import org.zerock.persistence.Project;
import org.zerock.persistence.User;
import org.zerock.service.AdmitService;
import org.zerock.service.ProjectService;
import org.zerock.service.UserService;

@Controller
public class AdmitController {

	@Inject
	private UserService service;
	
	@Inject
	private ProjectService pService;
	
	@Inject
	private AdmitService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdmitController.class);
	
	@RequestMapping(value = "/admit")
	public String view(@RequestParam ("email") String email, Project project, Model model) {
		model.addAttribute("list", pService.viewList());
		model.addAttribute(service.read(email));
		return "admit/admitView";
	}
	
	@RequestMapping(value = "/registProject")
	public String registProject(@RequestParam ("email") String email, Project project, Model model, User user) {
		pService.insertProject(project);
		
		return "redirect:admit?email=" + email;
	}
	
	@RequestMapping(value = "/abstractPage")
	public String abstractPage(@RequestParam ("email") String email, Project project, Model model, Admit admit,
							   @RequestParam (value="abNo", required=false) int abNo,  @RequestParam (value="page") int page,
							   Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", aService.selectAbstract(admit));
		model.addAttribute("list2", aService.selectAbstract2(admit));
		model.addAttribute("list3", aService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(aService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "admit/abstractPage";
	}
	
	@RequestMapping(value = "/registAbstract")
	public String registAbstract(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit,
								 @RequestParam (value="abNo", required=false) int abNo, @RequestParam (value="page") int page) {
		aService.insertAbstract(admit);
		
		return "redirect:abstractPage?email=" + email + "&abNo=" + abNo + "&page=" + page;
	}
	
	@RequestMapping(value = "/registAbstract2")
	public String registAbstract2(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit,
								  @RequestParam (value="abNo", required=false) int abNo, @RequestParam (value="page") int page) {
		aService.insertAbstract2(admit);
		
		return "redirect:abstractPage?email=" + email + "&abNo=" + abNo + "&page=" + page;
	}
}
