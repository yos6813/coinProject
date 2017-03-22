package com.coin.coin_projec;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.persistence.Board;
import org.zerock.persistence.Client;
import org.zerock.persistence.Criteria;
import org.zerock.persistence.PageMaker;
import org.zerock.persistence.Project;
import org.zerock.persistence.User;
import org.zerock.service.BoardService;
import org.zerock.service.ClientService;
import org.zerock.service.ProjectService;
import org.zerock.service.UserService;

@Controller
public class taskController {
	
	@Inject
	private UserService service;
	
	@Inject
	private ProjectService pService;
	
	@Inject
	private BoardService bService;
	
	@Inject
	private ClientService ctService;
	
	private static final Logger logger = LoggerFactory.getLogger(taskController.class);
	
	@RequestMapping(value = "/taskWrite", method=RequestMethod.GET)
	public String taskWrite(@RequestParam (value="pNo",required=false) String pNo, @RequestParam ("email") String email, Locale locale, Model model, Board board, Project project, User user) {
		if(pNo == null){
			model.addAttribute("list", pService.viewList());
		} else {
			model.addAttribute("list", pService.listProject(pNo));
			model.addAttribute(pService.readProject(pNo));
		}
		model.addAttribute(service.read(email));
		model.addAttribute("list2", service.listAll2(email));
		
		return "task/taskWrite";
	}
	
	 @RequestMapping(value="/taskWriteP", method=RequestMethod.POST)
	 public String taskWriteP(Model model, @RequestParam ("email") String email, Board board, Project project, User user, HttpServletRequest request) {
		 bService.insertBoard(board);
		 logger.info(board.toString());
		 
		 return "redirect:projectList?email="+ email;
    }
	
	@RequestMapping(value="/activityWrite")
	 public String writeActivity(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board, Project project, User user, HttpServletRequest request) {
		model.addAttribute(bService.viewBoard(bNo));
		model.addAttribute("list2", service.listAll2(email));
		
		return "task/activityWrite";
	}
	
	@RequestMapping(value="/aWrite", method=RequestMethod.POST)
	 public String aWrite(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board, Project project, User user, HttpServletRequest request) {
		bService.insertActivity(board);
		
		return "redirect:projectView?email=" + email + "&bNo=" + bNo;
	}
	
	
	@RequestMapping(value="/createTask")
	 public String createTask(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board
			 , @RequestParam (value="aNo", required=false) String aNo, Project project, User user, HttpServletRequest request) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", bService.ActivityList1(board));
		model.addAttribute("list2", service.listAll2(email));
		if(aNo != null){
			model.addAttribute(bService.viewActivity(aNo));
		}
		
		return "task/createTask";
	}
	
	@RequestMapping(value="/createT", method=RequestMethod.POST)
	 public String createT(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam ("aNo") int aNo, Board board, User user, HttpServletRequest request) {
		bService.insertTask(board);
		
		return "redirect:projectView?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo;
	}
	
	
	@RequestMapping(value="/deleteP", method=RequestMethod.POST)
	 public String deleteP(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			Board board, User user, RedirectAttributes rttr) {
		
		bService.delProject(bNo);
		bService.delActivity(bNo);
		bService.delTask(bNo);
		
		return "redirect:/projectList?email=" + email;
	}
	
	@RequestMapping(value="/deleteA", method=RequestMethod.POST)
	 public String deleteA(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam ("aNo") int aNo, Board board, User user, RedirectAttributes rttr) {
		
		bService.delA(aNo);
		bService.delT(aNo);
		
		return "redirect:/projectView?email=" + email + "&bNo=" + bNo;
	}
	
	@RequestMapping(value="/deleteT", method=RequestMethod.POST)
	 public String deleteT(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam ("aNo") int aNo, @RequestParam ("tNo") int tNo, Board board, User user, RedirectAttributes rttr) {
		
		bService.deleteTask(tNo);
		
		return "redirect:/projectView?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo;
	}
	
	/* modify */
	
	@RequestMapping(value="/modifyP")
	 public String modifyP(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			Board board, User user, RedirectAttributes rttr) {
		model.addAttribute(bService.viewBoard(bNo));
		model.addAttribute(service.read(email));
		model.addAttribute("list1", service.listAll2(email));
		
		return "modify/modifyP";
	}
	
	@RequestMapping(value="/modifyBoard")
	 public String modifyBoard(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			Board board, User user, RedirectAttributes rttr) {
		bService.updateP(board);
		
		return "redirect:/projectView?email=" + email + "&bNo=" + bNo;
	}
	
	@RequestMapping(value="/modifyA")
	 public String modifyA(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") String aNo, Board board, User user, RedirectAttributes rttr) {
		model.addAttribute(bService.viewActivity(aNo));
		model.addAttribute(service.read(email));
		model.addAttribute("list1", service.listAll2(email));
		
		return "modify/modifyA";
	}
	
	@RequestMapping(value="/modifyActivity")
	 public String modifyActivity(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") String aNo, Board board, User user, RedirectAttributes rttr) {
		bService.updateA(board);
		
		return "redirect:/projectView?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo;
	}
	
	@RequestMapping(value="/modifyT")
	 public String modifyT(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") int aNo, @RequestParam("tNo") int tNo,  Board board, User user, RedirectAttributes rttr) {
		
		model.addAttribute(bService.viewTask(tNo));
		model.addAttribute(service.read(email));
		model.addAttribute("list1", service.listAll2(email));
		return "modify/modifyT";
	}
	
	@RequestMapping(value="/modifyTask")
	 public String modifyTask(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") int aNo, @RequestParam("tNo") int tNo,  Board board, User user, RedirectAttributes rttr) {
		bService.updateT(board);
		return "redirect:taskView?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo + "&tNo=" + tNo;
	}
	
	@RequestMapping(value="/taskView")
	 public String taskView(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") String aNo, @RequestParam("tNo") int tNo,  Board board, User user, RedirectAttributes rttr,
			 Criteria cri, @RequestParam (value="wNo", required=false) String wNo, Client client) {
		model.addAttribute(service.read(email));
		model.addAttribute(bService.viewTask(tNo));
		model.addAttribute("list2", bService.selectUserWorkLog(tNo));
		model.addAttribute("list", bService.selectWorkLog(cri));
		model.addAttribute("list3", ctService.clientList(client));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountWCriteria(cri));
		
		return "task/taskView";
	}
}