<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/myLibrary.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 마이라이브러리 : 1:1문의</title>

<body>
<c:import url = "/header"/>
	<div class = "adminContainer inner pageContent_mt">
	<c:import url = "/subMenuMyLibrary"/>
		<div class = "adminContent">
			<div class = "admin header">
				<h1>1:1문의</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }myLibrary">마이라이브러리</a> >
					<a class="checked" href="${context }myLibrary/myInquiry">1:1문의</a>
				</div>
			</div>
			<div class="inquiryContainer">
				<form action="" id="f">
					<div class="inquirySearch">
						<select class="inqSelect" name = "select" id="inqSelect" onchange="searchChange()">
							<option <c:if test="${param.select == 'reply'}">selected='selected'</c:if>value="reply">처리상태</option>
							<option <c:if test="${param.select == 'title'}">selected='selected'</c:if>value="title">제목</option>
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
					       <c:when test = "${param.select == 'reply' || param.select == null }">
							   <input type = "text" name = "search" id = "search" placeholder = "검색어를 입력하세요" style = "display:none">
						   	</c:when>
						   	<c:otherwise>
							   <input type = "text" name = "search" id = "search" placeholder = "검색어를 입력하세요" style = "display:inline-block">
						   	</c:otherwise>
					</c:choose>
						<input type = "submit" id="myInquirySearchBtn" value = "검색" onclick="inquirySearch()" >
					</div>
					<table class="inquiry">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>처리상태</th>
							<th>작성일</th>
						</tr>
						<c:choose>
							<c:when test = "${empty inquiries}">
								<tr>
									<td colspan = 4 style = "cursor:default; color:#000;">
										등록한 문의가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="inquiry" items = "${inquiries}">
									<tr onclick = "location.href='${context }myLibrary/myInquiryContent?rn=${inquiry.rn}'">
										<td>${inquiry.rn}</td>
										<td>${inquiry.title }</td>
										<td>
											<c:if test = "${inquiry.reply == 'N' }">
												미답변
											</c:if>
											<c:if test = "${inquiry.reply == 'Y' }">
												답변완료
											</c:if>
										</td>
										<td>${inquiry.writeDate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
						</c:choose>
					</table>
					<div class="inquiryBtn">
						<input type = "button" value = "글쓰기" onclick="location.href='${context }myLibrary/myInquiryWriteForm'">
					</div>
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
		var inqSelect = document.getElementById('inqSelect');
		var select = document.getElementById('inqSelect').options.selectedIndex;
		var option = inqSelect.options[select].value;
		var replySelect = document.getElementById('replySelect').value;
		if(option == 'title'){
			document.getElementById('replySelect').disabled = true;
		} else {
			document.getElementById('search').disabled=true;
		}
	}
</script>
