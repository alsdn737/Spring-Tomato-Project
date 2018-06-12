package com.jptomato.tomatoMRReservation.model;

public class MeetingRoom {
	private Integer meetingRoomId;
	private String meetingRoomName;
	private short meetingRoomCapacity;
	private String meetingRoomDetailInfo;
	private boolean meetingRoomState;
	public Integer getMeetingRoomId() {
		return meetingRoomId;
	}
	public void setMeetingRoomId(Integer meetingRoomId) {
		this.meetingRoomId = meetingRoomId;
	}
	public String getMeetingRoomName() {
		return meetingRoomName;
	}
	public void setMeetingRoomName(String meetingRoomName) {
		this.meetingRoomName = meetingRoomName;
	}
	public short getMeetingRoomCapacity() {
		return meetingRoomCapacity;
	}
	public void setMeetingRoomCapacity(short meetingRoomCapacity) {
		this.meetingRoomCapacity = meetingRoomCapacity;
	}
	public String getMeetingRoomDetailInfo() {
		return meetingRoomDetailInfo;
	}
	public void setMeetingRoomDetailInfo(String meetingRoomDetailInfo) {
		this.meetingRoomDetailInfo = meetingRoomDetailInfo;
	}


	public boolean isMeetingRoomState() {
		return meetingRoomState;
	}
	public void setMeetingRoomState(boolean meetingRoomState) {
		this.meetingRoomState = meetingRoomState;
	}
	@Override
	public String toString() {
		return "MeetingRoom [meetingRoomId=" + meetingRoomId + ", meetingRoomName=" + meetingRoomName
				+ ", meetingRoomCapacity=" + meetingRoomCapacity + ", meetingRoomDetailInfo=" + meetingRoomDetailInfo
				+ ", meetingRoomState=" + meetingRoomState + "]";
	}


}
