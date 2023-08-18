<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/admin.css" rel = "stylesheet" type = "text/css">
<link href = "css/myLibrary.css" rel = "stylesheet" type = "text/css">

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
					<a href="/admin/member">관리자페이지</a> >
					<a class="checked" href="/admin/inquiry">1:1문의</a>
				</div>
			</div>
			<div class="inquiryContainer">
				<form action="" id="f">
					<div class="inquirySearch">
						<select class="inqSelect" name = "select" id="inqSelect" onchange="searchChange()">
							<option value="reply">처리상태</option>
							<option value="title">제목</option>
						</select>
						<select class = "replySelect" name = "replySelect" id = "replySelect">
							<option value = "N">미답변</option>
							<option value = "Y">답변완료</option>
						</select>
						<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:none">
						<input type = "button" id="myInquirySearchBtn" value = "검색" onclick="inquirySearch()" >
					</div>
					<table class="inquiry">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>처리상태</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						<c:choose>
							<c:when test = "${empty inquiries}">
								<tr>
									<td colspan = 5>
										등록한 문의가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="inquiry" items = "${inquiries}">
									<tr onclick="location.href='inquiryContent?no=${inquiry.no}'">
										<td>${inquiry.no}</td>
										<td>${inquiry.title }</td>
										<td>
											<c:if test = "${inquiry.reply == 'N' }">
												미답변
											</c:if>
											<c:if test = "${inquiry.reply == 'Y' }">
												답변완료
											</c:if>
										</td>
										<td>${inquiry.id }</td>
										<td>${inquiry.writeDate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="inquiryPage">
						${result }
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script>
	function searchChange(){
		var inqSelect = document.getElementById('inqSelect');
		var select = document.getElementById('inqSelect').options.selectedIndex;
		var option = inqSelect.options[select].value;
		if(option == "reply"){
			document.getElementById('search').style.display='none';
			document.getElementById('replySelect').style.display='inline-block';
		} else {
			document.getElementById('search').style.display='inline-block';
			document.getElementById('replySelect').style.display='none';
		}
	}
	
	/*submit 시 parameter 안 넘어가게 조절함(disabled)*/
	function inquirySearch(){ 
		const myInquirySearchBtn = document.getElementById('myInquirySearchBtn');
		var inqSelect = document.getElementById('inqSelect');
		var select = document.getElementById('inqSelect').options.selectedIndex;
		var option = inqSelect.options[select].value;
		
		var replySelect = document.getElementById('replySelect');
		console.log(option)
		if(option == 'title'){
			document.getElementById('replySelect').disabled = true;
		} else {
			document.getElementById('search').disabled=true;
		}
			f.submit();
	}
</script>

<script src = "javaScript/admin.js"></script>