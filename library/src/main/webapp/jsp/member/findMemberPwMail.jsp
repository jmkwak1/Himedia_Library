<script src = "/dbLibrary.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD

<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/container.css" rel="stylesheet" type="text/css">
=======
<c:url var="context" value="/"/>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">
>>>>>>> refs/heads/main

<title>하이디미어 도서관 - 아이디/비밀번호 찾기</title>
<c:import url = "/header"/>

<style>
	.find .active{background-color:#338cfa;}
	.find .active a{color:#fff;}
	.auth {display:flex; justify-content: center; height:auto;}
	.auth_email {height:auto;}
	input[type="button"] {width:399.85px; height:45px; border:1px solid #ddd; cursor:pointer;}
</style>


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
			<div class = "findId">
				<a href = "/findMemberId">아이디 찾기</a>
			</div>
			<div class="findPw active">
				<a href = "/findMemberPw">비밀번호 찾기</a>
			</div>
		</div>		
		<div class="auth">
			<div class="auth_email" align="center">
					<h2>이메일 인증</h2>
					<form class="form" method="post" id ="emailForm" action="findMemberPwMailResult" align="center">
						<p><img src = "${context }image/email.png"></p>
						<div>
							<input type = "text" placeholder = "아이디를 입력해주세요." id = "authId" name = "authId" class="authId" style = "width:55%">
							<input type = "button" value = "확인" style = "width:40%; margin-left:0px;" onclick = "findPwIdChk()">
						</div>
						<br><br>
						<label id = "label3"></label><br><br>
						<input type = "text" placeholder = "이메일을 입력해주세요." id = "authEmail" name = "authEmail" class="authEmail" style="display:none; margin-left:10px"><br><br>
						<label id = "label"></label><br><br>
						<input type = "button" id = "authEmailBtn" value = "인증 메일 발송" onclick = "sendEmail()" style = "display:none"/>
						<br><br><br>
						<input type = "text" placeholder = "인증번호를 입력해주세요." id = "authNum" name = "authNum" style = "display:none; margin-left:10px"><br><br>
						<label id = "label2"></label><br><br>
						<input type = "button" value = "이메일 인증 완료" id = "confirmEmail" style = "display:none" onclick = "auth()"><br>
					</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
