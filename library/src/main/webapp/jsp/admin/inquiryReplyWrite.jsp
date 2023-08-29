<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/admin.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 관리자 페이지 : 1:1문의</title>

<body>
	<c:import url = "/header"/>
	<div class = "adminContainer inner pageContent_mt">
		<c:import url = "/subMenuAdmin"/>
		<div class = "adminContent">
			<div class = "admin header">
				<h1>1:1문의</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }admin/member">관리자페이지</a> >
					<a class="checked" href="${context }admin/inquiry">1:1문의</a>
				</div>
			</div>
			<div class="inquiryContainer">
				<form action="inquiryReplyWriteProc?no=${inquiry.no }" method ="post" id="f">
					<table class="inquiryContentForm">
						<tr>
							<th>제목</th>
							<td>${inquiry.title}</td>
							<th class="right">작성자</th>
							<td width="200">${inquiry.id }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td width="400">${inquiry.writeDate}</td>
							<th class="right">처리상태</th>
							<td width="200" id = "reply">
								<c:if test = "${inquiry.reply == 'N'}">
									미답변
								</c:if>
								<c:if test = "${inquiry.reply == 'Y'}">
									답변완료
								</c:if>
							</td>
							
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div>${inquiry.content}</div>
							</td>
						</tr>
						<tr>
							<th>답변내용</th>
							<td colspan="3"><textarea id = "content" name = "content" rows ="20" cols ="15" style = "resize: none" placeholder ="1000자 이내로 입력하세요."></textarea></td>
						</tr>
					</table>
				</form>
				<div class="inquiryBtn">
					<input type = "button" id="replyBtn" value = "등록" onclick="replyProc()">
					<input type = "button" value = "목록" onclick="location.href='${context }inquiry'">
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
	<script src = "${context }javaScript/admin.js"></script>
</body>