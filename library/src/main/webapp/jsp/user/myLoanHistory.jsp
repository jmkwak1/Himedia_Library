<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
    <head>
<title>하이미디어 도서관 - 마이라이브러리 : 대출 이력 조회</title>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/myLibrary.css" rel = "stylesheet" type = "text/css">

 </head>   
<body>
	<c:import url = "/header"/>
	<div class = "myLibraryContainer inner pageContent_mt">
		<c:import url = "/subMenuMyLibrary"/>
			<div class = "myLibraryContent">
				<div>
					<h1>대출 이력 조회</h1>
					<div class="mb_30 mt_20">
						<a href="/main">HOME</a> > 
						<a href="/adminMember">마이라이브러리</a> >
						<a class="checked" href="/adminMember">대출 이력 조회</a>
					</div>
				</div>
				<div class="RIContainer">
					<div id="myInfoContainer">
						<table class="bookStatusTable">
						<tr>
							<th>제목</th>
							<th>빌린 날짜</th>
							<th>반납 날짜</th>
							<th>상태</th>
						</tr>
						<c:choose>
							<c:when test = "${empty myLoanHistory}">
								<tr>
									<td colspan = 5 style = "cursor:default; color:#000;">
										대출 이력이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="history" items = "${myLoanHistory}">
									<tr <%-- onclick="location.href='inquiryContent?no=${inquiry.no}'" --%>>
										<td>${history.bookName}</td>
										<td>${history.startDate}</td>
										<td>${history.endDate}</td>
										<td> 
											<c:if test="${history.status == 'C'}">
												반납 완료
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					</div>
				</div>
			</div>
			</div>
		
	<c:import url="/footer"/>
</body>