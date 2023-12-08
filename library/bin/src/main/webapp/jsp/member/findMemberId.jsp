<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<title>하이디미어 도서관 - 아이디/비밀번호 찾기</title>

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">
<style>
	.find .active{background-color:#338cfa;}
	.find .active a{color:#fff;}
</style>
<c:import url = "/header"/>
<div class="RegisterContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>아이디/비밀번호 찾기</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="/register">회원정보</a> >
			<a class="checked" href="/findMemberId">아이디/비밀번호 찾기</a>
		</div>
		<div class="find">
			<div class = "findId active">
				<a href = "/findMemberId">아이디 찾기</a>
			</div>
			<div class="findPw">
				<a href = "/findMemberPw">비밀번호 찾기</a>
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
				<div><a href = "/findMemberIdMail">이메일 인증</a></div>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>


