<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/admin.css" rel = "stylesheet" type = "text/css">
<script src = "javaScript/admin.js"></script>

<head>
	<title>하이미디어 도서관 - 관리자 페이지 : 회원관리</title>
		<script>
		document.addEventListener('DOMContentLoaded', function() {
		      condition();
		    });
		</script>
</head>

<body onload="condition()">
	<div class="contentBox">
		<form action="">
			<div class="condition" >
				<label id="memberLbl" class="memberLbl">회원구분</label>
				<select id="memberSelect" class="memberSelect" name="memberSelect">
					<option <c:if test="${param.memberSelect == 'R'}">selected='selected'</c:if> value = "R">인증신청</option>
					<option <c:if test="${param.memberSelect == 'D'}">selected='selected'</c:if> value = "D">준회원</option>
					<option <c:if test="${param.memberSelect == 'A'}">selected='selected'</c:if> value = "A">정회원</option>
					<option <c:if test="${param.memberSelect == 'W'}">selected='selected'</c:if> value = "W">탈퇴회원</option>
				</select>
				<label id="idLbl" class="idLbl">아이디</label>
				<select id="searchSelect" class="searchSelect">
					<option>아이디</option>
					<option>이름</option>
					<option>연락처</option>
				</select>
				<input type = "text" placeholder="검색어를 입력하세요." id="memberSearch">
				<input type = "submit" value = "조회" id="searchBtn">
			</div>
			<table class="selectMember">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>상태</th>
					<th>
						<c:choose>
							<c:when test = "${param.memberSelect == 'D' }">
								가입일
							</c:when>
							<c:when test = "${param.memberSelect == 'W' }">
								탈퇴일								
							</c:when>
							<c:when test = "${param.memberSelect == 'A'}">
								인증일
							</c:when>
							<c:otherwise>
								신청일
							</c:otherwise>
						</c:choose>
					</th>
				</tr>
				<c:choose>
					<c:when test = "${empty members}">
						<tr>
							<td colspan=5> 조회된 회원이 없습니다. </td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="member" items="${members }">
							<tr <c:if test = "${param.memberSelect == 'R' || param.memberSelect == null}">
								<tr onclick = "location.href='memberConfirm?id=${member.id }'" style="cursor:pointer;">
								</c:if>>
								<td>${member.rn }</td>
								<td>${member.id }</td>
								<td>${member.name }</td>
								<td>
									<c:if test = "${member.status == 'D'}">
										준회원
									</c:if>
									<c:if test = "${member.status == 'A'}">
										정회원
									</c:if>
									<c:if test = "${member.status == 'W'}">
										탈퇴회원
									</c:if>
									<c:if test = "${member.status == 'R'}">
										인증신청
									</c:if>
								</td>
								<td>
									<c:if test = "${member.status == 'D'}">
										${member.regDate }
									</c:if>
									<c:if test = "${member.status != 'D'}">
										${member.authDate }
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="memberPage">
				${result }
			</div>
			
		</form>
	</div>
</body>
