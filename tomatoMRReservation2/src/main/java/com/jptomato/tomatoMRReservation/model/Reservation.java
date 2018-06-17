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
	private MeetingRoom meetingRoom;
	public MeetingRoom getMeetingRoom() {
		return meetingRoom;
	}
	public void setMeetingRoom(MeetingRoom meetingRoomId) {
		this.meetingRoom = meetingRoomId;
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
		this.reservationId = reservationId;
	}
	public String getReservationTitle() {
		return reservationTitle;
	}
	public void setReservationTitle(String reservationTitle) {
		this.reservationTitle = reservationTitle;
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
		this.reservationNote = reservationNote;
	}
	public boolean isEnable() {
		return isEnable;
	}
	public void setEnable(boolean isEnable) {
		this.isEnable = isEnable;
	}

}
