<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/admin.css" rel = "stylesheet" type = "text/css">

<script>
	// 팝업 창 크기 설정 함수
	function setPopupSize() {
	    window.resizeTo(1000, 600); // 팝업 창의 가로, 세로 크기
	}
	
	// 페이지 로딩이 완료되면 팝업 창 크기 설정 함수 호출
	window.onload = setPopupSize;
</script>

<div id="loanBookList">
	<form>
		<table class="selectMember">
			<tr>
				<th>책제목</th>
				<th>지은이</th>
				<th>ISBN</th>
				<th>잔여권수/총권수</th>
			</tr>
			<c:choose>
				<c:when test = "${empty list}">
					<tr style = "color:#000; cursor:default">
						<td colspan=4> 조회된 자료가 없습니다. </td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="book" items="${list }">
						<tr>
							<td>${book.bookName}</td>
							<td>${book.authors}</td>
							<td>${book.isbn}</td>
							<td>${book.restVol}/${book.vol}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
</div>

<script>
    function saveSelectedBookInfo(bookInfo) {
        // JSON 형식의 선택한 책 정보를 문자열로 변환하여 쿠키에 저장
        document.cookie = "selectedBookInfo=" + encodeURIComponent(JSON.stringify(bookInfo));
    }
</script>