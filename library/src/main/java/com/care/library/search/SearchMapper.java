package com.care.library.search;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.library.member.MemberDTO;

@Mapper
public interface SearchMapper {
	
	int findMaxNum();
	
	int popularInsert(BookDTO book);
	
	int recentInsert(BookDTO book);

	int insertTotal(BookDTO book);
	
	void deleteData(String whichTable);
	
	ArrayList<String> getBookImages(String whichTable);
	
	ArrayList<BookDTO> getBookInfo(String whichTable);
	
	int checkTotalDB();
	
	int checkSearchCount(String search);
	
	ArrayList<BookDTO> getTable(String whichTable);
	
//	통합검색 결과
	ArrayList<BookDTO> totalSearch(String search, int begin, int end);
	
	ArrayList<BookDTO> getTotal(int begin, int end);
	
	// 대출 하기 버튼 클릭시
	int insertLoan(BookLoanDTO loanData);
	
	int checkRestVol(String isbn);
	
	int updateRestVol(String isbn);
	
	ArrayList<BookLoanDTO>getMyBookStatus(String userId);
	
	ArrayList<BookLoanDTO> getMyLoanHistory(String userId);
	
	int updateLoanStatus(String id, String isbn, String newEndDate);
	
	MemberDTO findAdmin();

	void reserveCancel(String loanId);

}