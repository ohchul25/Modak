package kr.co.modak.user.member.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.modak.user.member.VO.MoUserMemberVO;
import kr.co.modak.user.member.sevice.MemberUserService;

@Controller
public class MemberUserJoinController {

	@Inject
	MemberUserService service;
	
	@RequestMapping(value = "/member/memberjoinform.mo", method = RequestMethod.GET)
	public String JoinView() {
		return "/user/member/memberUserJoinForm";
	}	
	
	@RequestMapping(value = "/member/memberjoinform.mo", method = RequestMethod.POST)
	public String JoinView2(Model model, HttpServletRequest req) {
		String bid = (String) req.getAttribute("beforeID");
		model.addAttribute("beforeID", bid);
		return "/user/member/snsUserJoinForm";
	}	
	
	@ResponseBody
	@RequestMapping(value="/member/idChk.mo", method = RequestMethod.POST)
	public int idChk(MoUserMemberVO vo) throws Exception {
		int result = service.idCheck(vo);
		return result;
	}

	@RequestMapping(value="/member/memberjoin.mo",method = RequestMethod.POST)
	@ResponseBody
	public int signUp(MoUserMemberVO vo,  Principal pr) {
		int result = 0; 
		String col = null;

		col = "MEMBER_ID";
		MoUserMemberVO userIdCheck = service.getUserOne(vo.getMEMBER_ID());
		if(userIdCheck != null) {
			result = 2; 
		}

//		col = "MEMBER_NAME";
//		MoUserMemberVO userNicknameCheck = service.getUserOne(vo.getMEMBER_NAME(),col);
//		if(userNicknameCheck != null) { result = 3; }	

		if(result < 2) {
			result = service.userJoin(vo);	
		}

		return result;
	}
}

