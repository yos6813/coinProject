package com.coin.coin_projec;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		
		if(bService.viewBoard(bNo) != null){
			model.addAttribute(bService.viewBoard(bNo));
		}
		
		model.addAttribute("list2", bService.ActivityList1(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCountACriteria(cri));
		
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
	
	@RequestMapping(value="/file", method=RequestMethod.POST)
	public String fileSubmit(Board board, @RequestParam ("email") String email, Model model,
							 @RequestParam ("aNo") int aNo, HttpSession session){
		
		String uploadPath = session.getServletContext().getRealPath("resources/img");
		
		MultipartFile file = board.getWfile();
		
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(uploadPath + "/" + file.getOriginalFilename()));
			logger.info("success업로드 성공");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			logger.info("fail업로드 실패");
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("fail업로드 실패");
		}
		
		board.setwFileName(file.getOriginalFilename());
		bService.insertWorkLog(board);
		
		return "redirect:taskView?email=" + email + "&aNo=" + aNo;
	}

	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
}
