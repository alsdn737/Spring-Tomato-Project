package com.jptomato.tomatoMRReservation.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jptomato.tomatoMRReservation.mapper.MeetingRoomInfoMapper;
import com.jptomato.tomatoMRReservation.model.MeetingRoom;

@Controller
public class MeetingRoomInfoController {

	private static final Logger logger = LoggerFactory.getLogger(MeetingRoomInfoController.class);
	List<MeetingRoom> mRoomList = null;
	@Autowired
	private MeetingRoomInfoMapper mriMapper;

	@RequestMapping(value = "/mrList")
	public String mrList(Locale locale, Model model) {

		 mRoomList = mriMapper.getMRBInfo();
		 model.addAttribute("mRoomList", mRoomList);
		return "mrList";
	}


	@RequestMapping(value="available", method = RequestMethod.POST)
	public String available(@RequestParam("meetingRoomId")int meetingRoomId, @RequestParam("meetingRoomState")boolean meetingRoomState) {
//		 System.out.println("meetingRoomId : "+meetingRoomId);
//		 System.out.println("meetingRoomState : "+ meetingRoomState);

		boolean available = false;

		System.out.println("meetingRoomState) : "+ meetingRoomState);

		if(meetingRoomState== true) {

		 available = mriMapper.available(meetingRoomId, false);

		} else if(meetingRoomState== false) {
			available = mriMapper.available(meetingRoomId, true);
		}
//		System.out.println(available);

		return "redirect:/mrList";
	}


}

