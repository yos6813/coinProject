package com.coin.coin_projec;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
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
	
	@RequestMapping(value = "/annual")
	public String annual(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		model.addAttribute("list2", service.userListAll(user));
		if(aService.annualList(admit) != null){
			model.addAttribute("list", aService.annualList(admit));
		}
		
		return "admit/annual";
	}
	
	@RequestMapping(value = "/annualWrite", method=RequestMethod.POST)
	public String annualWrite(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.insertAnnual(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/annualAccept", method=RequestMethod.POST)
	public String annualAccept(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.annualAccept(admit);
		aService.insertCalendar(admit);
		aService.userAnnualUpdate(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/annualDeny", method=RequestMethod.POST)
	public String annualDeny(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.requestDeny(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/modAnnual", method=RequestMethod.POST)
	public String modAnnual(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.updateAnnual(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/managers")
	public String manager(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		model.addAttribute("list2", service.userListAll(user));
		if(aService.managerList(admit) != null){
			model.addAttribute("list", aService.managerList(admit));
		}
		
		return "admit/manager";
	}
	
	@RequestMapping(value = "/managerInsert", method=RequestMethod.POST)
	public String managerInsert(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		aService.divisionInsert(admit);
		aService.userGradeUpdate(admit);
		
		return "redirect:/managers?email=" + email;
	}
	
	@RequestMapping(value = "/managerUpdate", method=RequestMethod.POST)
	public String managerUpdate(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		aService.managerUpdate(admit);
		
		return "redirect:/managers?email=" + email;
	}
	
	@RequestMapping(value = "/managerModal")
	public String managerModal(@RequestParam ("email") String email, @RequestParam ("id") int id,
							   Project project, Model model, User user, Admit admit) {
		model.addAttribute(aService.managerSelect(id));
		
		return "include/managerModal";
	}
	
	@RequestMapping(value = "/managerDel", method=RequestMethod.POST)
	public String managerDel(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		aService.managerDelete(admit);
		
		return "redirect:/managers?email=" + email;
	}
	
	@RequestMapping(value = "/requestAdmit")
	public String requestAdmit(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit
							   , Criteria cri) {
		model.addAttribute(service.read(email));
		
		model.addAttribute("list", aService.requestList(cri));
		model.addAttribute("list2", aService.bookRequestList(cri));
		model.addAttribute("list3", aService.articleRequestList(cri));
		
		return "admit/requestAdmit";
	}
	
	@RequestMapping(value = "/articleList")
	public String articleList(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit
							  , Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", aService.requestList(cri));
		model.addAttribute("list2", aService.bookRequestList(cri));
		model.addAttribute("list3", aService.articleRequestList(cri));
		
		return "admit/requestAdmit";
	}
	
	@RequestMapping(value = "/bookDeny", method=RequestMethod.POST)
	public String bookDeny(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.bookDeny(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/articleDeny", method=RequestMethod.POST)
	public String articleDeny(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.articleDeny(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/bookAccept", method=RequestMethod.POST)
	public String bookAccept(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.bookAccept(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/articleAccept", method=RequestMethod.POST)
	public String articleAccept(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit) {
		aService.articleAccept(admit);
		
		return "redirect:/annual?email=" + email;
	}
	
	@RequestMapping(value = "/annualModalList")
	public String annualModalList(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit
							  , Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", aService.requestList(cri));
		
		return "include/requestModal";
	}
	
	@RequestMapping(value = "/bookModalList")
	public String bookModalList(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit
							  , Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list2", aService.bookRequestList(cri));
		
		return "include/bookModal";
	}
	
	@RequestMapping(value = "/articleModalList")
	public String articleModalList(@RequestParam ("email") String email, Project project, Model model, User user, Admit admit
							  , Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list3", aService.articleRequestList(cri));
		
		return "include/articleModal";
	}
	
	@RequestMapping(value = "/requestModal")
	public String requestModal(@RequestParam ("email") String email, @RequestParam ("id") int id,
							   Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		model.addAttribute(aService.requestInfo(id));
		
		return "include/rModal";
	}
	
	@RequestMapping(value = "/bookModal")
	public String bookModal(@RequestParam ("email") String email, @RequestParam ("id") int id,
							   Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		model.addAttribute(aService.bookInfo(id));
		
		return "include/bModal";
	}
	
	@RequestMapping(value = "/articleModal")
	public String articleModal(@RequestParam ("email") String email, @RequestParam ("id") int id,
							   Project project, Model model, User user, Admit admit) {
		model.addAttribute(service.read(email));
		model.addAttribute(aService.articleInfo(id));
		
		return "include/aModal";
	}
}
