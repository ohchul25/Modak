package kr.co.modak.user.seller.VO;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Seller implements UserDetails {

	private MoUserSellerVO moUserSellerVO;
	
	public Seller(MoUserSellerVO moUserSellerVO) {
		this.moUserSellerVO = moUserSellerVO;
	}
	
	public MoUserSellerVO getMemberVO() {
		return moUserSellerVO;
	}
	
	@Override
	public Collection getAuthorities() {
		List authorities = new ArrayList();
		authorities.add(new SimpleGrantedAuthority("ROLE_SELLER"));
		return authorities;
	}

	@Override
	public String getPassword() {
		return moUserSellerVO.getSELLER_PW();
	}

	@Override
	public String getUsername() {
		return moUserSellerVO.getSELLER_ID();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	
	
}
