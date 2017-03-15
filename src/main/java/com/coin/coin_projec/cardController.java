package com.coin.coin_projec;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.zerock.persistence.Card;
import org.zerock.persistence.PageMaker;
import org.zerock.persistence.User;
import org.zerock.service.AdmitService;
import org.zerock.service.CardService;
import org.zerock.service.UserService;
import org.zerock.util.ExcelRead;
import org.zerock.util.ExcelReadOption;

@Controller
public class cardController {
	@Inject
	private UserService service;
	
	@Inject
	private CardService cService;
	
	@Inject
	private AdmitService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(cardController.class);
	
	@RequestMapping(value = "/cardList", method=RequestMethod.GET)
	public String cardList(@RequestParam("email") String email, @RequestParam(value="check", required=false) String check,
						   Locale locale, Model model, User user, Card card) {
		model.addAttribute(service.read(email));
		
		if(check != null){
			model.addAttribute("list", cService.selectUserCard(email));
		} else {
			model.addAttribute("list", cService.usageCardSelect(card));
		}
		model.addAttribute("list1", cService.concatDate(card));
		model.addAttribute("list2", cService.orderByUser(card));
		model.addAttribute("list3", cService.orderByAbstract(card));
		
		Card card1 = new Card();
		card1.setCount(cService.sumUsageCost(card));

		model.addAttribute("cost", card1);
		
		return "card/cardList";
	}
	
	@RequestMapping(value = "/usageWrite", method=RequestMethod.GET)
	public String usageWrite(@RequestParam("email") String email,  @RequestParam (value="abNo") int abNo,
							 Locale locale, Model model, User user, Admit admit) {
		model.addAttribute("list", service.listAll(email));
		model.addAttribute("list2", aService.selectAbstract(admit));
		model.addAttribute("list3", aService.selectAbstract2(admit));
		model.addAttribute("list4", service.listAll2(email));
		
		return "card/usageWrite";
	}
	
	@RequestMapping(value = "/cWrite", method=RequestMethod.POST)
	public String cWrite(@RequestParam("email") String email, Locale locale, Model model, User user, Card card) {
		cService.usageCardInsert(card);
		
		return "redirect:cardList?email=" + email;
	}
	
	@ResponseBody
	@RequestMapping(value = "/massiveWrite", method = RequestMethod.POST)
    public ModelAndView excelUploadAjax(@RequestParam("email") String email, MultipartHttpServletRequest request) throws Exception{
		MultipartFile excelFile = request.getFile("excelFile");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택해 주세요");
        }
 
        File destFile = new File(excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IllegalStateException | IOException e) {
            throw new RuntimeException(e.getMessage(),e);
 
        }
        
        cService.insertMassiveArticleInBoard(destFile);
        
        destFile.delete();
        
        ModelAndView view = new ModelAndView();
        view.setViewName("redirect:cardList?email=" + email);
        return view;
    }
	
	@RequestMapping(value = "/modifyCard", method=RequestMethod.GET)
	public String modifyCard(@RequestParam("email") String email, @RequestParam("cNo") int cNo,
							 Locale locale, Model model, User user, Card card, Admit admit) {
		model.addAttribute(service.read(email));
		model.addAttribute(cService.userCardSelect(cNo));
		model.addAttribute("list2", aService.selectAbstract(admit));
		model.addAttribute("list3", aService.selectAbstract2(admit));
		
		return "card/modifyCard";
	}
	
	@RequestMapping(value = "/cModify", method=RequestMethod.POST)
	public String cModify(@RequestParam("email") String email, @RequestParam("cNo") int cNo,
							 Locale locale, Model model, User user, Card card) {
		model.addAttribute(service.read(email));
		cService.updateCardList(card);
		
		return "redirect:cardList?email=" + email;
	}
	
	@RequestMapping(value = "/cDelete", method=RequestMethod.POST)
	public String cDelete(@RequestParam("email") String email, @RequestParam("cNo") int cNo,
							 Locale locale, Model model, User user, Card card) {
		model.addAttribute(service.read(email));
		cService.deleteCardList(cNo);
		
		return "redirect:cardList?email=" + email;
	}
	
	@RequestMapping(value = "/usagePaste")
	public String usagePaste(@RequestParam("email") String email, @RequestParam("cNo") List<Integer> cNo,
			Locale locale, Model model, User user, Card card) {
		
		
		for(Integer i=0; i<=cNo.size(); i++){
			model.addAttribute(service.read(email));
			cService.pasteData(cNo);
			logger.info(cNo.toString());
			i++;
		}
		
		return "redirect:cardList?email=" + email;
	}
}
