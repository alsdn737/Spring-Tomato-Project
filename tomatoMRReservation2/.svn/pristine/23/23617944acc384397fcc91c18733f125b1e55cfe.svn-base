package com.jptomato.tomatoMRReservation.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jptomato.tomatoMRReservation.mapper.UserInfoMapper;
import com.jptomato.tomatoMRReservation.model.Department;
import com.jptomato.tomatoMRReservation.model.Role;
import com.jptomato.tomatoMRReservation.model.User;
import com.jptomato.tomatoMRReservation.service.UserInfoService;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoMapper userinfomapper;

	@Autowired
	private UserInfoService userinfoservice;

	@Autowired
	private UserInfoMapper userInfoMapper;

	@RequestMapping(value = "/list")
	public String list(Locale locale, Model model) {

		List<User> userlist = userinfomapper.getList();
		System.out.println(userlist);
		model.addAttribute("userlist", userlist);
		List<Role> rolelist = userinfomapper.getRole();
		List<Department> departmentlist = userinfomapper.getDepartment();
		model.addAttribute("rolelist", rolelist);
		model.addAttribute("departmentlist", departmentlist);
		return "list";
	}

	@RequestMapping(value = "/userinfonew", method = RequestMethod.GET)
	public String newget(Locale Locale, Model model) {

		return "userinfonew";
	}

	@RequestMapping(value = "/userinfonew", method = RequestMethod.POST)
	public String newpost(@ModelAttribute User user, Locale Locale, Model model, BindingResult error) {
		userinfoservice.insert(user);

		return "redirect:/list";
	}

	@RequestMapping(value = "/userinfoupdate", method = RequestMethod.GET)
	public String updateget(Locale Locale, Model model) {

		return "userinfoupdate";
	}

	@RequestMapping(value = "/userinfoupdate", method = RequestMethod.POST)
	public String updatepost(@ModelAttribute User user,int u_userId, String u_userName, String u_userPhone) throws IOException {

		user.setUserId(u_userId);
		user.setUserName(u_userName);
		user.setUserPhone(u_userPhone);
		userinfoservice.update(user);

		return "redirect:/list";

	}

	@RequestMapping(value="/userinfodelete", method = RequestMethod.GET)
	public String userdeleteGET(Locale Locale, Model model) {

		return "userinfodelete";
	}

	@RequestMapping(value = "/userinfodelete", method = RequestMethod.POST)
	public String userdeletePOST(User user, @RequestParam(value="isEnable") boolean isEnable,Locale Locale, Model model, BindingResult error) {

		userInfoMapper.delete(user.getUserId(), !isEnable);
		return "redirect:/list";
	}
}
