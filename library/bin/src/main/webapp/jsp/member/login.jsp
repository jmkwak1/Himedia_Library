<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link href="/css/main.css" rel="stylesheet" type="text/css">
    <link href="/css/container.css" rel="stylesheet" type="text/css">
<c:import url = "/header"/>
<% 
String RESTAPIKEY = "3f70e9cb27d96ef5a414516587c2cb5c";
String redirectURI = "http://localhost/kakaoLogin";
%>
<div class="loginContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>로그인</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="/register">회원정보</a> >
			<a class="checked" href="/login">로그인</a>
		</div>
		<div class="contentBox">
			<div class="loginImgBox">
				<img src="/image/loginImg.png" alt="yanolja-logo-gray"> 
			</div>
			<div>
				<form action="loginProc" method="post" class="mb_10" id="f">
					<div class="mr_10">
						<label>아이디 </label>
						<input type="text" name="id" placeholder="아이디" class="mb_10" id="id"><br>
						<label>비밀번호 </label>
						<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
					</div>
					<input type="submit" value="로그인" class="loginButton" onclick="loginCheck()">
				</form>
				<input type="checkbox" class="saveId"/>
				<label>아이디 저장</label>
				<div class="kakao">
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&
					client_id=<%=RESTAPIKEY%>&
					redirect_uri=<%=redirectURI%>">
						<img class="kakaoLoginBox" src = "https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" />
					</a>
				</div>
				<div class="bottomButtonBox">
					<button class="registerButton">회원가입</button>
					<button class="findButton">아이디/비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>


