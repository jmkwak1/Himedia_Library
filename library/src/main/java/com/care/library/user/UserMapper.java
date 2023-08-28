package com.care.library.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

	UserDTO getMyInfo(String id);
	
	int changeMyInfoProc(UserDTO myInfo);
	
	int findMaxNum();

	int myInquiryWrite(InquiryDTO inquiry);

	int count(String id);
	
	String currentPwCheck(String id);
	
	int updatePw(String newPW, String id);
	
	int updateAuth(String id);
	
	int updateId(String id, String delId);

	ArrayList<InquiryDTO> selectInquiry(@Param("id")String id, @Param("begin")int begin, @Param("end")int end);

	ArrayList<InquiryDTO> selectInquiryTitle(String id, String search, int begin, int end);

	ArrayList<InquiryDTO> selectInquiryReply(String id, String replySelect, int begin, int end);

	int updateAuth(String id, String authDate);

	InquiryDTO selectMyInquiry(String id, String rn);

	void updateMyInquiry(String id, int no, String title, String content);

	void deleteMyInquiry(int no);

	String findAdmin();

	int countReply(String id, String replySelect);

}