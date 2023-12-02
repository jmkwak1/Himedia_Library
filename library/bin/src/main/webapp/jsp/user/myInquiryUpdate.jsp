<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/myLibrary.css" rel = "stylesheet" type = "text/css">

<script>
	function writeChk(){
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		
		if(title == "" || title.trim().length == 0){
			alert('제목을 입력하세요.');
		} else if(content == "" || content.trim().length == 0){
			alert('내용을 입력하세요.');
		} else {
			var f = document.getElementById('f');
			f.submit();
		}
	}
</script>

<title>하이미디어 도서관 - 마이라이브러리 : 1:1문의 작성</title>

<body>
	<c:import url = "/header"/>
	<div class = "inquiryFormContainer inner pageContent_mt">
		<c:import url = "/subMenuMyLibrary"/>
		<div class = "inquiryFormContent">
			<div class = "admin header">
				<h1>1:1문의</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }adminMember">마이라이브러리</a> >
					<a class="checked" href="${context }myInquiry">1:1문의</a>
				</div>
			</div>
			<div class="inquiryContainer">
				<div class="inquiryInfo">
					- <a href = "#">자주묻는 질문</a> 게시판을 먼저 확인해주시기 바랍니다.<br><br>
					- 주민등록번호, 연락처 등 개인정보를 등록할 경우 피해를 입을 수 있으니, 소중한 개인정보가 노출되지 않도록 주의를 기울여 주시기<br>&nbsp;&nbsp;바랍니다.<br><br>
					- 자료이용 질문은 최대한 빠른 시일 내에 답변하도록 하겠습니다. 다만, 확인 절차가 필요한 경우 답변 처리가 지연이 될 수도 있으니 양해<br>&nbsp;&nbsp;부탁드립니다.<br>
				</div>
				<form action="myInquiryUpdateProc?rn=${inquiry.rn }" method="post" id="f" class="inquiryUpdate">
					<table class="inquiryUpdateForm">
						<tr>
							<th>작성자</th>
							<td>${sessionScope.name} (${sessionScope.id})</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type = "text" id = "title" name = "title" value="${inquiry.title }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id = "content" name = "content" rows ="20" cols ="15" style = "resize: none">${inquiry.content }</textarea></td>
						</tr>
					</table>
					<div class="inquiryBtn">
						<input type = "button" value = "목록" onclick="location.href='${context }myInquiry'">
						<input type = "button" value = "수정" onclick="writeChk()" >
						<input type = "reset" value = "취소">
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>