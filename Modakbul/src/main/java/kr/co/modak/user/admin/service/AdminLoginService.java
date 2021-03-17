package kr.co.modak.user.admin.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.modak.user.seller.DAO.SellerUserDAO;
import kr.co.modak.user.seller.VO.MoUserSellerVO;
import kr.co.modak.user.seller.VO.UserDetailsVO;

@Service
public class AdminLoginService implements UserDetailsService {

	@Inject
	private SellerUserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String inputUserId) throws UsernameNotFoundException {
		System.out.println(inputUserId);
		// ���������� �����ؾ��� ��ü
		UserDetailsVO userDetails = new UserDetailsVO();
		System.out.println("userDetail ===> " + userDetails);
		// ����� ���� select
		MoUserSellerVO sellerInfo = dao.sellerLogin(inputUserId);
		// ����� ���� ������ null ó��
		if (sellerInfo == null) {
			return null;

//		// ����� ���� ���� ��� ���� ���� (userDetails�� ������ �ֱ�)
		} else {
			userDetails.setUsername(sellerInfo.getSELLER_ID());
			userDetails.setPassword(sellerInfo.getSELLER_PW());
//			userDetails.setUsername("Sfirst");
//			userDetails.setPassword("1234");
			List<String> auth = new ArrayList<String>();
			auth.add("ROLE_SELLER");
			// ����� ���� select�ؼ� �޾ƿ� List<String> ��ü ����
			userDetails.setAuthorities(auth);
		}

		return userDetails;
	}
}
