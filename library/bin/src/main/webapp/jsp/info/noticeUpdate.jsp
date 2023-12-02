<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var = "context" value = "/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/info.css" rel = "stylesheet" type = "text/css">

<script>
	function updateChk(){
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		
		if(title == "" || title.trim().length == 0){
			alert('제목을 입력하세요.');
		} else if(content == "" || content.trim().length == 0){
			alert('내용을 입력하세요.');
		} else {
			alert('공지사항이 수정되었습니다.');
			var f = document.getElementById('f');
			f.submit();
		}
	}
</script>

<title>하이미디어 도서관 - 정보광장 : 공지사항 수정</title>

<body>
	<c:import url = "/header"/>
	<div class = "noticeFormContainer inner pageContent_mt">
		<c:import url = "/subMenuInfo"/>
		<div class = "noticeFormContent">
			<div class = "notice header">
				<h1>공지사항</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }info/notice">정보광장</a> >
					<a class="checked" href="${context }info/notice">공지사항</a>
				</div>
			</div>
			<div class="noticeContainer">
				<form action="noticeUpdateProc?no=${notice.no }" method="post" id="f" class="noticeUpdate" enctype="multipart/form-data">
					<table class="noticeWriteForm">
						<tr>
							<th>제목</th>
							<td><input type = "text" id = "title" name = "title" value = "${notice.title }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id = "content" name = "content" rows ="20" cols ="15" style = "resize: none">${notice.content }</textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<span name = "oldFileName">${notice.fileName}</span><input type = "file" value = "파일 선택" name = "upfile" onchange="updateFileName(this)">
							</td>
						</tr>
					</table>
					<div class="noticeBtn">
						<input type = "button" value = "수정" onclick="updateChk()" >
						<input type = "button" value = "돌아가기" onclick="location.href='${context }info/noticeContent?no=${notice.no}'">
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/info.js"></script>