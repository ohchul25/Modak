package kr.co.modak.user.member.sevice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.co.modak.user.member.DAO.MemberUserDAO;
import kr.co.modak.user.member.VO.MoUserMemberVO;
import kr.co.modak.user.member.VO.MemberDetailsVO;

@Service
public class MemberLoginService implements UserDetailsService {
	
	@Inject
	private MemberUserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String inputUserId) throws UsernameNotFoundException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(true);
		MemberDetailsVO memberDetails = new MemberDetailsVO();
		session.setAttribute("beforeID", inputUserId);
		
		// 체크체크~!@~!@~!@~!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		if(inputUserId.length() < 7) { // 모닥불
			MoUserMemberVO memberInfo = dao.getUserOne(inputUserId);
			
			if (memberInfo == null) {
				return null;

//	      // 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
			} else {
				memberDetails.setUsername(memberInfo.getMEMBER_NUM());
				memberDetails.setPassword(memberInfo.getMEMBER_PW());
				List<String> auth = new ArrayList<String>();
				auth.add("ROLE_MEMBER");
				memberDetails.setAuthorities(auth);
				session.setAttribute("memberID", memberInfo.getMEMBER_ID());
				session.setAttribute("memberNUM", memberInfo.getMEMBER_NUM());
			}
			
			
		}else if(inputUserId.length() == 8 ) {	// 네이버
				MoUserMemberVO memberInfo = dao.snsUserOne(inputUserId);
				if (memberInfo == null) {
					
					return null;
//		      // 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
				} else {
					memberDetails.setUsername(memberInfo.getMEMBER_ID());
					memberDetails.setPassword(memberInfo.getMEMBER_PW()); // ? 
					List<String> auth = new ArrayList<String>();
					auth.add("ROLE_MEMBER");
					memberDetails.setAuthorities(auth);
					session.removeAttribute("snsvo"); 
					session.setAttribute("memberID", memberInfo.getMEMBER_ID());
					session.setAttribute("memberNUM", memberInfo.getMEMBER_NUM());
			}
		}else if(inputUserId.length() == 10 ) {	// 카카오
			MoUserMemberVO memberInfo = dao.snsUserOne(inputUserId);
			if (memberInfo == null) {
				
				return null;
//	      // 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
			} else {
				memberDetails.setUsername(memberInfo.getMEMBER_ID());
				memberDetails.setPassword(memberInfo.getMEMBER_PW()); // ? 
				List<String> auth = new ArrayList<String>();
				auth.add("ROLE_MEMBER");
				memberDetails.setAuthorities(auth);
				session.removeAttribute("snsvo"); 
				session.setAttribute("memberID", memberInfo.getMEMBER_ID());
				session.setAttribute("memberNUM", memberInfo.getMEMBER_NUM());
		}
			
		}
		
		return memberDetails;
//		inputUserId.split("@"); // ==> 존재를 하면 소셜로그인
//								// ==> null
//		if(inputUserId.split("@")==null) {
//			
//			
//		}else if(inputUserId.split("@")[1].equals("naver.com")) {
//			
//			// db 내에 이메일 값? 아이디 값? inputUserId 같은게 있는지
//			if(inputUserId.equals(db.아디)) {
//				 
//				로그인인증
//			
//			}else {
//				회원가입창으로 리턴
//			}
//			
//		}else if(inputUserId.split("@")[1].equals("google.com")) {
//			
//			// db 내에 이메일 값? 아이디 값? inputUserId 같은게 있는지
//			if(inputUserId.equals(db.아디)) {
//				 
//				로그인인증
//			
//			}else {
//				회원가입창으로 리턴
//			}
//		
		
	}
	
	
}
