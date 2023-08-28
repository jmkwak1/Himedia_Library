package com.care.library.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.library.member.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired HttpSession session;
	@Autowired private UserService service;
	
	//마이 라이브러리(첫페이지) - container
	@RequestMapping("/myLibrary")
	public String myLibray() {
		return "user/myLibraryMain";
	}

	@RequestMapping("/myLibraryMain")
	public String myLibrayMain() {
		return "user/myLibraryMain";
	}
	
	@RequestMapping("subMenuMyLibrary")
	public String subMenuMyLibrary() {
		return "user/subMenuMyLibrary";
	}
	
	//대출/예약/연장 현황
	@RequestMapping("myLibrary/myBookStatus")
	public String myBookStatus(Model model, @RequestParam(value="isbn", required = false)String isbn, 
			@RequestParam(value="newEndDate", required = false)String newEndDate) {
		String id = (String)session.getAttribute("id");
		if(isbn != null) {
			service.extendLoan(id, isbn, newEndDate, model);
		}
		service.getMyBookStatus(id,model);
		
		return "user/myBookStatus";
	}
	
	// 대출 이력 조회
	@RequestMapping("myLibrary/myLoanHistory")
	public String myLoanHistory(Model model) {
		String id = (String)session.getAttribute("id");
		service.getMyLoanHistory(id,model);
		
		return "user/myLoanHistory";
	}
	
	
	// 1:1문의 - 목록
	@RequestMapping("/myLibrary/myInquiry")
	public String myInquiryList(@RequestParam(value="currentPage", required = false)String cp, 
			@RequestParam(value="select", required = false)String select, @RequestParam(value="search", required = false)String search, 
			@RequestParam(value="replySelect", required = false) String replySelect, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		if(id == null || id.equals("")) {
			return "redirect:main";
		}
		
		//초기 화면 및 검색조건에 제목으로 해놓고 검색어 입력 안 하면 전체 조회
		if(select == null || (select.equals("title") && (search==null || search == ""))) {
			service.selectInquiry(cp, id, model);
		} else if(select.equals("title") && search != null) {
			service.selectInquiry(cp, search, id, model);
		} else if(select.equals("reply")) {
			if(replySelect.equals("A")) {
				service.selectInquiry(cp, id, model);
			} else {
				service.selectInquiry(cp, select, replySelect, id, model);
			}
		}
		
		return "user/myInquiry";
	}
	
	// 1:1문의 - 글작성
	@GetMapping("/myLibrary/myInquiryWriteForm")
	public String myInquiryWriteForm() {
		String id = (String)session.getAttribute("id");
		if(id == null || id.equals("")) {
			return "redirect:/login";
		}
		return "user/myInquiryWriteForm";
	}
	
	@PostMapping("/myLibrary/myInquiryWriteProc")
	public String myInquiryWriteProc(String title, String content) {
		String id = (String)session.getAttribute("id");
		service.myInquiryWriteProc(id, title, content);
		return "redirect:/myLibrary/myInquiry";
	}
	
	// 1:1문의 - 글내용
	@RequestMapping("/myLibrary/myInquiryContent")
	public String myInquiryContent(String rn, Model model) {
		String id = (String)session.getAttribute("id");
		InquiryDTO inquiry = service.myInquiryContent(id, rn);
		model.addAttribute("inquiry", inquiry);
		return "/user/myInquiryContent";
	}
	
	// 1:1문의 - 수정
	@RequestMapping("/myLibrary/myInquiryUpdate")
	public String myInquiryUpdate(String rn, Model model) {
		String id = (String)session.getAttribute("id");
		InquiryDTO inquiry = service.myInquiryContent(id, rn);
		model.addAttribute("inquiry", inquiry);
		return"/user/myInquiryUpdate";
	}
	
	@PostMapping("/myLibrary/myInquiryUpdateProc")
	public String myInquiryUpdateProc(String rn, String title, String content) {
		String id = (String)session.getAttribute("id");
		service.myInquiryUpdateProc(id, rn, title, content);
		return "redirect:/myLibrary/myInquiry";
	}
	
	//1:1문의 - 삭제
	@RequestMapping("/myLibrary/myInquiryDelete")
	public String myInquiryDelete(String rn) {
		String id = (String)session.getAttribute("id");
		service.myInquiryDelete(id, rn);
		return "redirect:/myLibrary/myInquiry";
	}
	
	// 회원정보 - container
	@GetMapping("/myLibrary/myInfo")
	public String myInfo() {
		String id = (String)session.getAttribute("id");
		return "user/myInfo";
	}
	
	// 회원정보 - 회원정보 수정
	@GetMapping("/myLibrary/updateInfo")
	public String updateInfo(Model model) {
		String id = (String)session.getAttribute("id");
		UserDTO myInfo = service.getMyInfo(id);
		  if(myInfo != null) { 
			  model.addAttribute("email", myInfo.getEmail()); 
			  model.addAttribute("mobile", myInfo.getMobile()); 
			  model.addAttribute("birth", myInfo.getBirth()); 
			  model.addAttribute("address", myInfo.getAddress()); 
			  model.addAttribute("postCode", myInfo.getPostCode()); 
			  model.addAttribute("detailAddress", myInfo.getDetailAddress());
		  }
		return "user/updateInfo";
	}
	
	@PostMapping("/myLibrary/changeMyInfoProc")
	public String changeMyInfoProc(UserDTO myInfo, RedirectAttributes ra) {
		String id = (String)session.getAttribute("id");
		myInfo.setId(id);
		
		String result = service.changeMyInfoProc(myInfo);
		if(result.equals("정보가 수정되었습니다.")) {
			ra.addFlashAttribute("updateMsg", result);
			return "redirect:/main";
		}
		ra.addFlashAttribute("updateMsg", result);
		return "user/myInfo";
	}
	
	// 회원정보 - 비밀번호 수정
	@GetMapping("/myLibrary/updatePW")
	public String updatePW() {
		return "user/updatePW";
	}
	
	@PostMapping("/myLibrary/updatePwProc")
	public String updatePwProc(String currentPW, String newPW, String newConfirmPW) {
		String id = (String)session.getAttribute("id");
		String result = service.updatePwProc(currentPW, newPW, newConfirmPW, id);
		System.out.println("result"+ result);
		if(result.equals("비밀번호가 변경되었습니다."))
			return "redirect:/main";
		return "user/myInfo";
	}
	
	// 회원정보 - 회원인증
	@GetMapping("/myLibrary/updateAuth")
	public String updateAuth(Model model) {
		String id = (String)session.getAttribute("id");
		String status = service.getMyInfo(id).getStatus();
		if(status.equals("R")) {
			model.addAttribute("result", "이미 인증신청을 하셨습니다.");
		} else if(status.equals("A")){
			model.addAttribute("result", "이미 정회원입니다.");
		} else {
			String reject = service.getMyInfo(id).getReject();
			model.addAttribute("reject", reject);
		}
		return "user/updateAuth";
	}
	
	@PostMapping("/myLibrary/updateAuthProc")
	public String updateAuthProc(String pw) {
		String id = (String)session.getAttribute("id");
		String result = service.updateAuthProc(pw, id);
		if(result.equals("신청이 완료 되었습니다.")) {
			return "redirect:/main";
		}
		return "user/myInfo";
	}
	
	// 회원정보 -  회원탈퇴
	@GetMapping("/myLibrary/withdraw")
	public String withdraw() {
		return "user/withdraw";
	}
	
	@PostMapping("/myLibrary/withdrawProc")
	public String withdrawProc(String pw) {
		String id = (String)session.getAttribute("id");
		String result = service.deleteMember(id, pw);
		System.out.println("result"+ result);
		if(result.equals("회원 탈퇴가 완료되었습니다.")) {
			session.invalidate();
			return "redirect:/main";
		}
		return "user/withdraw";
	}
	
}
