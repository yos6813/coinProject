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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.persistence.Client;
import org.zerock.persistence.User;
import org.zerock.service.ClientService;
import org.zerock.service.UserService;

@Controller
public class ClientController {
	
	@Inject
	private UserService service;
	
	@Inject
	private ClientService ctService;
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@RequestMapping(value = "/clientList")
	public String clientList(@RequestParam("email") String email, @RequestParam(value="ctNo",required=false) String ctNo,
			@RequestParam(value="fNo",required=false) String fNo, Locale locale, Model model, User user, Client client) {
			model.addAttribute(service.read(email));
			model.addAttribute("list", ctService.clientList(client));
			
			if(ctNo != null){
				model.addAttribute(ctService.selectClient(ctNo));
				model.addAttribute("list2", ctService.fileList(ctNo));
				model.addAttribute("list3", ctService.taskList(ctNo));
			}
			
			if(fNo != null){
				model.addAttribute(ctService.fileView(fNo));
			}
		return "client/clientList";
	}
	
	@RequestMapping(value = "/modal")
	public String modal(@RequestParam("email") String email, @RequestParam("fNo") String fNo, @RequestParam("ctNo") int ctNo,
								Locale locale, Model model, User user) {
		model.addAttribute("list", service.read(email));
		model.addAttribute(ctService.fileView(fNo));
		
		return "include/modal";
	}
	
	@RequestMapping(value = "/clientRegister")
	public String clientRegister(@RequestParam("email") String email, @RequestParam(value="ctNo",required=false) String ctNo,
								 Locale locale, Model model, User user) {
		if(ctNo != null){
			model.addAttribute("list", service.read(email));
			model.addAttribute(ctService.selectClient(ctNo));
		} else {
			model.addAttribute("list", service.read(email));
		}
		
		return "client/clientRegister";
	}
	
	@RequestMapping(value = "/registerClient", method=RequestMethod.POST)
	public String registerClient(@RequestParam("email") String email, @RequestParam(value="ctNo",required=false) String ctNo,
								 Locale locale, Model model, User user, Client client) {
		model.addAttribute("list", service.read(email));

		if(ctNo != null){
			ctService.updateClient(client);
		} else {
			ctService.clientRegister(client);
		}
		return "redirect:/clientList?email=" + email;
	}
	
	@RequestMapping(value = "/deleteClient", method=RequestMethod.POST)
	public String deleteClient(@RequestParam("email") String email, @RequestParam("ctNo") String ctNo,
							   Locale locale, Model model, User user, Client client) {
		model.addAttribute("list", service.read(email));
		ctService.deleteClient(ctNo);
//		ctService.deleteContract(ctNo);
//		ctService.deleteWorkLog(ctNo);
		
		return "redirect:/clientList?email=" + email;
	}

	@RequestMapping(value = "/contractFile", method=RequestMethod.POST)
	public String contractFile(@RequestParam("email") String email, @RequestParam("ctNo") int ctNo,
							   Locale locale, Model model, User user, Client client, HttpSession session) {
		model.addAttribute("list", service.read(email));
		String uploadPath = session.getServletContext().getRealPath("/resources/img");
		System.out.println("upload path=" + uploadPath);
		
		List<MultipartFile> file = client.getfFile();
		
		try {
			for(Integer i=0; i<file.size(); i++){
				FileCopyUtils.copy(file.get(i).getInputStream(), new FileOutputStream(uploadPath + "/" + file.get(i).getOriginalFilename()));
				client.setfName(file.get(i).getOriginalFilename());
				ctService.insertFile(client);
			}
			logger.info("success업로드 성공");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			logger.info("fail업로드 실패");
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("fail업로드 실패");
		}
		
		
		return "redirect:/clientList?email=" + email;
	}
}
