package com.jptomato.tomatoMRReservation.model;

import java.util.Date;

public class Reservation {
	private Integer reservationId;
	private String reservationTitle;
	private Date startTime;
	private Date endTime;
	private String reservationNote;
	private boolean isEnable;
	private User user;
	private MeetingRoom meetingRoomId;
	public MeetingRoom getMeetingRoomId() {
		return meetingRoomId;
	}
	public void setMeetingRoomId(MeetingRoom meetingRoomId) {
		this.meetingRoomId = meetingRoomId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getReservationId() {
		return reservationId;
	}
	public void setReservationId(Integer reservationId) {
		reservationId = reservationId;
	}
	public String getReservationTitle() {
		return reservationTitle;
	}
	public void setReservationTitle(String reservationTitle) {
		reservationTitle = reservationTitle;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getReservationNote() {
		return reservationNote;
	}
	public void setReservationNote(String reservationNote) {
		reservationNote = reservationNote;
	}
	public boolean isEnable() {
		return isEnable;
	}
	public void setEnable(boolean isEnable) {
		this.isEnable = isEnable;
	}

}
