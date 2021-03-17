package kr.co.modak.user.seller.VO;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserDetailsVO implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String username; // ID
	private String password; // PW
	
	private String SELLER_ID; // ID
	private String SELLER_NUM; // PW
	private String SELLER_DELETE;
	
	private List<GrantedAuthority> authorities;

	public String getSELLER_ID() {
		return SELLER_ID;
	}

	public void setSELLER_ID(String sELLER_ID) {
		SELLER_ID = sELLER_ID;
	}

	public String getSELLER_NUM() {
		return SELLER_NUM;
	}

	public void setSELLER_NUM(String sELLER_NUM) {
		SELLER_NUM = sELLER_NUM;
	}

	public String getSELLER_DELETE() {
		return SELLER_DELETE;
	}

	public void setSELLER_DELETE(String sELLER_DELETE) {
		SELLER_DELETE = sELLER_DELETE;
	}

	// setter
	public void setUsername(String username) {
		this.username = username;
	}

	// setter
	public void setPassword(String password) {
		this.password = password;
	}

	// setter
	public void setAuthorities(List<String> authList) {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (int i = 0; i < authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authList.get(i)));
		}

		this.authorities = authorities;
	}

	@Override
	// ID
	public String getUsername() {

		return username;
	}

	@Override
	// PW
	public String getPassword() {

		return password;
	}

	@Override
	// 권한
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return authorities;
	}

	@Override
	// 계정이 만료 되지 않았는가?
	public boolean isAccountNonExpired() {

		return true;
	}

	@Override
	// 계정이 잠기지 않았는가?
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	// 패스워드가 만료되지 않았는가?
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@Override
	// 계정이 활성화 되었는가?
	public boolean isEnabled() {

		return true;
	}
}
