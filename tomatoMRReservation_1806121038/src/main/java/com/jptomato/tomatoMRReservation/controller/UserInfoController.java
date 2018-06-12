package com.jptomato.tomatoMRReservation.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jptomato.tomatoMRReservation.mapper.UserInfoMapper;
import com.jptomato.tomatoMRReservation.model.User;

@Controller

public class UserInfoController {

	@Autowired
	private UserInfoMapper userinfomapper;

	@RequestMapping(value = "/list")
	public String list(Locale locale, Model model) {

		List<User> userlist = userinfomapper.getList();
		model.addAttribute("userlist", userlist);
		return "list";
	}
}
