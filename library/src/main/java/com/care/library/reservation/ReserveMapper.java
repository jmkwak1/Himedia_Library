package com.care.library.reservation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReserveMapper {
	
	int reservation(ReserveDTO resevedData);
	
	int usingUser(String userId);
	
	ArrayList<ReserveDTO> getReservedSeat(String room);
	
	int reservedNum(String room);
	
	ReserveDTO getSeatById(String id);
	
	int DeleteSeatById(String id);
	
	int roomInit();
	
	int roomStatusChange(String id, String status);
	
	int roomStatusClose(String id, String status);
	
	int closeRoomStatus();
	
	ArrayList<ReserveDTO> getAllSeat();
}