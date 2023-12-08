<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/admin.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 관리자 페이지 : 반납 등록</title>

<body>
	<c:import url = "/header"/>
	<div class = "loanRegisterFormContainer inner pageContent_mt">
		<c:import url = "/subMenuAdmin"/>
		<div class = "loanRegisterFormContent">
			<div class = "admin header">
				<h1>도서관리</h1>
				<div class="mb_30 mt_20" style = "border-bottom:1px solid #ddd; padding-bottom:20px;">
					<a href="/main">HOME</a> > 
					<a href="${context }admin/member">관리자페이지</a> >
					<a class="checked" href="${context }admin/book">대출관리</a>
				</div>
			</div>
			<div class="loanRegisterContainer">
				<table class="loanRegisterForm">
					<tr>
						<th>도서정보</th>
						<td>${loan.bookName}</td>
						<th class="right">ISBN</th>
						<td>${loan.isbn }</td>
					</tr>
					<tr>
						<th>대출자</th>
						<td>${loan.userId}</td>
						<c:if test = "${loan.status == 'R'}">
							<th class="right">예약일</th>
							<td>${loan.reserveDate }</td>
						</c:if>
					</tr>
					<tr>
						<th>대출기간</th>
						<td colspan=3>
							${loan.startDate } ~ ${loan.endDate }
						</td>
					</tr>
				</table>
				<div class="loanBtn">
					<c:if test = "${loan.status == 'L' || 'LE'}">
						<input type = "button" value = "반납" onclick="location.href='bookReturn?loanId=${loan.loanId}'">
					</c:if>
					<input type = "button" value = "목록" onclick="goBack()">
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/admin.js"></script>