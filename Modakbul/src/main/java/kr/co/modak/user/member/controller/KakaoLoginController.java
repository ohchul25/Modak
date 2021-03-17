package kr.co.modak.user.member.controller;
import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.modak.user.member.sevice.KakaoLoginService;

@Controller
public class KakaoLoginController {

   @Inject
       private KakaoLoginService kakaologinservice;

    @RequestMapping(value = "/kakaocall.mo", method = RequestMethod.GET)
    public String home2(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
       
       System.out.println(code);
       String access_Token = kakaologinservice.getAccessToken(code);
       
       HashMap<String, Object> map = kakaologinservice.getUserInfo(access_Token);
       
       model.addAttribute("ID",map.get("id"));
       model.addAttribute("PW","");
       
       return "/user/member/snsLoginInfo";
    }
}