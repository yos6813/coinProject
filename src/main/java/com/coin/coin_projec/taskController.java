package com.coin.coin_projec;


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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.persistence.Board;
import org.zerock.persistence.Criteria;
import org.zerock.persistence.PageMaker;
import org.zerock.persistence.Project;
import org.zerock.persistence.User;
import org.zerock.service.BoardService;
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
	
	private static final Logger logger = LoggerFactory.getLogger(taskController.class);
	
	@RequestMapping(value = "/task")
	public String home(@RequestParam (value="type", required=false) String type, @RequestParam (value="keyword", required=false) String keyword,
				@RequestParam ("email") String email, Locale locale, Model model, Board board, Project project, User user,
				Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", bService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
			
		return "/task/taskM";
	}
	
	@RequestMapping(value = "/taskWrite", method=RequestMethod.GET)
	public String taskWrite(@RequestParam (value="pNo",required=false) String pNo, @RequestParam ("email") String email, Locale locale, Model model, Board board, Project project, User user) {
		if(pNo == null){
			model.addAttribute("list", pService.viewList());
		} else {
			model.addAttribute("list", pService.listProject(pNo));
			model.addAttribute(pService.readProject(pNo));
		}
		model.addAttribute(service.read(email));
		model.addAttribute("list2", service.listAll(email));
		
		return "/task/taskWrite";
	}
	
	 @RequestMapping(value="/taskWriteP", method=RequestMethod.POST)
	 public String taskWriteP(Model model, @RequestParam ("email") String email, Board board, Project project, User user, HttpServletRequest request) {
		 bService.insertBoard(board);
		 logger.info(board.toString());
		 
		 return "redirect:/task?email=" + email;
    }
	
	@RequestMapping(value="/viewTask")
	 public String viewTask(Model model, @RequestParam ("bNo") int bNo, Board board, Project project, User user,
			 Criteria cri, HttpServletRequest request) {
		model.addAttribute(bService.viewBoard(bNo));
		model.addAttribute("list", bService.listBoard(board));
		model.addAttribute("list2", bService.ActivityList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountACriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/task/viewTask";
	}
	
	@RequestMapping(value="/activityWrite")
	 public String writeActivity(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board, Project project, User user, HttpServletRequest request) {
		model.addAttribute(bService.viewBoard(bNo));
		model.addAttribute("list2", service.listAll(email));
		
		return "/task/activityWrite";
	}
	
	@RequestMapping(value="/aWrite", method=RequestMethod.POST)
	 public String aWrite(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board, Project project, User user, HttpServletRequest request) {
		bService.insertActivity(board);
		
		return "redirect:/viewTask?email=" + email + "&bNo=" + bNo;
	}
	
	@RequestMapping(value="/viewActivity")
	 public String viewActivity(Model model, @RequestParam ("bNo") int bNo, @RequestParam ("aNo") int aNo,
			 Board board, Project project, User user, HttpServletRequest request, Criteria cri) {
		model.addAttribute(bService.viewActivity(aNo));
		model.addAttribute("list", bService.listTask(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountTCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/task/viewActivity";
	}
	
	@RequestMapping(value="/createTask")
	 public String createTask(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board
			 , @RequestParam ("aNo") int aNo, Project project, User user, HttpServletRequest request) {
		model.addAttribute(service.read(email));
		model.addAttribute("list2", service.listAll(email));
		model.addAttribute(bService.viewActivity(aNo));
		
		return "/task/createTask";
	}
	
	@RequestMapping(value="/createT", method=RequestMethod.POST)
	 public String createT(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam ("aNo") int aNo, Board board, User user, HttpServletRequest request) {
		bService.insertTask(board);
		
		return "redirect:/viewActivity?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo;
	}
	
	@RequestMapping(value="/taskView")
	 public String taskView(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo, Board board
			 , @RequestParam ("aNo") int aNo, @RequestParam ("tNo") int tNo, Project project, User user,
			   HttpServletRequest request, Criteria cri) {
		model.addAttribute(bService.viewTask(tNo));
		model.addAttribute("list", bService.listTask(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountTCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/task/taskView";
	}
	
	@RequestMapping(value="/deleteP", method=RequestMethod.POST)
	 public String deleteP(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			Board board, User user, RedirectAttributes rttr) {
		
		bService.delProject(bNo);
		bService.delActivity(bNo);
		bService.delTask(bNo);
		
		return "redirect:/task?email=" + email;
	}
	
	@RequestMapping(value="/deleteA", method=RequestMethod.POST)
	 public String deleteA(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam ("aNo") int aNo, Board board, User user, RedirectAttributes rttr) {
		
		bService.delA(aNo);
		bService.delT(aNo);
		
		return "redirect:/viewTask?email=" + email + "&bNo=" + bNo;
	}
	
	@RequestMapping(value="/deleteT", method=RequestMethod.POST)
	 public String deleteT(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam ("aNo") int aNo, @RequestParam ("tNo") int tNo, Board board, User user, RedirectAttributes rttr) {
		
		bService.deleteTask(tNo);
		
		return "redirect:/viewActivity?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo;
	}
	
	/* modify */
	
	@RequestMapping(value="/modifyP")
	 public String modifyP(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			Board board, User user, RedirectAttributes rttr) {
		model.addAttribute(bService.viewBoard(bNo));
		model.addAttribute(service.read(email));
		model.addAttribute("list1", service.listAll2(email));
		
		return "/modify/modifyP";
	}
	
	@RequestMapping(value="/modifyBoard")
	 public String modifyBoard(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			Board board, User user, RedirectAttributes rttr) {
		bService.updateP(board);
		
		return "redirect:/viewTask?email=" + email + "&bNo=" + bNo;
	}
	
	@RequestMapping(value="/modifyA")
	 public String modifyA(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") int aNo, Board board, User user, RedirectAttributes rttr) {
		model.addAttribute(bService.viewActivity(aNo));
		model.addAttribute(service.read(email));
		model.addAttribute("list1", service.listAll2(email));
		
		return "/modify/modifyA";
	}
	
	@RequestMapping(value="/modifyActivity")
	 public String modifyActivity(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") String aNo, Board board, User user, RedirectAttributes rttr) {
		bService.updateA(board);
		
		return "redirect:/viewActivity?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo;
	}
	
	@RequestMapping(value="/modifyT")
	 public String modifyT(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") int aNo, @RequestParam("tNo") int tNo,  Board board, User user, RedirectAttributes rttr) {
		
		model.addAttribute(bService.viewTask(tNo));
		model.addAttribute(service.read(email));
		model.addAttribute("list1", service.listAll2(email));
		return "/modify/modifyT";
	}
	
	@RequestMapping(value="/modifyTask")
	 public String modifyTask(Model model, @RequestParam("email") String email, @RequestParam ("bNo") int bNo,
			 @RequestParam("aNo") int aNo, @RequestParam("tNo") int tNo,  Board board, User user, RedirectAttributes rttr) {
		bService.updateT(board);
		return "redirect:/taskView?email=" + email + "&bNo=" + bNo + "&aNo=" + aNo + "&tNo=" + tNo;
	}
}