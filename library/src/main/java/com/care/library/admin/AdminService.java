package com.care.library.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.library.common.NotifyDTO;
import com.care.library.common.NotifyService;
import com.care.library.common.PageService;
import com.care.library.member.MemberDTO;
import com.care.library.search.BookDTO;
import com.care.library.search.BookLoanDTO;
import com.care.library.user.InquiryDTO;

@Service
public class AdminService {
	@Autowired AdminMapper mapper;
	@Autowired NotifyService notiService;
	
	//회원관리 관련

	// 회원 인증
	public String memberConfirm(String id, String userGroup, String paper, String authDate, String reject) {
		String result = "";
		if (reject.equals("")) {
			mapper.memberConfirm(id, userGroup, paper, authDate);
			result ="정회원이 되셨습니다.";
			NotifyDTO notification = new NotifyDTO();
			notification.setId(id);
			notification.setCategory("회원");
			notification.setTitle(result);
			notification.setUrl("/myLibrary/myInfo");
			notiService.register(notification);
		} else {
			mapper.memberReject(id, reject);
			result ="인증 신청이 반려되었습니다.";
			NotifyDTO notification = new NotifyDTO();
			notification.setId(id);
			notification.setCategory("회원");
			notification.setTitle(result);
			notification.setUrl("/myLibrary/myInfo");
			notiService.register(notification);
		}
		return result;
	}

	public MemberDTO statusChk(String id) {
		return mapper.selectUser(id);
	}
	
	// 회원 목록 - 전체 조회
	public void selectMember(String cp, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<MemberDTO> members = mapper.selectAllMember(begin, end);
		
		String url = "memberList?currentPage=";
		int totalCount = mapper.count();
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("members", members);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}
	public void selectMember(String cp, String memberSelect, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<MemberDTO> members = mapper.selectMember(memberSelect, begin, end);
		
		String url = "member?memberSelect="+memberSelect+"&currentPage=";
		int totalCount = mapper.countUser(memberSelect);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("members", members);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	public void selectUser(String id, Model model) {
		MemberDTO result = mapper.selectUser(id);
		model.addAttribute("member", result);
	}

	public void selectMember(String cp, String searchSelect, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<MemberDTO> members = mapper.searchMember(searchSelect, search, begin, end);
		int totalCount = mapper.countMember(searchSelect, search);
		
		String url = "memberList?searchSelect="+searchSelect+"&search="+search +"&currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("members", members);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	public void selectMember(String cp, String memberSelect, String searchSelect, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<MemberDTO> members = mapper.searchMemberDiv(memberSelect, searchSelect, search, begin, end);
		int totalCount = mapper.countMemberDiv(memberSelect, searchSelect, search);
		
		String url = "memberList?memberSelect="+memberSelect+"&searchSelect="+searchSelect+"&search="+search +"&currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("members", members);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	// 도서관리 - 대출
	public void selectLoan(String cp, String select, String loanStatusSelect, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		if (loanStatusSelect == null) {
			loanStatusSelect = "R";
		}
		
		ArrayList<BookLoanDTO> loans = mapper.searchLoan(loanStatusSelect, begin, end);
		int totalCount = mapper.countLoanStatus(loanStatusSelect);
		
		String url = "loan?select="+select+"&loanStatusSelect="+loanStatusSelect+"&currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("loans", loans);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	// 도서관리 - 전체 목록 조회
	public void selectLoanAll(String cp, String select, String loanStatusSelect, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<BookLoanDTO> loans = mapper.searchLoanAll(begin, end);
		int totalCount = mapper.countLoanAll();
		
		String url = "book?select="+select+"&loanStatusSelect="+loanStatusSelect+"&currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("loans", loans);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	public void selectLoanSearch(String cp, String select, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<BookLoanDTO> loans = new ArrayList<>();
		int totalCount;
		String url;
		
		if(select.equals("id")) {
			totalCount = mapper.countLoanId(search);
			loans = mapper.selectLoanId(search, begin, end);
			url = "book?select=id&search="+search+"&currentPage=";
		} else {
			totalCount = mapper.countLoanTitle(search);
			loans = mapper.selectLoanTitle(search, begin, end);
			url = "book?select=title&search="+search+"&currentPage=";
		}
		
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

		model.addAttribute("loans", loans);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	
	//대출 등록 - 예약신청 들어온 것 내역 불러오기
	public void loanRegister(String loanId, Model model) {
		BookLoanDTO reserve = mapper.loanRegisterSelect(loanId);
		
		String isbn = reserve.getIsbn();
		BookDTO book = mapper.loanBookDetail(isbn);
		
		model.addAttribute("reserve", reserve);
		model.addAttribute("book", book);
	}
	
	// 대출 등록 - 책 검색
	public void bookSearch(String book, Model model) {
		ArrayList<BookDTO> list = new ArrayList<>();
		if(book == null || book.equals("")) {
			list = mapper.selectAllBook();
		} else {
			list = mapper.selectBookTitle(book);
			if(list.isEmpty()) {
				list = mapper.selectBookIsbn(book);
			}
		}
		model.addAttribute("list", list);
	}
	
	public void loanRegisterProc(String loanId, String isbn, String startDate, String endDate) {
		mapper.loanRegister(loanId, startDate, endDate);
		mapper.updateRestVol(isbn);
		
		BookLoanDTO result = mapper.loanRegisterSelect(loanId);
		String id = result.getUserId();
		NotifyDTO notification = new NotifyDTO();
		notification.setId(id);
		notification.setCategory("도서");
		notification.setTitle("대출이 완료되었습니다.");
		notification.setUrl("/myLibrary/myBookStatus");
		notiService.register(notification);
	}
	

	public void selectLoanContent(String loanId, Model model) {
		BookLoanDTO loan = mapper.loanRegisterSelect(loanId);
		model.addAttribute("loan", loan);
	}
	
	//도서관리 - 반납
	public void bookReturn(String loanId, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String returnDate = sdf.format(new Date());
		
		mapper.bookReturn(loanId, returnDate);

		BookLoanDTO loan = mapper.loanRegisterSelect(loanId);
		String isbn = loan.getIsbn();
		mapper.updateRestVolReturn(isbn);
		
		String id = loan.getUserId();
		NotifyDTO notification = new NotifyDTO();
		notification.setId(id);
		notification.setCategory("도서");
		notification.setTitle("반납이 완료되었습니다.");
		notification.setUrl("/myLibrary/myBookStatus");
		notiService.register(notification);
	}
	
	//1:1문의
	public void selectInquiryTitle(String cp, String select, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<InquiryDTO> inquiries = mapper.selectInquiryTitle(search, begin, end);
		
		String url = "inquiry?select=" + select + "&search=" + search + "&currentPage=";
		int totalCount = mapper.countInquiryTitle(search);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	
	public void selectInquiryWriter(String cp, String select, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<InquiryDTO> inquiries = mapper.selectInquiryWriter(search, begin, end);
		
		String url = "inquiry?select=" + select + "&search=" + search + "&currentPage=";
		int totalCount = mapper.countInquiryWriter(search);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}
	
	public void selectInquiryReply(String cp, String select, String replySelect, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<InquiryDTO> inquiries;
		int totalCount;
		
		if(replySelect.equals("A")) {
			inquiries = mapper.selectInquiry(begin, end);
			totalCount = mapper.countInquiry();
		} else {
			inquiries = mapper.selectInquiryReply(replySelect, begin, end);
			totalCount = mapper.countInquiryReply(replySelect);
		}

		String url = "inquiry?select=reply&replySelect="+replySelect +"&currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public InquiryDTO inquiryContent(int no) {
		return mapper.selectInquiryContent(no);
	}

	public void replyWrite(int no, String content) {
		mapper.replyWrite(no, content);
		String result = "1:1문의 답변이 등록되었습니다.";
		
		InquiryDTO writer = mapper.selectInquiryContent(no);
		String id = writer.getId();
		
		NotifyDTO notification = new NotifyDTO();
		notification.setId(id);
		notification.setCategory("문의");
		notification.setTitle(result);
		notification.setUrl("/myLibrary/myInquiry");
		notiService.register(notification);
	}


}
