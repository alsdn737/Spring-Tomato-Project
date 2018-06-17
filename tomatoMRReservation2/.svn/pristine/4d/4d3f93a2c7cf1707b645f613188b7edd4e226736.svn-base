package com.jptomato.tomatoMRReservation.sec;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.jptomato.tomatoMRReservation.model.User;

public class TomatoUserDetails implements UserDetails {

	private User u;
	private Collection<GrantedAuthority> grantedAuthorities;
	TomatoUserDetails(User u){
		this.u = u;
		grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority(u.getRole().getRoleName()));
	}
	public User getUser() {
		return u;
	}

	public void setUser(User u) {
		this.u = u;
	}



	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO 自動生成されたメソッド・スタブ
		return grantedAuthorities;
	}

	@Override
	public String getPassword() {
		// TODO 自動生成されたメソッド・スタブ
		return u.getUserPassWord();
	}

	@Override
	public String getUsername() {
		// TODO 自動生成されたメソッド・スタブ
		return u.getUserName();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO 自動生成されたメソッド・スタブ
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO 自動生成されたメソッド・スタブ
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO 自動生成されたメソッド・スタブ
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO 自動生成されたメソッド・スタブ
		return true;
	}
	public String getUserId() {
		return u.getUserId().toString();
	}

}
