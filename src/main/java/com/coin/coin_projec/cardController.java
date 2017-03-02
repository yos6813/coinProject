package com.coin.coin_projec;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.persistence.Card;
import org.zerock.persistence.User;
import org.zerock.service.CardService;
import org.zerock.service.UserService;

@Controller
public class cardController {
	@Inject
	private UserService service;
	
	@Inject
	private CardService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(cardController.class);
	
	@RequestMapping(value = "/cardList", method=RequestMethod.GET)
	public String cardList(@RequestParam("email") String email, Locale locale, Model model, User user, Card card) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", cService.usageCardSelect(card));
		return "/card/cardList";
	}
	
	@RequestMapping(value = "/usageWrite", method=RequestMethod.GET)
	public String usageWrite(@RequestParam("email") String email, Locale locale, Model model, User user) {
		model.addAttribute("list", service.listAll(email));
		
		return "/card/usageWrite";
	}
	
	@RequestMapping(value = "/cWrite", method=RequestMethod.POST)
	public String cWrite(@RequestParam("email") String email, Locale locale, Model model, User user, Card card) {
		cService.usageCardInsert(card);
		
		return "redirect:/cardList?email=" + email;
	}
	
//	 @RequestMapping(value = "/excelUploadPage", method = RequestMethod.GET)
//	public String serviceMngForm(Model model, Principal principal, CustomParamMap paramMap) {
//		model.addAttribute("userNm", principal.getName());
//		model.addAttribute("menuTarget", paramMap.get("menuTarget"));
//		return "admin/accountsMng/excelUploadPage";
//	}
//	
//	@RequestMapping(value = "/compExcelUpload")
//	public ModelAndView excelUpload(MultipartHttpServletRequest req){
//		ModelAndView mav = new ModelAndView("admin/accountsMng/excelUploadPage");
//		List<Card> list = new List<Card>();
//		//엑셀 파일이 xls일때와 xlsx일때 서비스 라우팅
//		String excelType = req.getParameter("excelType");
//		if(excelType.equals("xlsx")){
//			list = adminAccountsMngService.xlsxExcelReader(req);
//		}else if(excelType.equals("xls")){
//			list = adminAccountsMngService.xlsExcelReader(req);
//		}
//		mav.addObject("list", list);
//		return mav;
//	}
}
