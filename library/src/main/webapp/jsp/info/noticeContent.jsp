<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="context" value="/" />

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/info.css" rel="stylesheet" type="text/css">

<title>하이미디어 도서관 - 정보광장 : 공지사항</title>

<script>
	function delNotice() {
		if (confirm('해당 공지사항을 삭제하시겠습니까?') == true) {
			alert('공지사항이 삭제되었습니다.');
			location.href = 'noticeDelete?no=${notice.no}';
		}
	}
</script>

<body>
	<c:import url="/header" />
	<div class="infoContainer inner pageContent_mt">
		<c:import url="/subMenuInfo" />
		<div class="infoContent">
			<h1>공지사항</h1>
			<div class="info_title">
				<p>여러분의 소중한 공간 하이미디어도서관 정보광장입니다.</p>
			</div>
			<div class="mb_30 mt_20">
				<a href="/main">HOME</a> > <a href="${context }info/notice">정보광장</a>
				> <a class="checked" href="${context }info/notice">공지사항</a>
			</div>
			<div class="noticeContainer">
				<table class="noticeContentForm">
					<tr>
						<th>제목</th>
						<td>${notice.title}</td>
					</tr>
					<tr>
						<th>첨부파일</th>
							<c:choose>
								<c:when test = "${notice.fileName == '첨부파일 없음' }">
									<td width="500">첨부파일이 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td width="500" onclick="location.href='noticeFileDownload?no=${notice.no}'" style="cursor:pointer">${notice.fileName }</td>
								</c:otherwise>
							</c:choose>
						<th class="reply">작성일</th>
						<td width="400">${notice.writeDate}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><p>${notice.content}</p></td>
					</tr>
				</table>
				<div class="noticeBtn">
					<c:if test = "${sessionScope.status == 'M'}">
						<input type="button" value="수정" onclick="location.href='noticeUpdate?no=${notice.no}'">
						<input type="button" value="삭제" onclick="delNotice()">
					</c:if>
					<input type="button" value="목록" onclick="location.href='notice'">
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer" />
</body>
<script src = "${context }javaScript/info.js"></script>