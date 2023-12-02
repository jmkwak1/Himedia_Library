<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/myLibrary.css" rel = "stylesheet" type = "text/css">


<title>하이미디어 도서관 - 마이라이브러리 : 회원정보</title>

<body>
	<div class="updateAuthContent">
		<p>
		  - 취득방법<br>
		  &nbsp;· 방문 가입 : 자료실 직원에게 필요 서류 제시(방문 가입 시 필요 서류는 아래 참고)<br>
		  &nbsp;· 비대면 가입 : 담당자 메일로 관련 서류 제출 → 하단에 인증신청 클릭<br>
		  <br>
		  - 정회원 인증 시 필요 서류 (※ 홈페이지 회원가입 완료 후 필요 서류 제시)<br>
		  &nbsp;&nbsp;· 어린이 : 현재 주소가 기재된 주민등록등본<br>
		  &nbsp;&nbsp;&nbsp;※ 부모님 대리신청 시 : 부모님 신분증, 가족관계 증빙서류(주민등록등본, 가족관계증명서 등)<br>
		  &nbsp;&nbsp;· 중·고등학생 : 학생증(주소 미기재 시 주민등록등본 함께 제시)<br>
		  &nbsp;&nbsp;· 성인 : 현재 주소가 기재된 신분증(주민등록증, 운전면허증, 주민등록등본 등)<br>
		  &nbsp;&nbsp;· 서울시 소재 직장에 재직 중인 타시도 거주자 : 현주소가 기재된 신분증, 재직증명서<br>
		  &nbsp;&nbsp;· 서울시 소재 학교에 재학 중인 타시도 거주자 : 현주소가 기재된 신분증, 재학증명서<br>
		  &nbsp;&nbsp;· 외국인 : 국내거소신고증 또는 외국인등록증<br>
		  </p>
	</div>
	<form class="updateAuthForm" action="updateAuthProc" method="post" id="f">
		<label for = "name">이름</label>
		<span class="myInfoName">${sessionScope.name}</span><br>
		
		<label>아이디</label>
		<span class="myInfoId">${sessionScope.id}</span><br>
		
		<c:choose>
			<c:when test = "${result != null}">
				<p class = "result">${result }</p>
				<input type = "button" class="backBtn" value ="돌아가기" onclick = "location.href='${context }myLibrary/myInfo'">
			</c:when>
			<c:when test = "${reject != null }">
				<label>반려사유</label>
				<span class= "myInfoReject">${reject }</span><br>
				<div id = "reapply" style = "display:none">
					<label>비밀번호<span class="caution">*</span></label>
					<input type="password" name="pw" id="pw" ><br>
					<input type="submit" class="registerBtn" value="인증신청">
					<input type="button" class="cancelBtn" value="취소" onclick="location.href='${context }myLibrary/myInfo'"><br>
				</div>
				<div id = "reapplyButton">
					<input type = "button" class = "reapplyBtn" value ="인증재신청" onclick="reapply()">
					<input type = "button" class="backBtn" value ="돌아가기" onclick = "location.href='${context }myLibrary/myInfo'">
				</div>
			</c:when>
			<c:otherwise>
				<label>비밀번호<span class="caution">*</span></label>
				<input type="password" name="pw" id="pw" ><br>
				<input type="submit" class="registerBtn" value="인증신청">
				<input type="button" class="cancelBtn" value="취소" onclick="location.href='${context }myLibrary/myInfo'"><br>
			</c:otherwise>
		</c:choose>
	</form>
	<script src = "${context }javaScript/myInfoUpate.js"></script>
</body>