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
				<h1>열람실관리</h1>
				<div class="mb_30 mt_20" style="border-bottom: 1px solid #ddd; padding-bottom: 20px;">
				<a href="/main">HOME</a> > 
				<a href="${context }admin/member">관리자페이지</a>
				> <a class="checked" href="${context }admin/room">열람실관리</a>
			</div>
				<div class = "subMenu_book" id = "subMenu_info">
				<ul id = "room_menu">
					<li class = "info_menu" value="bookLoan"><a href="${context}admin/room">오픈/마감</a></li>
					<li class = "info_menu active" id="memberListMenu" value = "bookManage"><a href="${context}admin/roomStatus">열람실현황</a></li>
				</ul>
			</div>
			</div>
			<div class="adminMemberContainer">
				<div id = "memberContainer">
					<div class="contentBox">
						<form action = "" id = "f">
							<div class="condition" >
								<label id="memberLbl" class="memberLbl">열람실</label>
								<select id="memberSelect" class="memberSelect" name="roomSelect">
									<option <c:if test="${param.memberSelect == 'T'}">selected='selected'</c:if> value = "T">전체</option>
									<option <c:if test="${param.memberSelect == 'R1'}">selected='selected'</c:if> value = "R1">자율학습실1</option>
									<option <c:if test="${param.memberSelect == 'R2'}">selected='selected'</c:if> value = "R2">자율학습실2</option>
								</select>
								<label id="idLbl" class="idLbl">구분</label>
								<select id="searchSelect" class="searchSelect" name="searchSelect">
									<option <c:if test="${param.searchSelect == 'all'}">selected='selected'</c:if> value = "all">전체</option>
									<option <c:if test="${param.searchSelect == 'id'}">selected='selected'</c:if> value = "id">아이디</option>
								</select>
								<input type = "text" placeholder="검색어를 입력하세요." id="search" name = "search">
								<input type = "button" value = "조회" id="searchBtn" onclick = "roomSearch()">
							</div>
							<table class="selectMember">
								<tr>
									<th>좌석 번호</th>
									<th>아이디</th>
									<th>열람실</th>
								</tr>
								<c:forEach var="seat" items="${allseat }">
									<c:if test="${seat.seatId != '0'}">
										<tr>
											<td>${seat.seatId}</td>
											<td>${seat.userId}</td>
											<td>${seat.room }</td>
										</tr>
									</c:if>
								</c:forEach>
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