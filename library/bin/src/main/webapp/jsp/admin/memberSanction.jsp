<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/admin.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 관리자 페이지 : 회원관리</title>

<c:import url = "/header"/>
<body>
<div class = "adminContainer inner pageContent_mt">
		<c:import url = "/subMenuAdmin"/>
		<div class = "adminContent">
			<div class = "admin header">
				<h1>회원관리</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }admin/member">관리자페이지</a> >
					<a class="checked" href="${context }admin/member">회원관리</a>
				</div>
				<div class = "subMenu_member" id = "subMenu_member">
					<ul class = "admin_member">
						<li class = "admin_menu" onclick="location.href='${context }admin/member'">인증 승인/반려</li>
						<li class = "admin_menu active" onclick="location.href='memberSanction'">회원 제재</li>
						<li class = "admin_menu" id="memberListMenu" onclick="location.href='memberList'">회원 목록 조회</li>
					</ul>
				</div>
			</div>
			<div class="adminMemberContainer">
				<div id = "memberContainer">
					<div class="contentBox">
						<form action = "" id = "f">
							<div class="condition" >
								<label id="memberLbl" class="memberLbl">회원구분</label>
								<select id="memberSelect" class="memberSelect" name="memberSelect">
									<option <c:if test="${param.memberSelect == 'T'}">selected='selected'</c:if> value = "T">전체</option>
									<option <c:if test="${param.memberSelect == 'R'}">selected='selected'</c:if> value = "R">인증신청</option>
									<option <c:if test="${param.memberSelect == 'D'}">selected='selected'</c:if> value = "D">준회원</option>
									<option <c:if test="${param.memberSelect == 'A'}">selected='selected'</c:if> value = "A">정회원</option>
									<option <c:if test="${param.memberSelect == 'W'}">selected='selected'</c:if> value = "W">탈퇴회원</option>
								</select>
								<label id="idLbl" class="idLbl">구분</label>
								<select id="searchSelect" class="searchSelect" name="searchSelect">
									<option <c:if test="${param.searchSelect == 'all'}">selected='selected'</c:if> value = "all">선택</option>
									<option <c:if test="${param.searchSelect == 'id'}">selected='selected'</c:if> value = "id">아이디</option>
									<option <c:if test="${param.searchSelect == 'name'}">selected='selected'</c:if> value = "name">이름</option>
								</select>
								<input type = "text" placeholder="검색어를 입력하세요." id="search" name = "search">
								<input type = "button" value = "조회" id="searchBtn" onclick = "memberSearch()">
							</div>
							<table class="selectMember">
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>상태</th>
									<th>
										<c:choose>
											<c:when test = "${param.memberSelect == 'D' || param.memberSelect == null || param.memberSelect == 'T'}">
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
										<tr style = "color:#000; cursor:default;">
											<td colspan=5> 조회된 회원이 없습니다. </td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="member" items="${members }">
											<tr <c:if test = "${param.memberSelect == 'R' || param.memberSelect == null}">
												<tr onclick = "location.href='memberDetail?id=${member.id }'" style="cursor:pointer;">
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
														준회원(인증신청)
													</c:if>
													<c:if test = "${member.status == 'M'}">
														관리자
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
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>

<script src = "${context }javaScript/admin.js"></script>