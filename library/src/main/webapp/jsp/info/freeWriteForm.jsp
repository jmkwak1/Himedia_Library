<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var = "context" value = "/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/info.css" rel = "stylesheet" type = "text/css">

<script>
	function writeChk(){
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		
		if(title == "" || title.trim().length == 0){
			alert('제목을 입력하세요.');
		} else if(content == "" || content.trim().length == 0){
			alert('내용을 입력하세요.');
		} else {
			alert('게시글이 등록되었습니다.');
			var f = document.getElementById('f');
			f.submit();
		}
	}
</script>

<title>하이미디어 도서관 - 정보광장 : 자유게시판 등록</title>

<body>
	<c:import url = "/header"/>
	<div class = "noticeFormContainer inner pageContent_mt">
		<c:import url = "/subMenuInfo"/>
		<div class = "noticeFormContent">
			<div class = "notice header">
				<h1>자유게시판</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }info/notice">정보광장</a> >
					<a class="checked" href="${context }info/free">자유게시판</a>
				</div>
			</div>
			<div class="freeInfo" style = "margin-top:0">
				- 자유게시판의 글쓰기는 은평구공공도서관 회원만이 가능하며, 도서관과 무관한 내용, 비실명, 저속한 표현, 타인의 명예훼손,<br>&nbsp;&nbsp;반사회적인 글 등은예고없이 삭제됨을 알려드립니다.<br><br>
				- 주민등록번호, 연락처 등 개인정보를 등록할 경우 본인 및 제3자에게 피해를 입을 수 있사오니, 소중한 개인정보가 노출되지 않도록<br>&nbsp;&nbsp;주의를 기울여 주시기 바랍니다.<br><br>
				- 내용은 1,000자 이내로 작성 가능합니다. 긴글 작성 시 내용이 유실되지 않도록 메모장 등을 활용하여 주시기 바랍니다.
			</div>
			<div class="noticeContainer">
				<form action="freeWriteProc" method="post" id="f" class="noticeWrite">
					<table class="noticeWriteForm">
						<tr>
							<th>제목</th>
							<td><input type = "text" id = "title" name = "title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id = "content" name = "content" rows ="20" cols ="15" style = "resize: none"></textarea></td>
						</tr>
					</table>
					<div class="noticeBtn">
						<input type = "button" value = "등록" onclick="writeChk()" >
						<input type = "button" value = "돌아가기" onclick="location.href='free'">
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/info.js"></script>