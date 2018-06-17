package com.jptomato.tomatoMRReservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jptomato.tomatoMRReservation.mapper.MeetingRoomInfoMapper;
import com.jptomato.tomatoMRReservation.mapper.ReservationMapper;
import com.jptomato.tomatoMRReservation.model.MeetingRoom;
import com.jptomato.tomatoMRReservation.model.Reservation;
import com.jptomato.tomatoMRReservation.model.User;
import com.jptomato.tomatoMRReservation.sec.TomatoUserDetails;

@Controller
public class ReservationController {

	@Autowired
	ReservationMapper reservationMapper;
	@Autowired
	MeetingRoomInfoMapper meetingRoomInfoMapper;

	@RequestMapping(value="/reservation")
	public String reservation(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dtime = sdf.format(new Date());
		System.out.println(dtime);
		List<Reservation> ls = reservationMapper.getList(dtime,0);
		List<MeetingRoom> lsm = meetingRoomInfoMapper.getMRBInfoById(0);
		sdf = new SimpleDateFormat("HH");

		for(int i = 0;i < lsm.size();i++){
			String time = lsm.get(i).getMeetingRoomId().toString();
			for(int y = 0;y < ls.size();y++) {
				if(lsm.get(i).getMeetingRoomId().equals(ls.get(y).getMeetingRoom().getMeetingRoomId())) {
					time += "|" + sdf.format(ls.get(y).getStartTime()) +"," +sdf.format(ls.get(y).getEndTime());
				}
			}
			System.out.println(time);
			model.addAttribute("m"+(i+1),time);
		}
		model.addAttribute("date",dtime);
		model.addAttribute("mrlist",lsm);
		model.addAttribute("mr",lsm);
		model.addAttribute("display","display_none");
		return "reservation";
	}

	@RequestMapping(value="/reservation_select")
	public String reservation_select(String date,String meetingId,Model model) {
		System.out.println(date+"***********************************");
		List<Reservation> ls = reservationMapper.getList(date,Integer.valueOf(meetingId));
		List<MeetingRoom> lsm = meetingRoomInfoMapper.getMRBInfoById(Integer.valueOf(meetingId));
		List<MeetingRoom> lsml = meetingRoomInfoMapper.getMRBInfoById(0);
		SimpleDateFormat sdf = new SimpleDateFormat("HH");

		for(int i = 0;i < lsm.size();i++){
			String time = lsm.get(i).getMeetingRoomId().toString();
			for(int y = 0;y < ls.size();y++) {
				if(lsm.get(i).getMeetingRoomId().equals(ls.get(y).getMeetingRoom().getMeetingRoomId())) {
					time += "|" + sdf.format(ls.get(y).getStartTime()) +"," +sdf.format(ls.get(y).getEndTime());
				}
			}
			System.out.println(time);
			model.addAttribute("m"+(i+1),time);
		}
		model.addAttribute("mrlist",lsml);
		model.addAttribute("mr",lsm);
		model.addAttribute("display","display_block");
		model.addAttribute("date",date);
		model.addAttribute("meetingId",meetingId);
		return "reservation";
	}
	@RequestMapping(value="/reservation_add")
	public String reservation_add(Reservation re,String startT,String endT,Model model,HttpServletRequest request) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		re.setStartTime(sdf.parse(startT));
		re.setEndTime(sdf.parse(endT));
		//SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		//re.getUser().setUserId(Integer.valueOf(((TomatoUserDetails)securityContextImpl.getAuthentication().getPrincipal()).getUserId()));
		TomatoUserDetails userDetails = (TomatoUserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		re.setUser(new User());
		re.getUser().setUserId(Integer.valueOf(userDetails.getUserId()));
		reservationMapper.add(re);
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(re.getStartTime());
		return reservation_select(date,re.getMeetingRoom().getMeetingRoomId().toString(),model);
	}
}
