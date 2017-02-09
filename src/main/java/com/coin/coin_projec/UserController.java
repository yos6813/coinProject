package com.coin.coin_projec;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.persistence.User;
import org.zerock.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// ȸ������ ��
    @RequestMapping(value="/register", method=RequestMethod.GET)
    public String register() {
    	logger.info("get++++++++++++++++++++++++++++");
        return "register";
    }

    // ȸ������

    @RequestMapping(value="/signUp", method=RequestMethod.POST)
    public String createUser(User user, RedirectAttributes rttr) {
    	logger.info("post+++++++++++++++++++++++++++");
    	logger.info(user.toString());
    	
    	service.create(user);
    	rttr.addFlashAttribute("msg", "SUCCESS");
        
        return "redirect:/";
    }
}
