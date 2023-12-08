<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href=""${context }css/container.css" rel="stylesheet" type="text/css">

<title>하이디미어 도서관 - 아이디/비밀번호 찾기</title>
<c:import url = "/header"/>

<style>
	.find .active{background-color:#338cfa;}
	.find .active a{color:#fff;}
	.info {margin:40px 0; padding:20px; border:1px solid #ddd; font-size:17px; line-height:145%;}
	input[type="button"] {position:relative; left:35%; width: 270px; padding:18px; cursor: pointer; font-size:20px;}
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
			<div class = "findId active">
				<a href = "/findMemberId">아이디 찾기</a>
			</div>
			<div class="findPw">
				<a href = "/findMemberPw">비밀번호 찾기</a>
			</div>
		</div>		
		<div>
			<h2 align = "center">아이디 찾기</h2>
			<c:choose>
				<c:when test = "${empty id}">
					<div class="info" style = "text-align:center; height:200px; line-height:200px;">
						등록된 회원 정보가 아닙니다.
					</div> 
				</c:when>
				<c:otherwise>
					<div class="info" style = "text-align:center">
						${name}님의 아이디는 ${id}입니다.<br>
						이메일은 ${email}입니다.
					</div>
				</c:otherwise>
			</c:choose>
			
			<input type = "button" value = "확인" onclick = "location.href='/login'">
		</div>
	</div>
</div>
<c:import url="/footer"/>
