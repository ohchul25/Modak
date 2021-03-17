package kr.co.modak.user.member.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.modak.user.member.VO.SnsVO;
import kr.co.modak.user.member.sevice.MemberLoginService;
import kr.co.modak.user.member.sevice.NaverLoginService;

@Controller
public class NaverLoginController {
	
	@Inject
	MemberLoginService login;
	
	@Inject
	NaverLoginService naverLoginService;
	private String apiResult = null;
	
	@RequestMapping(value = "/naverLogin.mo", method = RequestMethod.GET)
	public String mainview(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
		
		return "redirect:"+naverAuthUrl;
	}
	
	@RequestMapping(value = "/naverLoginCall.mo", method = RequestMethod.GET)
	public String mainview2(Model model, HttpSession session, HttpServletRequest request) throws Exception {

		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginService.getAccessToken(session, request.getParameter("code"), request.getParameter("state"));
        System.out.println(oauthToken);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginService.getUserProfile(oauthToken);
	    
	    System.out.println(apiResult);
	    
	    JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		org.json.simple.JSONObject response_obj = (org.json.simple.JSONObject)jsonObj.get("response");
		// 네이버에서 주는 고유 ID
		String naverIfId = (String) response_obj.get("id");
		// 네이버에서 설정된 사용자 이름
		String naverName = (String) response_obj.get("name");
		// 네이버에서 설정된 사용자 별명
		String naverNickname = (String) response_obj.get("nickname");
		// 네이버에서 설정된 이메일
		String naverEmail = (String) response_obj.get("email");
		
		SnsVO snsvo = new SnsVO();
		
		snsvo.setId(naverIfId);
		snsvo.setName(naverName);
		snsvo.setEmail(naverEmail);
		snsvo.setNickname(naverNickname);
		snsvo.setMEMBER_SNS("naver");
		
		session.setAttribute("snsvo", snsvo);
		
	    model.addAttribute("ID",naverIfId);
	    model.addAttribute("PW","");
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "/user/member/snsLoginInfo";
	}

}
