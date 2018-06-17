package com.jptomato.tomatoMRReservation.sec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jptomato.tomatoMRReservation.mapper.UserMapper;
import com.jptomato.tomatoMRReservation.model.User;

@Service
public class TomatoUserDetailsService implements UserDetailsService {

	private static final Logger log = LoggerFactory.getLogger(TomatoUserDetailsService.class);

	@Autowired
	UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("{}", username);
		try {
			Integer userId = Integer.valueOf(username);
		} catch (Exception e) {
			throw new UsernameNotFoundException("ユーザ名が間違っています。");
		}

		User u = userMapper.getUserByUserId(Integer.valueOf(username));

		log.info("{}", u.getisEnable());
		// ユーザ名がDBに存在しない場合
		if (u == null) {
			throw new UsernameNotFoundException("ユーザ名が間違っています。");
		} else {

			UserDetails userDetails = new TomatoUserDetails(u);
			return userDetails;
		}
	}

}
