package com.care.library.search;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.library.reservation.ReserveDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class SearchController {

	@Autowired
	SearchService service;
	@Autowired
	SearchMapper mapper;
	@Autowired
	HttpSession session;

	@RequestMapping("/datasearch")
	public String datasearch(Model model) {
		// 공공 API를 사용하여 xml형태의 데이터 받아오기. 매월 1일에 받아오기.

		// 인기도서 대출
//		api 주소 자체 에러가 너무 많이남..model.
//		String popParam = "&libCode=111042";
//		String popUrl = service.reqUrlParam("extends/loanItemSrchByLib", popParam);
//		String popTable = "popularBook";
//		String popXmlTagName = "loanBooks";
		String popParam = "&dtl_region=11120"; //은평구
		String popUrl = service.reqUrlParam("loanItemSrch", popParam, 1, 20);
		String popTable = "popularBook";
		String popXmlTagName = "docs"; 
		String paintPop = service.showMainImages(popTable, model, popUrl, popXmlTagName);
		System.out.println("paintPop : " + paintPop);

		// 신착도서 대출
		String recentParam = "&libCode=111042";
		String recentUrl = service.reqUrlParam("extends/libSrch", recentParam, 1, 10);
		System.out.println("recentUrl" + recentUrl);
		String recentTable = "recentBook";
		String recentXmlTagName = "newBooks";
		String paintRecent = service.showMainImages(recentTable, model, recentUrl, recentXmlTagName);
		System.out.println("paintRecent : " + paintRecent);

		// 전체 도서 db만들기
		service.checkTotalDB();
		return "search/searchMain";
	}

	@PostMapping("/datasearchProc")
	public String datasearchProc() {

		return "search/searchMain";
	}

	@GetMapping("/datasearch/totalSearch")
	public String totalSearch(@RequestParam(value = "currentPage", required = false) String cp,
			@RequestParam(required = false) String totalSearch, Model model) {
		// 모든 책을 보여줌
		if(totalSearch != null)
			service.totalSearch(totalSearch, cp, model);
		else
			service.getAllTotal(cp, model);
		
		return "search/totalSearch";
	}

	@PostMapping("/datasearch/totalSearchProc")
	public String totalSearchProc(String totalSearch, RedirectAttributes ra) {
		ra.addAttribute("totalSearch", totalSearch);

		return "redirect:/datasearch/totalSearch";
	}

	@RequestMapping("/datasearch/subMenuSearch")
	public String subMenuSearch() {
		// TODO Auto-generated method stub
		return "search/subMenuSearch";
	}
	
	@RequestMapping("/datasearch/bookDetail")
	public String bookDetail(String isbn, Model model) {
		System.out.println("bookDetailProc : " + isbn);
	    String detailParam = "&isbn13=" + isbn; // 이미 숫자로 된 문자열이므로 인코딩할 필요 없음

	    ArrayList<BookDetailDTO> detail = null;
	    String detailUrl = service.reqUrlParam("srchDtlList", detailParam);
	    System.out.println(detailUrl);
	    BookDetailDTO bookDTO = new BookDetailDTO();
	    
	    String xmlResponse = service.connAPI(detailUrl);
	    String XmlTagName = "detail";
	    
	    if (xmlResponse != null) {
	        detail = service.detailXmltoList(xmlResponse, XmlTagName);
	        for (BookDetailDTO info : detail) {
	        	bookDTO.setBookName(info.getBookName());
	        	bookDTO.setAuthors(info.getAuthors());
	        	bookDTO.setPublisher(info.getPublisher());
	        	bookDTO.setPublicationYear(info.getPublicationYear());
	        	bookDTO.setBookImageURL(info.getBookImageURL());
	        	bookDTO.setIsbn(info.getIsbn());
	        	bookDTO.setDescription(info.getDescription());
	        	bookDTO.setClassName(info.getClassName());
	        	
	        }
	    }
	    model.addAttribute("detail", bookDTO);
	    return "search/bookDetail";
	}
	
	@ResponseBody // return을 jsp가 아닌 응답 데이터를 주는 것이다.
	@RequestMapping(value = "datasearch/bookLoanProc",  produces = "application/json; charset=UTF-8")
	public String bookDetailProc(@RequestBody(required = false) BookLoanDTO loanData) {
		//System.out.println(loanData.getStatus());
		String id = (String)session.getAttribute("id");
		loanData.setUserId(id);
		String result = service.insertLoan(loanData);
		
		return result ;
	}

}
