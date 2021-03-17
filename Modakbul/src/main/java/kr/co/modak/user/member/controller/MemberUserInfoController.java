package kr.co.modak.user.member.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.modak.user.member.VO.MoUserMemberVO;
import kr.co.modak.user.member.sevice.MemberUserService;

@Controller
public class MemberUserInfoController {


	@Inject
	MemberUserService service;

	@RequestMapping(value = "/member/memberinfo.mo")

	public String memberView(MoUserMemberVO vo, Model model, HttpSession session, Principal pr) {

		// 회원 정보를 model에 저장
		String MEMBER_NUM = (String) session.getAttribute("memberNUM");
		System.out.println(MEMBER_NUM);
		List<MoUserMemberVO> list = service.list(MEMBER_NUM);
		model.addAttribute("list", list);

		// memberUserJoinForm.jsp로 포워드
		return "/user/member/memberUserInfoForm";
	}
	// 04. 회원 정보 수정 처리

	@RequestMapping(value = "/member/memberupdate.mo")

	public String memberUpdate(MoUserMemberVO vo, Model model, HttpSession session, HttpServletRequest request, Principal pr) {

		String member_pw = request.getParameter("MEMBER_PW");
		System.out.println(member_pw);
		
		// 비밀번호 체크
		String MEMBER_NUM = (String) session.getAttribute("memberNUM");
		boolean result = service.checkPw(MEMBER_NUM, vo.getMEMBER_PW());
		vo.setMEMBER_NUM(MEMBER_NUM);
		
		System.out.println(vo.getMEMBER_PW());
		System.out.println(result);
		if (result) { // 비밀번호가 일치하면 수정 처리후, 전체 회원 목록으로 리다이렉트
			service.updateMember(vo);
			return "redirect:/";
//			return "/user/member/main";
		} else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
			// 가입일자, 수정일자 저장
//			String MEMBER_ID = (String) session.getAttribute("loginId");
			List<MoUserMemberVO> list = service.list(MEMBER_NUM);
			model.addAttribute("list", list);
			model.addAttribute("message", "비밀번호 불일치");
			return "/user/member/memberUserInfoForm";
		}
	}

	// 05. 회원정보 탈퇴 처리(MEMBER_NUM, MEMBER_ID 빼고 update됨)
	// @RequestMapping : url mapping
	// @RequestParam : get or post방식으로 전달된 변수값
	@RequestMapping(value = "/member/memberpasswordcheck.mo", method=RequestMethod.POST)
	public String passwordCheck() {

		return "/user/member/memberPasswordCheckUser";
	}
	
	@RequestMapping(value = "/member/memberquitnotice.mo", method= RequestMethod.POST)
	public String memberNotice(MoUserMemberVO vo, Model model, HttpSession session, HttpServletRequest req) {
		
		String MEMBER_NUM = (String) session.getAttribute("memberNUM");
		// 비밀번호 체크
		boolean result = service.checkPw(MEMBER_NUM, vo.getMEMBER_PW());
		if (result) { 
			return "/user/member/memberQuitNotice";
		} else { 
//			String MEMBER_NUM = pr.getName();
//			List<MoUserMemberVO> list = service.list(MEMBER_NUM);
//			model.addAttribute("list", list);
//			model.addAttribute("message", "비밀번호 불일치");
			return "/user/member/memberPasswordCheckUser";
		}
	}
	
	
	@RequestMapping(value = "/member/memberdelete.mo", method = RequestMethod.POST)
	public String memberDelete(Model model, HttpSession session, HttpServletRequest request, Principal pr) {

		// 비밀번호 체크
//		String member_pw = request.getParameter("MEMBER_PW");
		
		// 비밀번호 체크
//		boolean result = service.checkPw(vo.getMEMBER_ID(), vo.getMEMBER_PW());
		
//		if (result) { // 비밀번호가 일치하면 수정 처리후, 전체 회원 목록으로 리다이렉트
		String MEMBER_NUM = (String) session.getAttribute("memberNUM");
			service.deleteMember(MEMBER_NUM);
//			return "redirect:/";
//			return "/user/member/main";
//		} else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
			// 가입일자, 수정일자 저장
			String MEMBER_ID = (String) session.getAttribute("memberID");
			List<MoUserMemberVO> list = service.list(MEMBER_NUM);
			model.addAttribute("list", list);
//			model.addAttribute("message", "비밀번호 불일치");
//			return "/user/member/memberPasswordCheckUser";
			
			return "redirect:/member/logouts.mo";
		}
	}

