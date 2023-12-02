<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
    <head>
<title>하이미디어 도서관 - 마이라이브러리 : 대출/예약/연장 현황</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/myLibrary.css" rel = "stylesheet" type = "text/css">
<script>
	let extMsg = "${extMsg}";
	if (extMsg !== "")
		alert(extMsg);
</script>
 </head>   
<body>
	<c:import url = "/header"/>
	<div class = "myLibraryContainer inner pageContent_mt">
		<c:import url = "/subMenuMyLibrary"/>
			<div class = "myLibraryContent">
				<div>
					<h1>대출/예약/연장 현황</h1>
					<div class="mb_30 mt_20">
						<a href="/main">HOME</a> > 
						<a href="${context }user/adminMember">마이라이브러리</a> >
						<a class="checked" href="${context }user/adminMember">대출/예약/연장 현황</a>
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
							<th>연장 신청</th>
						</tr>
						<c:choose>
							<c:when test = "${empty myBook}">
								<tr>
									<td colspan = 5 style = "cursor:default; color:#000;">
										등록한 문의가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="bookStatus" items = "${myBook}">
									<tr <%-- onclick="location.href='inquiryContent?no=${inquiry.no}'" --%>>
										<td>${bookStatus.bookName}</td>
										<td>${bookStatus.startDate}</td>
										<td>${bookStatus.endDate}</td>
										<td>
											<c:if test = "${bookStatus.status == 'R' }">
												<span>예약중</span>
											</c:if>
											<c:if test = "${bookStatus.status == 'L' }">
												<span>대출중</span>
											</c:if>
											<c:if test = "${bookStatus.status == 'O' }">
												<span class="overDue">연체중</span>
											</c:if>
										</td>
										<td >
											<c:if test = "${bookStatus.status == 'L' }">
												<button class="extendBtn" onclick="extend(${bookStatus.isbn},'${bookStatus.endDate}')">연장 하기</button>
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
		<script src="${context}javaScript/myBook.js" ></script>
	<c:import url="/footer"/>
</body>