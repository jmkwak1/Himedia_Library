<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<script src = "${context}dbLibrary.js"></script>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">

<title>하이디미어 도서관 - 회원가입</title>
<c:import url = "/header"/>

<style>
.regProcess span .active{background-color:#338cfa; color:#fff;}
.auth {display:flex; justify-content: center; height:auto;}
.auth_email {height:auto;}
input[type="button"] {width:399.85px; height:45px; border:1px solid #ddd; cursor:pointer;}
</style>


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
			<div class="auth_email">
					<h2>이메일 인증</h2>
					<form class="form" method="post" id ="emailForm">
						<p><img src = "${context }image/email.png"></p>
						<input type = "text" placeholder = "이메일을 입력해주세요." id = "authEmail" name = "authEmail" class="authEmail"><br><br>
						<label id = "label"></label><br><br>
						<input type = "button" value = "인증 메일 발송" onclick = "sendEmail()"/>
						<br><br><br>
						<input type = "text" placeholder = "인증번호를 입력해주세요." id = "authNum" name = "authNum" style = "display:none"><br><br>
						<label id = "label2"></label><br><br>
						<input type = "button" value = "이메일 인증 완료" id = "confirmEmail" style = "display:none" onclick = "resAuth()"><br>
					</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
