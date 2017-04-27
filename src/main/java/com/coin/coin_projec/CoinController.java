package com.coin.coin_projec;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.persistence.Coin;
import org.zerock.persistence.User;
import org.zerock.service.CoinService;
import org.zerock.service.UserService;

@Controller
public class CoinController {
	@Inject
	private UserService service;
	
	@Inject
	private CoinService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(CoinController.class);
	
	@RequestMapping(value = "/coinmall")
	public String coinmall(@RequestParam("email") String email, Locale locale, Model model, User user, Coin coin) {
		model.addAttribute(service.read(email));
		
		if(cService.productList(coin) != null){
			model.addAttribute("list1", cService.productList(coin));
		}
		
		return "/coin/coinMall";
	}
	
	@RequestMapping(value = "/product")
	public String product(@RequestParam("email") String email, Locale locale, Model model, User user) {
		model.addAttribute("list", service.read(email));
		
		return "/coin/product";
	}
	
	@RequestMapping(value = "/productInsert", method=RequestMethod.POST)
	public String productInsert(@RequestParam("email") String email, Locale locale, Model model, User user, Coin coin) {
		model.addAttribute("list", service.read(email));
		cService.productInsert(coin);
		
		return "redirect:/coinmall?email=" + email;
	}
	
	@RequestMapping(value = "/productModal")
	public String productModal(@RequestParam("email") String email, @RequestParam("id") int id,
							   Locale locale, Model model, User user, Coin coin) {
		model.addAttribute(service.read(email));
		model.addAttribute(cService.productSelect(id));
		
		return "/include/coinModal";
	}
	
	@RequestMapping(value = "/shop", method=RequestMethod.POST)
	public String shop(@RequestParam("email") String email, Locale locale, Model model, User user, Coin coin) {
		model.addAttribute("list", service.read(email));
		cService.shoppingList(coin);
		service.update(user);
		
		return "redirect:/coinmall?email=" + email;
	}
	
	@RequestMapping(value = "/coinTrade")
	public String coinTrade(@RequestParam("email") String email, Locale locale, Model model, User user, Coin coin) {
		model.addAttribute(service.read(email));
		model.addAttribute("list", service.userListAll(user));
		
		return "/coin/coinTrade";
	}
	
	@RequestMapping(value = "/tradeCoin")
	@ResponseBody
	public String tradeCoin(@RequestParam("email") String email, @RequestParam("useText2") List<String> useText2,
							Locale locale, Model model, User user, Coin coin) {
		model.addAttribute("list", service.read(email));
		
		for(int i=0; i<useText2.size(); i++){
			coin.setUseText(useText2.get(i));
			cService.shoppingList(coin);
		}
		
		service.updateCoin2(user);
		service.updateCoin(user);
		
		return "redirect:/coinTrade?email=" + email;
	}
	
	@RequestMapping(value = "/coinUpdate")
	@ResponseBody
	public String coinUpdate(@RequestParam("email") String email, @RequestParam("useText2") List<String> useText2,
							Locale locale, Model model, User user, Coin coin) {
		model.addAttribute("list", service.read(email));
		for(int i=0; i<useText2.size(); i++){
			user.setUseText(useText2.get(i));
			service.updateCoin(user);
			coin.setEmail(useText2.get(i));
			cService.shoppingList(coin);
		}
		
		return "redirect:/coinTrade?email=" + email;
	}
	
	@RequestMapping(value = "/myCoin")
	public String myCoin(@RequestParam("email") String email, Locale locale, Model model, User user, Coin coin) {
		model.addAttribute(service.read(email));
		model.addAttribute(cService.useCoinSum(email));
		if(cService.useCoinList(email) != null){
			model.addAttribute("list", cService.useCoinList(email));
		}
		
		return "/coin/myCoinList";
	}
}
