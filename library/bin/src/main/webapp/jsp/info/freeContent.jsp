<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/info.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 정보광장 : 자유게시판</title>

<script>
	function delFree() {
		if (confirm('해당 게시글을 삭제하시겠습니까?') == true) {
			alert('게시글이 삭제되었습니다.');
			location.href = 'freeDelete?no=${free.no}';
		}
	}
	
</script>

<body>
	<c:import url = "/header"/>
	<div class="infoContainer inner mb_30" >
	<c:import url = "/subMenuInfo"/>
	<div class="infoContent">
		<h1>자유게시판</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="${context }info/notice">정보광장</a> >
			<a class="checked" href="${context }info/free">자유게시판</a>
		</div>
		<div class="freeInfo" style = "margin-top:0">
			- 자유게시판의 글쓰기는 하이미디어 도서관 회원만이 가능하며, 도서관과 무관한 내용, 비실명, 저속한 표현, 타인의 명예훼손,<br>&nbsp;&nbsp;반사회적인 글 등은 예고없이 삭제됨을 알려드립니다.<br><br>
			- 주민등록번호, 연락처 등 개인정보를 등록할 경우 본인 및 제3자에게 피해를 입을 수 있사오니, 소중한 개인정보가 노출되지 않도록<br>&nbsp;&nbsp;주의를 기울여 주시기 바랍니다.<br><br>
			- 내용은 1,000자 이내로 작성 가능합니다. 긴글 작성 시 내용이 유실되지 않도록 메모장 등을 활용하여 주시기 바랍니다.
		</div>
			<div class="freeContainer">
				<table class="freeContentForm">
					<tr>
						<th>제목</th>
						<td colspan="2">${free.title}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${free.writer }</td>
						<th class="right">작성일</th>
						<td width="200">${free.writeDate}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2">${free.content}</td>
					</tr>
				</table>
				<form action="replyWriteProc?no=${free.no }" class="replyContentForm" id = "replyContentForm" method="post">
					<table class="reply">
						<tr><td>댓글</td></tr>
						<c:choose>
							<c:when test = "${empty replies}">
								<tr>
									<td style = "cursor:default; color:#000; text-align:center">
										댓글이 없습니다.<br>
										첫 댓글을 작성해 보세요.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="reply" items = "${replies}">
									<tr>
										<td>
											<span>${reply.writer }&nbsp;&nbsp;${reply.writeDate }</span><br>
											<textarea style = "resize: none; height:auto; border:none; padding:5 0 0 0;" readonly="readonly">${reply.content }</textarea>
										</td>
										<c:if test = "${sessionScope.id eq reply.writer }">
											<td align="right">
												<input type = "button" value = "삭제" onclick="location.href='replyDelete?no=${reply.no}&freeNo=${free.no}'">
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="freeReply">
						<textarea id = "reply" name = "reply" rows ="2" cols ="15" style = "resize: none; text-align:left;" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
						<input type = "button" value = "댓글등록" onclick="replyChk()">
					</div>
				</form>
				<div class="freeBtn">
					<c:choose>
						<c:when test = "${sessionScope.id eq free.writer}">
							<input type = "button" value = "목록" onclick="location.href='free'">
							<input type = "button" value = "수정" onclick="location.href='freeUpdate?no=${free.no}'">
							<input type = "button" value = "삭제" onclick="delFree()">
						</c:when>
						<c:when test = "${sessionScope.status == 'M' }">
							<input type = "button" value = "목록" onclick="location.href='free'">
							<input type = "button" value = "삭제" onclick="delFree()">
						</c:when>
						<c:otherwise>
							<input type = "button" value = "목록" onclick="location.href='free'">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
	<script src = "${context }javaScript/info.js"></script>
</body>