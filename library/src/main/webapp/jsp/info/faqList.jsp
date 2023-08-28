<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/info.css" rel = "stylesheet" type = "text/css">
<script src = "${context }javaScript/info.js"></script>
<body>
	<div class="contentBox" style="padding-bottom:40px; padding-top:0;">
		<form action="">
			<table class="selectFaq">
				<tr>
					<th>번호</th>
					<th>제목</th>
				</tr>
				<c:choose>
					<c:when test = "${empty faqs}">
						<tr style = "color:#000; cursor:default">
							<td colspan=2> 조회된 내용이 없습니다. </td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="faq" items="${faqs }">
							<tr onclick="location.href='faqContent?no=${faq.no}'">
								<td>${faq.rn }</td>
								<td>${faq.title}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="faqPage">
				${result}
			</div>
		</form>
	</div>
</body>
