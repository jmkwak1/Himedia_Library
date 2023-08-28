<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="context" value="/" />

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/info.css" rel="stylesheet" type="text/css">

<title>하이미디어 도서관 - 정보광장 : 자주하는 질문</title>

<script>
	function delFaq() {
		if (confirm('자주하는 질문을 삭제하시겠습니까?') == true) {
			alert('자주하는 질문이 삭제되었습니다.');
			location.href = 'faqDelete?no=${faq.no}';
		}
	}
</script>

<body>
	<c:import url="/header" />
	<div class="infoContainer inner pageContent_mt">
		<c:import url="/subMenuInfo" />
		<div class="noticeFormContent">
			<h1>자주하는 질문</h1>
			<div class="mb_30 mt_20">
				<a href="/main">HOME</a> > 
				<a href="${context }info/notice">정보광장</a> >
				<a class="checked" href="${context }info/faq">자주하는 질문</a>
			</div>
			<div class="faqContainer">
				<table class="faqContentForm">
					<tr>
						<th>제목</th>
						<td>${faq.title}</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<c:if test = "${faq.category == 'member'}">
							<td>회원가입 및 탈퇴</td>
						</c:if>
						<c:if test = "${faq.category == 'book'}">
							<td>도서열람</td>
						</c:if>
						<c:if test = "${faq.category == 'library'}">
							<td>도서관 이용</td>
						</c:if>
						<c:if test = "${faq.category == 'site'}">
							<td>사이트 이용</td>
						</c:if>
						
					</tr>
					<tr>
						<th>내용</th>
						<td>${faq.content }</td>
					</tr>
				</table>
				<div class="noticeBtn">
					<c:if test = "${sessionScope.status == 'M'}">
						<input type="button" value="수정" onclick="location.href='faqUpdate?no=${faq.no}'">
						<input type="button" value="삭제" onclick="delFaq()">
					</c:if>
					<input type="button" value="목록" onclick="location.href='faq'">
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer" />
</body>
<script src = "${context }javaScript/info.js"></script>