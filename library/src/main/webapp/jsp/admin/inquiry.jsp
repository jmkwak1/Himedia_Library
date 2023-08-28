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
				<form action="" id="f">
					<div class="inquirySearch">
						<select class="inqSelect" name = "select" id="inqSelect" onchange="searchChange()">
							<option <c:if test="${param.select == 'reply'}">selected='selected'</c:if>value="reply">처리상태</option>
							<option <c:if test="${param.select == 'title'}">selected='selected'</c:if>value="title">제목</option>
							<option <c:if test="${param.select == 'writer'}">selected='selected'</c:if>value="writer">작성자</option>
						</select>
						<c:choose>
						    <c:when test="${param.select == 'reply' || param.select == null}">
						        <select class="replySelect" name="replySelect" id="replySelect">
						            <option <c:if test="${param.replySelect == 'N'}">selected='selected'</c:if>value="N">미답변</option>
						            <option <c:if test="${param.replySelect == 'Y'}">selected='selected'</c:if>value="Y">답변완료</option>
						            <option <c:if test="${param.replySelect == 'A'}">selected='selected'</c:if> value="A">전체</option>
						        </select>
						    </c:when>
						    <c:otherwise>
						        <select class="replySelect" name="replySelect" id="replySelect" style="display:none">
						            <option value="N">미답변</option>
						            <option value="Y">답변완료</option>
						            <option value="A">전체</option>
						        </select>
						    </c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test = "${param.select == 'reply' || param.select == null}">
								<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:none">
							</c:when>
							<c:otherwise>
								<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:inline-block">
							</c:otherwise>
						</c:choose>
						<input type = "submit" id="myInquirySearchBtn" value = "검색" onclick="inquirySearch()" >
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
									<td colspan = 5 style = "cursor:default; color:#000;">
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
		if(option == 'title' || option == 'writer'){
			document.getElementById('replySelect').disabled = true;
		} else{	
			document.getElementById('search').disabled=true;
		}
	}
</script>

<<<<<<< HEAD
<script src = "javaScript/admin.js"></script>
=======
<script src = "${context }javaScript/admin.js"></script>
>>>>>>> refs/heads/main
