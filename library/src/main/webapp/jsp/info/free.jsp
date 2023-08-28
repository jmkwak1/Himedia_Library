<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:url var="context" value="/"/>
    <head>
    
<title>하이디미어 도서관 - 정보광장 : 자유게시판</title>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/info.css" rel="stylesheet" type="text/css">

<c:import url = "/header"/>
</head>
<body>
<div class="infoContainer inner mb_30" >
	<c:import url = "/subMenuInfo"/>
	<div class="infoContent">
		<h1>자유게시판</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="${context }info/notice">정보광장</a> >
			<a class="checked" href="${context }info/free">자유게시판</a>
		</div>
		<div class="freeInfo">
			- 자유게시판의 글쓰기는 하이미디어 도서관 회원만이 가능하며, 도서관과 무관한 내용, 비실명, 저속한 표현, 타인의 명예훼손, 반사회적인 글 등은<br>&nbsp;&nbsp;예고없이 삭제됨을 알려드립니다.<br><br>
			- 주민등록번호, 연락처 등 개인정보를 등록할 경우 본인 및 제3자에게 피해를 입을 수 있사오니, 소중한 개인정보가 노출되지 않도록 주의를 기울여<br>&nbsp;&nbsp;주시기 바랍니다.<br><br>
			- 내용은 1,000자 이내로 작성 가능합니다. 긴글 작성 시 내용이 유실되지 않도록 메모장 등을 활용하여 주시기 바랍니다.
		</div>
		<div class="contentBox">
			<div class="freeContainer">
				<form action="" id="f">
					<div class="condition">
						<select class="noticeSelect" name = "select" id="freeSelect" onchange="searchChange()">
							<option <c:if test="${param.select == ''}">selected='selected'</c:if>value="">선택</option>
							<option <c:if test="${param.select == 'title'}">selected='selected'</c:if>value="title">제목</option>
							<option <c:if test="${param.select == 'content'}">selected='selected'</c:if>value="content">내용</option>
							<option <c:if test="${param.select == 'writer'}">selected='selected'</c:if>value="writer">작성자</option>
						</select>
						<input type = "text" placeholder = "검색어를 입력하세요." id="search" name="search">
						<input type = "button" value = "검색" id ="searchBtn" onclick="freeSearch()">
					</div>
					<table class="free">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:choose>
							<c:when test = "${empty frees}">
								<tr>
									<td colspan = 5 style = "cursor:default; color:#000;">
										조회된 게시글이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="free" items = "${frees}">
									<tr onclick="location.href='freeContent?no=${free.no}'">
										<td>${free.no}</td>
										<td>${free.title }
											<c:if test = "${free.replies > 0}"> (${free.replies })</c:if>
										</td>
										<td>${free.writer }</td>
										<td>${free.writeDate }</td>
										<td>${free.hits }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<c:if test = "${sessionScope.id != null }">
						<div class="writeBtn">
							<input type = "button" value = "글쓰기" onclick="location.href='freeWriteForm'">
						</div>
					</c:if>
					<div class="freePage">
						${result }
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/info.js"></script>


