<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="context" value="/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/admin.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 관리자 페이지 : 회원인증</title>

<c:import url = "/header"/>
<div class = "adminContainer inner pageContent_mt">
	<c:import url = "/subMenuAdmin"/>
	<div class = "adminContent">
		<div class = "admin header">
			<h1>회원관리</h1>
			<div class="mb_30 mt_20">
				<a href="/main">HOME</a> > 
				<a href="/member">관리자페이지</a> >
				<a class="checked" href="/member">회원관리</a>
			</div>
		</div>
		<div class="memberContainer">
			<form action = "memberConfirmProc" id ="f" method="post">
				<table class="memberDetail">
					<tr>
						<th>아이디</th>
						<td><input type = "text" name="id" class = "id" value="${member.id}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>회원구분</th>
						<td>
							<c:if test = "${member.status == 'D' }">준회원</c:if>
							<c:if test = "${member.status == 'R' }">준회원(인증신청)</c:if>
							<c:if test = "${member.status == 'A' }">정회원</c:if>
							<c:if test = "${member.status == 'M' }">관리자</c:if>
							<c:if test = "${member.status == 'W' }">탈퇴회원</c:if>
					</tr>
					<c:if test = "${member.status != 'W' }">
						<tr>
							<th>이름</th>
							<td>${member.name}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${member.birth}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${member.mobile}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${member.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${member.postCode}<br>${member.address} ${member.detailAddress}</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${member.regDate }</td>
						</tr>
						<tr>
							<th>회원분류</th>
							<td>
								<c:if test = "${member.userGroup == 'child'}">어린이</c:if>
								<c:if test = "${member.userGroup == 'student'}">중ㆍ고등학생</c:if>
								<c:if test = "${member.userGroup == 'adult'}">성인</c:if>
								<c:if test = "${member.userGroup == 'side'}">타시도 거주자</c:if>
								<c:if test = "${member.userGroup == 'foreign'}">외국인</c:if>
							</td>
						</tr>
						<tr>
							<th>제출서류</th>
							<td>
								<c:if test = "${member.paper == 'resident' }">주민등록등본</c:if>
								<c:if test = "${member.paper == 'studentID' }">학생증</c:if>
								<c:if test = "${member.paper == 'identity' }">주민등록증</c:if>
								<c:if test = "${member.paper == 'driving' }">운전면허증</c:if>
								<c:if test = "${member.paper == 'alien' }">국내거소신고증/외국인등록증</c:if>
							</td>
						</tr>
					</c:if>
				</table>
				<div>
					<input type = "button" value = "돌아가기" onclick="location.href='memberList'" style = "margin-bottom:40px;">
				</div>
			</form>
		</div>
	</div>
</div>
<c:import url = "/footer"/>
<script src = "${context }javaScript/admin.js"></script>