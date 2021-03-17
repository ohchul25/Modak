package kr.co.modak.user.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.modak.user.member.sevice.MemberUserService;

@Controller
public class MemberUserLogoutController {

	@Inject
	MemberUserService service;
	
	 @RequestMapping(value = "/memberlogout.mo", method = RequestMethod.GET)
	    public String logout(HttpSession session) {
	        session.removeAttribute("m");
	        return "/user/member/memberUserLoginForm";
	    }
	 


}
