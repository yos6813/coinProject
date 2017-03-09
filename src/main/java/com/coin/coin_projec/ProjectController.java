package com.coin.coin_projec;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.persistence.Board;
import org.zerock.persistence.Criteria;
import org.zerock.persistence.PageMaker;
import org.zerock.persistence.Project;
import org.zerock.persistence.User;
import org.zerock.service.BoardService;
import org.zerock.service.ProjectService;
import org.zerock.service.UserService;

@Controller
public class ProjectController {
	@Inject
	private UserService service;
	
	@Inject
	private ProjectService pService;
	
	@Inject
	private BoardService bService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	
	@RequestMapping(value = "/projectView")
	public String projectView(@RequestParam ("email") String email, @RequestParam (value="bNo") int bNo, Model model, Board board,
			User user, Project project, Criteria cri, @RequestParam (value="aNo", required=false) String aNo) {
		model.addAttribute(service.read(email));
		model.addAttribute(bService.viewBoard(bNo));
		model.addAttribute("list", bService.listBoard(board));
		model.addAttribute("list2", bService.ActivityList1(board));
		
		model.addAttribute("list3", bService.countList1(board));
		model.addAttribute("list4", bService.countList2(board));
		model.addAttribute("list5", bService.countList3(board));
		model.addAttribute("list6", bService.countList4(board));
		
		model.addAttribute("list1", bService.countTask(board));
		model.addAttribute("list9", bService.countPercent(bNo));
		
		model.addAttribute("list7", bService.listTask(cri));
		
		model.addAttribute("list10", bService.countOrderbyUser(aNo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountTCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "projectView";
	}
	
	@RequestMapping(value = "/projectList")
	public String projectList(@RequestParam ("email") String email, Model model, Board board, Criteria cri) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", bService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "projectList";
	}
}
