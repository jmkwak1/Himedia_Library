package com.care.library.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.library.reservation.ReserveDTO;
import com.care.library.reservation.ReserveMapper;
import com.care.library.reservation.ReserveService;
import com.care.library.user.InquiryDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired HttpSession session;
	@Autowired AdminService service;
	@Autowired ReserveService reserveService;
	@Autowired ReserveMapper reserveMapper;
	
	@RequestMapping("/admin/member")
	public String admin() {
		String id = (String)session.getAttribute("id");
		String status = (String)session.getAttribute("status");
		if(id == null || id.equals("")||status.equals("M") == false) {
			return "redirect:main";
		}
		return "admin/member";
	}
	
	@RequestMapping("subMenuAdmin")
	public String subMenuAdmin() {
		return "admin/subMenuAdmin";
	}
	
	@RequestMapping("/admin/memberAuth")
	public String adminMember(@RequestParam(value="currentPage", required = false)String cp, @RequestParam(value="memberSelect", required = false)String memberSelect, Model model) {
		if (memberSelect == null) {
			memberSelect = "R";
		}
		service.selectMember(cp, memberSelect, model);
		return "admin/memberAuth";
	}
	
	@RequestMapping("/admin/memberSanction")
	public String memberSanction(@RequestParam(value="currentPage", required = false)String cp, @RequestParam(value="memberSelect", required = false)String memberSelect,  @RequestParam(value="searchSelect", required = false)String searchSelect, @RequestParam(value="search", required = false)String search, Model model) {
		if(memberSelect == null && searchSelect == null && search == null) {
			service.selectMember(cp, model); // 전체 검색
		}
		if(memberSelect == null && searchSelect != null) {
			service.selectMember(cp, searchSelect, search, model);
		}
		if(memberSelect != null && searchSelect != null) {
			service.selectMember(cp, memberSelect, searchSelect, search, model);
		} else if(memberSelect != null && searchSelect == null){
			service.selectMember(cp, memberSelect, model);
		}
		
		return "admin/memberSanction";
	}
	
	@RequestMapping("/admin/memberList")
	public String memberList(@RequestParam(value="currentPage", required = false)String cp, @RequestParam(value="memberSelect", required = false)String memberSelect,  @RequestParam(value="searchSelect", required = false)String searchSelect, @RequestParam(value="search", required = false)String search, Model model) {
		if(memberSelect == null && searchSelect == null && search == null) {
			service.selectMember(cp, model); // 전체 검색
		}
		if(memberSelect == null && searchSelect != null) {
			service.selectMember(cp, searchSelect, search, model);
		}
		if(memberSelect != null && searchSelect != null) {
			service.selectMember(cp, memberSelect, searchSelect, search, model);
		} else if(memberSelect != null && searchSelect == null){
			service.selectMember(cp, memberSelect, model);
		}
		return "admin/memberList";
	}
	
	@RequestMapping("/admin/memberDetail")
	public String memberDetail(String id, Model model) {
		service.selectUser(id, model);
		return "admin/memberDetail";
	}
	
	@RequestMapping("/admin/memberConfirm")
	public String memberConfirm(String id, Model model) {
		service.selectUser(id, model);
		return "admin/memberConfirm";
	}
	
	@PostMapping("/admin/memberConfirmProc")
	public String memberConfirmProc(String id, String userGroup, String paper, String reject) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String authDate = sdf.format(new Date());
		service.memberConfirm(id, userGroup, paper, authDate, reject);
		return "redirect:/admin/member";
	}
	
	// 도서관리
	@RequestMapping("/admin/book")
	public String book() {
		return "admin/book";
	}
	
	// 도서관리 - 대출
	@RequestMapping("/admin/loan")
	public String loan(@RequestParam(value="currentPage", required = false)String cp, @RequestParam(value="select", required = false)String select,  @RequestParam(value="loanStatusSelect", required = false)String loanStatusSelect, @RequestParam(value="search", required = false)String search, Model model) {
		if(select == null && loanStatusSelect == null && search==null) {
			service.selectLoan(cp, select, loanStatusSelect, model);
		} else if(select.equals("status")) {
			if(loanStatusSelect.equals("T")) {
				service.selectLoanAll(cp, select, loanStatusSelect, model);
			} else {
				service.selectLoan(cp, select, loanStatusSelect, model);
			}
		}
		return "admin/loan";
	}
	
	//도서관리 - 대출 등록
	@RequestMapping("/admin/bookLoanRegister")
	public String bookLoanRegister(@RequestParam(value="loanId", required = false)String loanId, Model model) {
		if(loanId != null) {
			service.loanRegister(loanId, model);
		}
		return "admin/bookLoanRegister";
	}
	
	@RequestMapping("/admin/bookSearch")
	public String bookSearch(@RequestParam(value="book", required = false)String book, Model model) {
		service.bookSearch(book, model);
		return "admin/bookSearch";
	}
	
	@PostMapping("/admin/loanRegisterProc")
	public String loanRegisterProc(@RequestParam(value="loanId", required = false)String loanId, String isbn, String userId, String startDate, String endDate) {
		service.loanRegisterProc(loanId, isbn, startDate, endDate);
		return "redirect:/admin/book";
	}
	
	//도서관리 - 대출 상세조회 화면
	@RequestMapping("/admin/bookLoanContent")
	public String bookLoanContent(@RequestParam(value="loanId", required = false)String loanId, Model model) {
		service.selectLoanContent(loanId, model);
		return "admin/bookLoanContent";
	}
	
	//도서관리 - 반납
	@RequestMapping("/admin/bookReturn")
	public String bookReturn(@RequestParam(value="loanId", required = false)String loanId, Model model) {
		service.bookReturn(loanId, model);
		return "redirect:/admin/book";
	}
	
	//프로그램 관리 - 메인
	@RequestMapping("/admin/program")
	public String program(@RequestParam(value="currentPage", required = false)String cp, @RequestParam(value="select", required = false)String select,  @RequestParam(value="loanStatusSelect", required = false)String loanStatusSelect, @RequestParam(value="search", required = false)String search, Model model) {
		return "admin/program";
	}

	//열람실 관리 - 메인
	@RequestMapping("/admin/room")
	public String room(Model model) {
		ArrayList<ReserveDTO> R1Seat = reserveMapper.getReservedSeat("R1");
		ArrayList<ReserveDTO> R2Seat = reserveMapper.getReservedSeat("R2");
		model.addAttribute("room1Seat", R1Seat.size());
		model.addAttribute("room2Seat", R2Seat.size());
		return "admin/room";
	}
	@RequestMapping("/admin/roomOpenClose")
	public String roomOpenClose() {
		return "admin/roomOpenClose";
	}
	
	@RequestMapping("/admin/roomStatus")
	public String roomStatus(Model model,
			@RequestParam(required = false)String roomSelect, 
			@RequestParam(required = false)String searchSelect,
			@RequestParam(required = false)String search) {
		//아무것도 선택 안했을
		reserveService.getAllSeat( model);
		
		return "admin/roomStatus";
	}
	
	
	
	@PostMapping("/admin/roomStatusProc")
	public String roomStatusProc(@RequestParam(required = false)String open,
			@RequestParam(required = false)String closed, Model model, RedirectAttributes ra) {
		String status="";
		String id = (String)session.getAttribute("id");
		if(open != null && open.equals("열람실 오픈")) {
			status = "O";
			//reserveService.roomStatusChange(id, status, model);
			reserveService.roomStatusChange(id, status, ra);
		}
		if(closed != null &&closed.equals("열람실 마감")) {
			status = "C";
			//reserveService.roomStatusChange(id, status, model);
			reserveService.roomStatusChange(id, status, ra);
		}
		return "redirect:/admin/room";
	}

	//결제 관리 - 메인
	@RequestMapping("/admin/pay")
	public String pay() {
		return "admin/pay";
	}
	
	// 1:1문의 - 목록
	@RequestMapping("/admin/inquiry")
	public String inquiryList(@RequestParam(value="currentPage", required = false)String cp, 
			@RequestParam(value="select", required = false)String select, @RequestParam(value="search", required = false)String search, 
			@RequestParam(value="replySelect", required = false) String replySelect, Model model) {
		
		String id = (String)session.getAttribute("id");
		String status = service.statusChk(id).getStatus();
		
		if(id == null || id.equals("") || (status.equals("M")==false)) {
			return "redirect:main";
		}
				
		//초기 화면 및 검색조건에 제목으로 해놓고 검색어 입력 안 하면 전체 조회
		if(select == null){
			replySelect = "N";
			service.selectInquiryReply(cp, select, replySelect, model);
		} else if(select.equals("title")) {
			service.selectInquiryTitle(cp, select, search, model);
		} else if(select.equals("reply")) {
			service.selectInquiryReply(cp, select, replySelect, model);
		} else if(select.equals("writer")) {
			service.selectInquiryWriter(cp, select, search, model);
		}
		return "admin/inquiry";
	}
	
	// 1:1문의 - 내용
	@RequestMapping("/admin/inquiryContent")
	public String inquiryContent(int no, Model model) {
		InquiryDTO inquiry = service.inquiryContent(no);
		model.addAttribute("inquiry", inquiry);
		return "admin/inquiryContent";
	}
	
	//1:1문의 - 답변 작성
	@RequestMapping("/admin/inquiryReplyWrite")
	public String replyWrite(int no, Model model) {
		InquiryDTO inquiry = service.inquiryContent(no);
		model.addAttribute("inquiry", inquiry);
		return "admin/inquiryReplyWrite";
	}
	
	
	@PostMapping("/admin/inquiryReplyWriteProc")
	public String replyWriteProc(int no, String content) {
		service.replyWrite(no, content);
		return "redirect:/admin/inquiry";
	}
}
