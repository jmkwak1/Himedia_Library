<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:url var="context" value="/"/>
<title>하이디미어 도서관 - 회원가입</title>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">

<c:import url = "/header"/>
<div class="RegisterContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>회원가입</h1>
		<div class="mb_30 mt_20">
			<a href="${context }main">HOME</a> > 
			<a href="${context }register">회원정보</a> >
			<a class="checked" href="${context }register">회원가입</a>
		</div>
		<div class="register">
			<div>
				※ 회원 유형에 따라 회원 가입 절차가 다르며,<br>
				실제 정보와 가입 정보가 차이가 있을 경우 인증이 되지 않을 수 있습니다.
			</div>
			<div class="regProcess">
				<span class="active">회원유형</span> <p>></p>
				<span>약관동의</span> <p>></p>
				<span>본인확인</span> <p>></p>
				<span>정보입력</span> <p>></p>
				<span>가입완료</span>
			</div>
		</div>
		
		<div class="age">
			<div class="age_adult">
				<h2>만 14세 이상</h2>
				<p>일반회원</p>
				<p><img src = "${context }image/mem_adult.png"></p>
				<div><a href = "${context }register1">가입하기</a></div>
			</div>
			<div class="age_child">
				<h2>만 14세 미만</h2>
				<p>어린이, 학생회원</p>
				<p><img src = "${context }image/mem_child.png"></p>
				<div><a href = "${context }register1">가입하기</a></div>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>


