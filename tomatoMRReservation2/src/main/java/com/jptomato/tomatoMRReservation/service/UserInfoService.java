package com.jptomato.tomatoMRReservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jptomato.tomatoMRReservation.mapper.UserInfoMapper;
import com.jptomato.tomatoMRReservation.model.User;

@Service
public class UserInfoService {

	@Autowired
	UserInfoMapper userinfomapper;

	@Autowired
	private BCryptPasswordEncoder encoder;//暗号化

	public void insert(User user) {

		String passwordText = user.getUserPassWord();

		String passwordEncoded = encoder.encode(passwordText);

		user.setUserPassWord(passwordEncoded);
		userinfomapper.insert(user);


	}

	public void update(User user) {
		System.out.println(user.getUserPassWord());

		String passwordText = user.getUserPassWord();

		String passwordEncoded = encoder.encode(passwordText);
		System.out.println(passwordEncoded);
		user.setUserPassWord(passwordEncoded);
		System.out.println(user.getUserPassWord());

		userinfomapper.update(user);
	}

	public void delete(Integer userId, boolean getisEnable) {



		if(getisEnable) {
			System.out.println("trueの場合");

			getisEnable = false;
			System.out.println(getisEnable+"に変更");
			userinfomapper.delete(userId, getisEnable);
		}else {
			System.out.println("falseの場合");
			getisEnable = true;
			System.out.println(getisEnable+"に変更");

			userinfomapper.delete(userId, getisEnable);
		}
	}



}
