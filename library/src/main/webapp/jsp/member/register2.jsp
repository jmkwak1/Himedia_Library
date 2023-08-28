<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>하이디미어 도서관 - 회원가입</title>
<c:url var="context" value="/"/>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">
<c:import url = "/header"/>
<div class="RegisterContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>회원가입</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="/register">회원정보</a> >
			<a class="checked" href="/register">회원가입</a>
		</div>
		<div class="register">
			<div class="regProcess">
				<span>회원유형</span> <p>></p>
				<span>약관동의</span> <p>></p>
				<span class="active">본인확인</span> <p>></p>
				<span>정보입력</span> <p>></p>
				<span>가입완료</span>
			</div>
		</div>
		
		<div class="auth">
			<div class="auth_mobile">
				<h2>휴대폰 인증</h2>
				<p><img src = "${context }image/mobile.png"></p>
				<div><a href = "/register1">휴대폰 인증</a></div>
			</div>
			<div class="auth_email">
				<h2>이메일 인증</h2>
				<p><img src = "${context }image/email.png"></p>
				<div><a href = "/register2_2">이메일 인증</a></div>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>


