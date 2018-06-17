package com.jptomato.tomatoMRReservation.mapper;

import java.util.List;

import com.jptomato.tomatoMRReservation.model.MeetingRoom;

public interface MeetingRoomInfoMapper {

	public List<MeetingRoom> getMRBInfo();

	public boolean available(Integer roomId,boolean isEnable);

	public List<MeetingRoom> getMRBInfoById(Integer id);
	public void addRoom(MeetingRoom mr);

}
