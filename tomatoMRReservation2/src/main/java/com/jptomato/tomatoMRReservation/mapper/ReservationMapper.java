package com.jptomato.tomatoMRReservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jptomato.tomatoMRReservation.model.Reservation;

public interface ReservationMapper {
	public List<Reservation> getList(@Param("time")String time,@Param("meetingId")Integer meetingId);
	public void add(Reservation re);

}
