<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">

<script src = "${context }dbLibrary.js"></script>
<title>하이디미어 도서관 - 아이디/비밀번호 찾기</title>
<c:import url = "/header"/>

<style>
	.find .active{background-color:#338cfa;}
	.find .active a{color:#fff;}
	.info {margin:40px 0; padding:20px; border:1px solid #ddd; font-size:17px; line-height:145%;}
</style>


<div class="RegisterContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>아이디/비밀번호 찾기</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="/register">회원정보</a> >
			<a class="checked" href="${context }member/findMemberId">아이디/비밀번호 찾기</a>
		</div>
		<div class="find">
			<div class = "findId">
				<a href = "${context }member/findMemberId">아이디 찾기</a>
			</div>
			<div class="findPw active">
				<a href = "${context }member/findMemberPw">비밀번호 찾기</a>
			</div>
		</div>		
		<div>
			<h2 align = "center">비밀번호 찾기</h2>
			<div class = "info" align = "center">
				<form  action="changePw" class = "changePw" method="post">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type = "text" name = "authId" value = "${authId }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>변경할 비밀번호</th>
							<td><input type = "password" id = "changePw" name = "changePw" autocomplete="new-password" onchange = "changePwCheck()"></td>
						</tr>
						<tr>
							<th>변경할 비밀번호 확인</th>
							<td><input type = "password" id = "confirmChangePw" name = "confirmChangePw" autocomplete="new-password"
								onchange="changePwCheck()"></td>
						</tr>
						<tr>
							<td colspan = 2 align="center"><label id = "confirmResult"></label></td>
						</tr>
						<tr>
							<td colspan = 2 align="center">
								<div>
									<input type = "submit" value = "변경">
									<input type = "button" value = "취소" style = "margin-left:10px" onclick = "location.href='${context }member/login'">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
