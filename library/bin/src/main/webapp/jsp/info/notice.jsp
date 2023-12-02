<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:url var="context" value="/"/>
    <head>
    
<title>하이디미어 도서관 - 정보광장 : 공지사항</title>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/info.css" rel="stylesheet" type="text/css">

<c:import url = "/header"/>
</head>
<body>
<div class="infoContainer inner mb_30" >
	<c:import url = "/subMenuInfo"/>
	<div class="infoContent">
		<h1>공지사항</h1>
		<div class="info_title">
			<p>여러분의 소중한 공간 하이미디어도서관 정보광장입니다.</p>
		</div>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="${context }info/notice">정보광장</a> >
			<a class="checked" href="${context }info/notice">공지사항</a>
		</div>
		<div class="contentBox">
			<div class="noticeContainer">
				<form action="" id="f">
					<div class="condition">
						<select class="noticeSelect" name = "select" id="noticeSelect" onchange="searchChange()">
							<option <c:if test="${param.select == 'title'}">selected='selected'</c:if>value="title">제목</option>
							<option <c:if test="${param.select == 'no'}">selected='selected'</c:if>value="no">글번호</option>
						</select>
						<input type = "text" placeholder = "검색어를 입력하세요." id="search" name="search">
						<input type = "button" value = "검색" id ="searchBtn" onclick="noticeSearch()">
					</div>
					<c:if test = "${sessionScope.status == 'M'}">
						<div class="write">
							<input type = "button" value = "공지사항 등록" onclick="location.href='${context }info/noticeWriteForm'">
						</div>
					</c:if>
					<table class="notice">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:choose>
							<c:when test = "${empty notices}">
								<tr>
									<td colspan = 4 style = "cursor:default; color:#000;">
										조회된 공지사항이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items = "${notices}">
									<tr onclick="location.href='${context }info/noticeContent?no=${notice.no}'">
										<td>${notice.no}</td>
										<td>${notice.title }</td>
										<td>${notice.writeDate }</td>
										<td>${notice.hits }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="noticePage">
						${result }
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/info.js"></script>


