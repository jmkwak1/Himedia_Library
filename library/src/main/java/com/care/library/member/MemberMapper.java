package com.care.library.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	String getNameById(String id);
	MemberDTO loginProc(String id);
	MemberDTO emailCheck(String email); //카카오 로그인시, 기존 회원 여부를 알기 위해.
	
	//카카오 로그인 시도시, 카카오 회원가입 여부 확인을 위해.
	MemberDTO kakaoIDCheck(String kakaoID); 
	int kakaoRegisterProc(MemberDTO member);
	
	MemberDTO idCheck(String id); //일반 회원가입 시 아이디 중복체크
	void registerProc(MemberDTO member);
	int changePw(String authId, String cryptPassword);
	int updateId(String id, String delId);
	
	int updateKakaoId(String kakaoEmail, String kakaoID);
}