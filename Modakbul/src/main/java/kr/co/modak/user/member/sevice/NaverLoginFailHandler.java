package kr.co.modak.user.member.sevice;

import java.io.IOException;

import javax.security.auth.login.AccountExpiredException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
/* 로그인 실패 대응 로직 */
public class NaverLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		
		
		if (exception instanceof AuthenticationServiceException) {
			HttpSession session = request.getSession();
			String a = (String) session.getAttribute("beforeID");
			request.setAttribute("beforeID", a);
		
		} else if(exception instanceof BadCredentialsException) {
			request.setAttribute("beforeID", "hi2");
		}
		
		// 로그인 페이지로 다시 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/modak/member/memberjoinform.mo");
		dispatcher.forward(request, response);
	}
}