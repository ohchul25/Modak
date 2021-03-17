package kr.co.modak.user.seller.service;

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

import kr.co.modak.user.seller.DAO.SellerUserDAO;
import kr.co.modak.user.seller.VO.MoUserSellerVO;
import kr.co.modak.user.seller.VO.UserDetailsVO;

@Service
public class SellerLoginService implements UserDetailsService {

	@Inject
	private SellerUserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String inputUserId) throws UsernameNotFoundException {
		HttpServletRequest request =
				 ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			    HttpSession session = request.getSession(true);
		
		// ���������� �����ؾ��� ��ü
		UserDetailsVO userDetails = new UserDetailsVO();
		// ����� ���� select
		System.out.println("아이디값은?!?!?!? : " + inputUserId);
		MoUserSellerVO sellerInfo = dao.sellerLogin(inputUserId);
		// ����� ���� ������ null ó��
		if (sellerInfo == null) {
			return null;

		// ����� ���� ���� ��� ���� ���� (userDetails�� ������ �ֱ�)
		} else {
			if(sellerInfo.getSELLER_DELETE() == 2) {
				
			}else {
			userDetails.setUsername(sellerInfo.getSELLER_NUM());
			userDetails.setPassword(sellerInfo.getSELLER_PW());
			userDetails.setSELLER_ID(sellerInfo.getSELLER_ID());
			List<String> auth = new ArrayList<String>();
			auth.add("ROLE_SELLER");
			session.setAttribute("sellerID", sellerInfo.getSELLER_ID());
			// ����� ���� select�ؼ� �޾ƿ� List<String> ��ü ����
			userDetails.setAuthorities(auth);
			}
		}

		return userDetails;
	}
}
