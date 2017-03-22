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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.persistence.Notify;
import org.zerock.persistence.User;
import org.zerock.service.NotifyService;
import org.zerock.service.UserService;

@Controller
public class NotifyController {
	@Inject
	private UserService service;
	
	@Inject
	private NotifyService nService;
	
	private static final Logger logger = LoggerFactory.getLogger(NotifyController.class);
	
	@RequestMapping(value = "/notifyList")
	public String notifyList(@RequestParam("email") String email,
							 Locale locale, Model model, User user, Notify notify) {
			model.addAttribute(service.read(email));
			if(nService.notifyList(notify)!=null){
				model.addAttribute("list", nService.notifyList(notify));
			}
			
		return "notification/notifyList";
	}
	
	@RequestMapping(value = "/notifyWrite")
	public String notifyWrite(@RequestParam("email") String email, Locale locale, Model model, User user) {
			model.addAttribute(service.read(email));
			
		return "notification/notifyWrite";
	}
	
	@RequestMapping(value = "/notifyRegist", method=RequestMethod.POST)
	public String notifyRegist(@RequestParam("email") String email, Locale locale, Model model, User user, Notify notify, HttpSession session) {
			model.addAttribute(service.read(email));
			nService.insertNotify(notify);
			
			String uploadPath = session.getServletContext().getRealPath("/resources/img");
			System.out.println("upload path=" + uploadPath);
			
			List<MultipartFile> file = notify.getnFile();
			
			notify.setnNo(notify.getNo());
			
			try {
				for(Integer i=0; i<file.size(); i++){
					FileCopyUtils.copy(file.get(i).getInputStream(), new FileOutputStream(uploadPath + "/" + file.get(i).getOriginalFilename()));
					notify.setnFileName(file.get(i).getOriginalFilename());
					nService.insertNotifyFile(notify);
				}
				logger.info("success업로드 성공");
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				logger.info("fail업로드 실패");
			} catch (IOException e) {
				e.printStackTrace();
				logger.info("fail업로드 실패");
			}
			
		return "redirect:notifyList?email=" + email;
	}
	
	@RequestMapping(value = "/notifyView")
	public String notifyView(@RequestParam("email") String email, @RequestParam("nNo") int nNo,
							 Locale locale, Model model, User user, Notify notify) {
			model.addAttribute(service.read(email));
			model.addAttribute(nService.notifyView(nNo));
			model.addAttribute("list", nService.commentList(nNo));
			model.addAttribute("list2", nService.fileList(nNo));
			
		return "notification/notifyView";
	}
	
	@RequestMapping(value = "/commentWrite")
	public String commentWrite(@RequestParam("email") String email, @RequestParam("nNo") int nNo,
							 Locale locale, Model model, User user, Notify notify) {
			model.addAttribute(service.read(email));
			notify.setCoUser(email);
			nService.insertComments(notify);
			
		return "redirect:notifyView?email=" + email + "&nNo=" + nNo;
	}
}
