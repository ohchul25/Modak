package kr.co.modak.user.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.modak.user.member.VO.MoUserMemberVO;
import kr.co.modak.user.member.sevice.MemberUserService;



@Controller
public class MemberUserLoginController {

	@Inject
	MemberUserService service;

	@RequestMapping(value = "/memberlogin.mo", method = RequestMethod.GET)
	public String loginView() {

		return "/user/member/memberUserLoginForm";
	}
	
	@RequestMapping(value = "/snsJoinLogin.mo", method = RequestMethod.GET)
	public String loginView2(HttpServletRequest req, Model model) {
		model.addAttribute("ID",req.getParameter("ID"));
		model.addAttribute("PW",req.getParameter("PW"));
		System.out.println("snsJoinLogin~~~~~~~~");
		return "/user/member/snsLoginInfo";
	}

	@RequestMapping(value = "/member/main.mo", method = RequestMethod.GET)
	public String mainview() {

		return "/user/member/main";
	}

	
}

