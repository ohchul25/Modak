package kr.co.modak.user.seller.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.modak.user.seller.VO.MoUserSellerVO;
import kr.co.modak.user.seller.service.SellerUserService;


@Controller
public class LoginController {
	
	@Inject
	SellerUserService service;

	//member Login 폼 페이지 이동
	@RequestMapping(value="memberLogin.mo", method=RequestMethod.GET)
	public String memberLoginChange(Model model){
		return "/user/seller/memberLoginForm";
	}
	
	//seller Login 폼 페이지 이동
	@RequestMapping(value="/seller/sellerLogin.mo", method=RequestMethod.GET)
	public String sellerLoginForm(Model model){
		return "/user/seller/sellerLoginForm";
	}


}
