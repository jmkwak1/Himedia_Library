package com.care.library.user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.library.common.NotifyDTO;
import com.care.library.common.NotifyService;
import com.care.library.common.PageService;
import com.care.library.member.MailService;
import com.care.library.member.MemberMapper;
import com.care.library.search.BookLoanDTO;
import com.care.library.search.SearchMapper;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Service
public class UserService {
	
	@Autowired UserMapper userMapper;
	@Autowired NotifyService notiService;
	@Autowired SearchMapper searchMapper;

	public UserDTO getMyInfo(String id) { 
		return userMapper.getMyInfo(id); 
		}
	

	public String changeMyInfoProc(UserDTO myInfo) {
		int check = userMapper.changeMyInfoProc(myInfo);
		if(check == 1)
			return "정보가 수정되었습니다.";
		return "수정에 실패했습니다.";
	}
	
	public String updatePwProc(String currentPW, String newPW, String newConfirmPW, String id) {
		// 기존 비밀번호랑 currentPW가 맞는지 확인하기
		String dataCurrentPw = userMapper.currentPwCheck(id);
		if(dataCurrentPw != null) {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			if(bpe.matches(currentPW, dataCurrentPw)) {
				// O => newPW랑 newConfirmPW가 같은지 확인
				if(newPW.equals(newConfirmPW)) {
					// O => "비밀번호가 변경되었습니다."
					String cryptPassword = bpe.encode(newPW);
					int result = userMapper.updatePw(cryptPassword, id);
					if(result == 1 )
						return "비밀번호가 변경되었습니다.";
					return "비밀번호 변경에 실패했습니다.";
				}
				// X => "비밀번호를 확인해주세요."
				return "비밀번호를 확인해주세요.";
			}
		}
		// X => "비밀번호 변경에 실패했습니다."
		return "비밀번호 변경에 실패했습니다.";
	}
	
	public String updateAuthProc(String pw, String id) {
		String status = userMapper.getMyInfo(id).getStatus();
		if (status.equals("R") == false) {
			String dataPw = userMapper.currentPwCheck(id);
			if(dataPw != null) {
				BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
				if(bpe.matches(pw, dataPw)) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String authDate = sdf.format(new Date());
					int result = userMapper.updateAuth(id, authDate);
					NotifyDTO notification = new NotifyDTO();
					if(result == 1 ) {
						notification.setId(id);
						notification.setCategory("회원");
						notification.setTitle("인증 신청이 완료되었습니다.");
						notification.setUrl("/myLibrary/myInfo");
						notiService.add(notification);
					return "신청이 완료 되었습니다.";
					}
				}
			}
		}
		return "요청을 실패했습니다.";
	}
	
	public String deleteMember(String id, String pw) {
		if(pw == null || pw.equals("")) {
			return "비밀번호를 입력하세요.";
		}

		UserDTO check = userMapper.getMyInfo(id);
		if(check == null) {
			return "등록되지 않은 회원입니다.";
		}
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		if(bpe.matches(pw, check.getPw())) {
			Random r = new Random();
			String delId = String.format("%06d", r.nextInt(1000000));
			UserDTO delChk = userMapper.getMyInfo(delId);
			if(delChk != null) {
				return "탈퇴 중 오류가 발생하였습니다. 관리자에게 문의하세요.";
			} else {
				int result = userMapper.updateId(id, delId);
				if(result != 1) {
					return "탈퇴 중 오류가 발생하였습니다. 관리자에게 문의하세요.";
				}
			}
		}
		return "회원 탈퇴가 완료되었습니다.";
	}

	public void myInquiryWriteProc(String id, String title, String content2) {
		int no;
		try {
			no = userMapper.findMaxNum();
		} catch (Exception e) {
			no = 0;
		}
		
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String writeDate = sdf.format(new Date());
	
		InquiryDTO inquiry = new InquiryDTO();
		inquiry.setNo(no+1);
		inquiry.setTitle(title);
		inquiry.setContent(content2);
		inquiry.setId(id);
		inquiry.setWriteDate(writeDate);
		userMapper.myInquiryWrite(inquiry);
		
		NotifyDTO notification = new NotifyDTO();
		String admin = userMapper.findAdmin();
		notification.setId(admin);
		notification.setCategory("문의");
		notification.setTitle("1:1문의가 등록되었습니다.");
		notification.setUrl("/admin/inquiry");
		notiService.register(notification);
		
	}


	public void selectInquiry(String cp, String id, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<InquiryDTO> inquiries = userMapper.selectInquiry(id, begin, end);
		
		String url = "myInquiry?currentPage=";
		int totalCount = userMapper.count(id);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

		model.addAttribute("inquiries", inquiries);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	public void selectInquiry(String cp, String search, String id, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<InquiryDTO> inquiries = userMapper.selectInquiryTitle(id, search, begin, end);
		
		String url = "myInquiry?select=title&search="+search+"&currentPage=";
		int totalCount = userMapper.count(id);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}


	public void selectInquiry(String cp, String select, String replySelect, String id, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<InquiryDTO> inquiries = userMapper.selectInquiryReply(id, replySelect, begin, end);
		String url = "myInquiry?select=reply&replySelect=" + replySelect + "&currentPage=";
		int totalCount = userMapper.countReply(id, replySelect);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}


	public InquiryDTO myInquiryContent(String id, String rn) {
		return userMapper.selectMyInquiry(id, rn);
	}


	public void myInquiryUpdateProc(String id, String rn, String title, String content) {
		InquiryDTO inquiry = userMapper.selectMyInquiry(id,rn);
		int no = inquiry.getNo();
		userMapper.updateMyInquiry(id, no, title, content);
	}


	public void myInquiryDelete(String id, String rn) {
		InquiryDTO inquiry = userMapper.selectMyInquiry(id,rn);
		int no = inquiry.getNo();
		userMapper.deleteMyInquiry(no);
	}
	
//	대출/예약/연장 현황(현황이니까 예약중, 대출중, 연체중 인 것 만.)
	public void getMyBookStatus(String id, Model model) {
		ArrayList<BookLoanDTO> myBookStatus = searchMapper.getMyBookStatus(id);
		if(myBookStatus != null)
			model.addAttribute("myBook", myBookStatus);
	}
	
	public void getMyLoanHistory(String id, Model model) {
		ArrayList<BookLoanDTO> myLoanHistory = searchMapper.getMyLoanHistory(id);
		if(myLoanHistory != null)
			model.addAttribute("myLoanHistory", myLoanHistory);
	}
	
	public void extendLoan(String id, String isbn, String newEndDate, Model model) {
		String extMsg = "";
		int result = searchMapper.updateLoanStatus(id, isbn, newEndDate);
		if(result != 1) {
			extMsg = "연장 신청이 이루어지지 않았습니다.";
		}
		extMsg = "연장 신청이 완료되었습니다.";
		model.addAttribute("extMsg",extMsg);
	}
}




