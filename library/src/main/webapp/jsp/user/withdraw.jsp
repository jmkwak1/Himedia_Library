<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/myLibrary.css" rel = "stylesheet" type = "text/css">


<title>하이미디어 도서관 - 마이라이브러리 : 회원탈퇴</title>
<body>
	<div class="withdrawContent">
		<p>
			&nbsp;- 그동안 도서관 이용에 감사드리며, 회원 탈퇴 시 동일 아이디로 재가입이 불가능할 수 있습니다.<br>
			&nbsp;- 도서대출회원은 도서대출(상호대차)/예약 상태 확인 후 탈퇴가 가능합니다.<br>
			&nbsp;- 도서 대출정지회원은 대출정지일 후 회원탈퇴가 가능합니다.<br>
			&nbsp;※ 탈퇴 시 도서대출이력 및 개인정보 완전 삭제<br>
		</p>
	</div>
	<form class="withdrawForm" action="withdrawProc" method="post" id="f">
		<label for = "name">이름</label>
		<span class="myInfoName">${sessionScope.name}</span><br>
		
		<label>아이디</label>
		<span class="myInfoId">${sessionScope.id}</span><br>
		
		<label>비밀번호<span class="caution">*</span></label>
		<input type="password" name="pw" id="pw" ><br>
		
		<input type="submit" class="withdrawBtn" value="회원탈퇴">
		<input type="button" class="cancelBtn" value="취소" onclick="location.href='/myLibrary/myInfo'"><br>
	</form>
	<script src = "javaScript/myInfoUpate.js"></script>
</body>