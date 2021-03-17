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
		// 최종적으로 리턴해야할 객체
		UserDetailsVO userDetails = new UserDetailsVO();
		System.out.println("userDetail ===> " + userDetails);
		// 사용자 정보 select
		MoUserSellerVO sellerInfo = dao.sellerLogin(inputUserId);
		// 사용자 정보 없으면 null 처리
		if (sellerInfo == null) {
			return null;

//		// 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
		} else {
			userDetails.setUsername(sellerInfo.getSELLER_ID());
			userDetails.setPassword(sellerInfo.getSELLER_PW());
//			userDetails.setUsername("Sfirst");
//			userDetails.setPassword("1234");
			List<String> auth = new ArrayList<String>();
			auth.add("ROLE_SELLER");
			// 사용자 권한 select해서 받아온 List<String> 객체 주입
			userDetails.setAuthorities(auth);
		}

		return userDetails;
	}
}
