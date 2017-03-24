package com.coin.coin_projec;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.persistence.User;
import org.zerock.persistence.Vote;
import org.zerock.service.UserService;
import org.zerock.service.VoteService;

@Controller
public class VoteController {

	@Inject
	private UserService service;
	
	@Inject
	private VoteService vService;
	
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@RequestMapping(value = "/voteList")
	public String voteList(@RequestParam("email") String email, Locale locale, Model model, User user, Vote vote) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", vService.listVote(vote));
		return "vote/voteList";
	}
	
	@RequestMapping(value = "/voteWrite")
	public String voteWrite(@RequestParam("email") String email, Locale locale, Model model, User user) {
		model.addAttribute(service.read(email));
			
		return "vote/voteWrite";
	}
	
	@RequestMapping(value = "/createVote")
	public String createVote(@RequestParam("email") String email, Locale locale, Model model, User user, Vote vote,
							 HttpSession session) throws FileNotFoundException, IOException {
		model.addAttribute(service.read(email));
		vService.insertVote(vote);
		
		String uploadPath = session.getServletContext().getRealPath("/resources/img");
		List<String> vote1 = vote.getiText2();
		List<MultipartFile> file = vote.getFile();
		vote.setvNo(vote.getNo());
		vote.setIcount(0);
		
		for(int i=0; i<vote1.size(); i++){
			if(!file.get(i).isEmpty()){
				FileCopyUtils.copy(file.get(i).getInputStream(), new FileOutputStream(uploadPath + "/" + file.get(i).getOriginalFilename()));
				vote.setFileName(file.get(i).getOriginalFilename());
			} else {
				vote.setFileName("");
			}
			vote.setiText(vote1.get(i));
			vService.insertVoteItems(vote);
		}
			
		return "redirect:/voteList?email=" + email;
	}
	
	@RequestMapping(value = "/voteView")
	public String voteView(@RequestParam("email") String email, @RequestParam("vNo") int vNo,
						   Locale locale, Model model, User user, Vote vote) {
		model.addAttribute(service.read(email));
		model.addAttribute(vService.viewVote(vNo));
		model.addAttribute("list", vService.viewVoteItems(vNo));
		
		List<Vote> redirect = vService.voteUser(vote);
		
		if(!redirect.isEmpty()){
			return "vote/voteResult";
		} else {
			return "vote/voteView";
		}
	}
	
	@RequestMapping(value = "/updateIcount")
	@ResponseBody
	public String updateIcount(@RequestParam("email") String email, @RequestParam("iNo") List<Integer> iNo, @RequestParam("vNo") int vNo,
						   Locale locale, Model model, User user, Vote vote) {
		
		for(int i=0; i<iNo.size(); i++){
			model.addAttribute(service.read(email));
			vService.icountUpdate(iNo.get(i));
			vService.insertVoteUser(vote);
		}
		
		return "redirect:/vote?email=" + email + "&vNo=" + vNo;
	}
	
	@RequestMapping(value = "/voteResult")
	public String voteResult(@RequestParam("email") String email, @RequestParam("vNo") int vNo,
						   Locale locale, Model model, User user, Vote vote) {
		model.addAttribute(service.read(email));
		model.addAttribute(vService.viewVote(vNo));
		model.addAttribute("list", vService.viewVoteItems(vNo));
		
		return "vote/voteResult";
	}
	
	@RequestMapping(value = "/vote", method=RequestMethod.GET) 
	public String vote(@RequestParam("email") String email, @RequestParam("vNo") int vNo,
					   Locale locale, Model model, User user, Vote vote) {
		model.addAttribute(service.read(email));
		
		List<Vote> redirect = vService.voteUser(vote);
		
		if(!redirect.isEmpty()){
			return "redirect:/voteResult?email=" + email + "&vNo=" + vNo;
		} else {
			return "redirect:/voteView?email=" + email + "&vNo=" + vNo;
		}
	}
}
