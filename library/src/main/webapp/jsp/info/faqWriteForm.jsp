<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var = "context" value = "/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/info.css" rel = "stylesheet" type = "text/css">

<script>

</script>

<title>하이미디어 도서관 - 정보광장 : 자주하는 질문 등록</title>

<body>
	<c:import url = "/header"/>
	<div class = "faqFormContainer inner pageContent_mt">
		<c:import url = "/subMenuInfo"/>
		<div class = "faqFormContent">
			<div class = "notice header">
				<h1>자주하는 질문</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }info/notice">정보광장</a> >
					<a class="checked" href="${context }info/faq">자주하는 질문</a>
				</div>
			</div>
			<div class="faqContainer">
				<form action="faqWriteProc" method="post" id="f" class="noticeWrite">
					<table class="faqWriteForm">
						<tr>
							<th>구분</th>
							<td>
								<select id = "category" name = "category" style = "height:30px; width:150px; appearance: auto; -webkit-appearance: auto;">
									<option value = "">선택</option>
									<option value = "member">회원가입 및 탈퇴</option>
									<option value = "book">도서열람</option>
									<option value = "library">도서관 이용</option>
									<option value = "site">사이트 이용</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type = "text" id = "title" name = "title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id = "content" name = "content" rows ="20" cols ="15" style = "resize: none"></textarea>
							</td>
						</tr>
					</table>
					<div class="noticeBtn">
						<input type = "button" value = "등록" onclick="faqWriteChk()" >
						<input type = "button" value = "목록" onclick="location.href='faq'">
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/info.js"></script>