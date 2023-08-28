package com.care.library.reservation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.library.common.NotifyDTO;
import com.care.library.common.NotifyService;
import com.care.library.common.PageService;
import com.care.library.member.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class ReserveService {

	@Autowired
	ReserveMapper reserveMapper;
	@Autowired
	HttpSession session;
	@Autowired
	NotifyService notiService;

	public String userCheck(String id) {
		int usingUser = reserveMapper.usingUser(id);
		if (usingUser >= 1)
			return "이미 다른 좌석을 예약하셨습니다.";
		return "예약 가능한 회원입니다.";
	}

	public String reservation(ReserveDTO resevedData) {
		int result = reserveMapper.reservation(resevedData);

		if (result == 1) {
			String msg = resevedData.getSeatId() + "번 좌석이 예약되었습니다.";
			NotifyDTO notification = new NotifyDTO();
			// String msg = resevedData.getRoom()
			notification.setId(resevedData.getUserId());
			notification.setCategory("열람실");
			notification.setTitle(msg);
			if (resevedData.getRoom().equals("R1"))
				notification.setUrl("/reservation/readingRoom1");
			if (resevedData.getRoom().equals("R2"))
				notification.setUrl("/reservation/readingRoom2");
			notiService.register(notification);
			return "예약이 완료되었습니다.";
		}
		return "예약이 정상적으로 이루어지지 않았습니다.";
	}

	public ArrayList<ReserveDTO> getReservedSeat(String whichRoom) {
		ArrayList<ReserveDTO> reservedSeat = reserveMapper.getReservedSeat(whichRoom);
//		for (ReserveDTO seat : reservedSeat) {
//			System.out.println("seat : " + seat.getSeatId());
//			System.out.println("seat : " + seat.getUserId());
//		}
//		System.out.println();
		return reservedSeat;
	}

	public ReserveDTO getMySeat(String id, Model model) {
		ReserveDTO mySeat = reserveMapper.getSeatById(id);
		if (mySeat != null) {
			if ("R1".equals(mySeat.getRoom())) {
				mySeat.setRoom("자율 학습실1");
			} else if ("R2".equals(mySeat.getRoom())) {
				mySeat.setRoom("자율 학습실2");
			}

			model.addAttribute("mySeat", mySeat);
			return mySeat;
		} else {
			return null;
		}
	}

	public String leaveProc(String id) {
		int leaveResult = reserveMapper.DeleteSeatById(id);
		if (leaveResult == 1) {
			NotifyDTO notification = new NotifyDTO();
			// String msg = resevedData.getRoom()
			notification.setId(id);
			notification.setCategory("열람실");
			notification.setTitle("퇴실이 완료 되었습니다.");
			notification.setUrl("/reservation/readingRoom1");
			notiService.register(notification);
			return "퇴실이 완료 되었습니다.";
		}
		return "퇴실이 제대로 이루어지지 않았습니다.";
	}

	public void roomStatusChange(String id, String status, RedirectAttributes ra) {
		int initResult = reserveMapper.roomInit();
		String roomMsg = "";
		if (status.equals("O")) {
			int result = reserveMapper.roomStatusChange(id, status);
			if (result == 1) {
				roomMsg = "열람실 예약이 오픈되었습니다.";
			}
		} else {
			int result = reserveMapper.roomStatusChange(id, status);
			if (result == 1) {
				roomMsg = "열람실 예약이 마감되었습니다.";
			}
		}
		//model.addAttribute("roomMsg", roomMsg); // 수정된 부분
		ra.addFlashAttribute("roomMsg", roomMsg); // 수정된 부분
	}

	public void getAllSeat(Model model) {

		ArrayList<ReserveDTO> allSeat = reserveMapper.getAllSeat();
		model.addAttribute("allseat", allSeat);
		return;
	}

}