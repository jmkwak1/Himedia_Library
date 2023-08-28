<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:url var="context" value="/"/>
    
<title>하이디미어 도서관 - 카카오 연동 회원가입</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/kakaoRegister.css" rel="stylesheet" type="text/css">
<script src = "${context }javaScript/registerInputInfo.js"></script>

<div class="KRContainer" >
	<div class="KRContent">
		<div class="logo">
        	<a href="${context}main"><img src="/image/LOGO.png"></a>
		</div>
		<h1 class="mb_20">카카오 연동 회원가입</h1>
		<!--아이디(중복체크), 비밀번호, 이름, 생년월일, 주소, 전화번호 -->
		<form action="kakaoRegisterProc" method="post" id="f">
			<label for = "name">이름<span class="caution">*</span></label>
			<input type="text"  name="name" id="name" placeholder="이름" onblur="nameCheck()" autofocus="autofocus"> <!-- onblur 이벤트는 입력창이 포커스를 잃을 때 실행 -->
			<label id="nameLabel" class="alert"></label><br>
			
			<label>보호자 이름</label>
			<input type="text" name="proName" id="proName" placeholder="보호자 이름" ><br>
			
			<label>생년월일</label>
			<input type="text" name="birth" id="birth" placeholder="생년월일 2000-08-25"  ><br>
			
			<label>아이디<span class="caution">*</span></label>
			<input type="text" name="id" id="id" placeholder="아이디" onkeyup="idRegCheck()">
			<button type="button" id="idCheckBtn" onclick="idCheckSend()">중복확인</button><br>
			<div id="idCheckLabel" class="alert"></div>
			<span id="idCondition" class="essential">*아이디는 6~12자리의 영문 또는 숫자 혼용, 특수 문자 제외</span><br>
			
			<label>비밀번호<span class="caution">*</span></label>
			<input type="password" name="pw" placeholder="비밀번호" id="pw" onkeyup="pwRegCheck()"><br>
			<span id="passwordCondition" class="essential">
			*비밀번호는 8 ~ 12자리이며, 반드시 영문자, 숫자를 혼합하여 입력하시기 바랍니다.(특수문자 제외)</span><br>
			
			<label>비밀번호 확인<span class="caution">*</span></label>
			<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm" disabled="disabled"
			onkeyup="pwConfirmCheck()">
			<span id="pwConfirmCaution" class="caution">* 비밀번호를 한번 더 입력해주세요.</span><br>
			<label id="pwConfirmMatch"></label><br>
			
			<label>주소<span class="caution">*</span></label>
			<input type="text" id="postCode" name="postCode" placeholder="우편번호">
			<input type="button" id="postcodeBtn" onclick="execDaumPostcode()" value ="우편번호 찾기"><br>
			<input type="text" id="address" name="address" placeholder="주소"><br>
			<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"><br>
			
			<label>연락처<span class="caution">*</span></label>
			<input type="text" name="mobile" id="mobile" placeholder="전화번호" >
			<input type="button" id="authBtn" onclick="sendAuth()" value="인증번호 받기"><br>
			<input type="text" id="regDate" name="regDate" style="display: none;"><br>
			
			<input type="button" class="registerBtn" value="회원가입" onclick="allCheck()">
			<input type="button" class="cancelBtn" value="취소" onclick="location.href='login'"><br>
		</form>
	</div>
</div>
<c:import url="/footer"/>


