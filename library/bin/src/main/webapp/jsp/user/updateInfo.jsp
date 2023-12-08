<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href = "/css/main.css" rel = "stylesheet" type = "text/css">
<link href = "/css/myLibrary.css" rel = "stylesheet" type = "text/css">
<title>하이미디어 도서관 - 마이라이브러리 : 회원정보</title>

<body>
	<form action="changeMyInfoProc" method="post" id="f">
		<label>아이디</label>
		<span class="myInfoId">${sessionScope.id}</span><br>
		
		<label for = "name">이름</label>
		<span class="myInfoName">${sessionScope.name}</span><br>
		
		<label>생년월일</label>
		<input type="text" name="birth" id="birth" value="${birth}"><br>
		
		<label>연락처
			<span class="caution">*</span>	
		</label>
		<input type="text" name="mobile" id="mobile" value="${mobile}" >
		<input type="button" id="authBtn" onclick="sendAuth()"  value="휴대폰 인증">
		
		<input type="checkbox" class="SMSBtn" onclick="SMS()" value="SMS수신">
		<label>SMS 수신</label><br>
		
		<label>이메일
			<span class="caution">*</span>	
		</label>
		<input type="text" name="email" id="email" value="${email}" onkeyup="emailCheck()">
		<label id="emailLabel" class="alert"></label><br>
		
		<label>주소
			<span class="caution">*</span>	
		</label>
		<input type="text" id="postCode" name="postCode" value="${postCode}">
		<input type="button" id="postcodeBtn" onclick="execDaumPostcode()" value ="우편번호 찾기"><br>
		<input type="text" id="address" name="address" value="${address}"><br>
		<input type="text" id="detailAddress" name="detailAddress" value="${detailAddress}"><br>
		
		
		<input type="submit" class="registerBtn" value="수정">
		<input type="button" class="cancelBtn" value="취소" onclick="location.href='/main'"><br>
	</form>
	<script src = "/javaScript/myInfoUpate.js"></script>
</body>