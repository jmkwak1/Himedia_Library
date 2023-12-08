<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--항상 최신버전의 제이쿼리를 사용한다-->
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context }css/home.css" rel="stylesheet" type="text/css">

<title>하이미디어 도서관</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	// 메세지 변수를 JavaScript 변수로 변환
	var message = "${msg}";
	var updateMsg = "${updateMsg}";

	if (message !== "")
		// alert로 메세지 출력
		alert(message);
	if (updateMsg !== "")
		// alert로 메세지 출력
		alert(updateMsg);
</script>

<script>
	$(document).ready(function() {

		$('#loading').hide();
		$('#trans').submit(function() {
			$('#loading').show();
			return true;
		});
	});
</script>
</head>
<body class="mainController">
	<!--로딩바-->
	<div id="loading" style="margin-left: 0px;">
		<img src="/image/loadingImg.gif">
		<p>변환중입니다..잠시기다려주세요.</p>
	</div>
	<c:import url="/header" />
	<div class="homeContainer">
		<div class="visual">
			<div class=" inner">
				<div class="content left">
					<div class="popularBook">
						<div class="iconContainer">
							<div class="iconBox">
								<img src="/image/popBook.png" />
							</div>
							<span>인기도서</span>
						</div>
						<div class="bookContainer">
							<c:forEach var="bookInfo" items="${popularBook}" varStatus="loop">
								<c:if test="${loop.index < 4}">
									<div class="bookImageBox" onclick="location.href='/datasearch/bookDetail?isbn=${bookInfo.isbn}'">
										<img src="${bookInfo.bookImageURL}">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>

				</div>
				<div class="content right">
					<div class="newBook">
						<div class="iconContainer">
							<div class="iconBox">
								<img src="/image/newBook.png" />
							</div>
							<span>신착도서</span>
						</div>
						<div class="bookContainer">
							<c:forEach var="bookInfo" items="${recentBook}" varStatus="loop">
								<c:if test="${loop.index < 4}">
									<div class="bookImageBox" onclick="location.href='/datasearch/bookDetail?isbn=${bookInfo.isbn}'">
										<img src="${bookInfo.bookImageURL}">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="condition">
			<div class="inner">
				<div class="notice">
					<div class="noticeTitle">공지사항</div>
					<ul class="noticeList">
						<c:choose>
							<c:when test="${empty notices }">
								<li>등록된 공지사항이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${notices }">
									<li
										onclick="location.href='/info/noticeContent?no=${notice.no}'">${notice.title }</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="schedule">
					<div class="closedNotice">휴관일 안내</div>
					<div class="closedTitle">
						휴관일은 매주 <b>월요일</b>과 <b>법정 공휴일</b> 입니다.
					</div>
					<div class="closedDay">
						<div class="prevMonth">
							<div>
								<b>8월</b> 휴관일
							</div>
							<ul>
								<li><span>7</span></li>
								<li><span>14</span></li>
								<li><span>15</span></li>
								<li><span>21</span></li>
							</ul>
							<ul>
								<li><span>18</span></li>
								<li><span></span></li>
								<li><span></span></li>
								<li><span></span></li>
							</ul>
						</div>
						<div class="thisMonth">
							<div>
								<b>9월</b> 휴관일
							</div>
							<ul>
								<li><span>4</span></li>
								<li><span>11</span></li>
								<li><span>18</span></li>
								<li><span>25</span></li>
							</ul>
							<ul>
								<li><span>28</span></li>
								<li><span>29</span></li>
								<li><span>30</span></li>
								<li><span></span></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="readingRoom">
					<div class="readingRoomTitle">열람실 현황</div>
					<div class="restSeat">금일 열람실 현황(잔여 좌석수)</div>
					<div class="roomStatus">
						<ul>
							<li onclick="headerReseve(1,'${sessionScope.closedRoom}')"><span>1열람실</span>
								<div>${R1Seat}석</div></li>
							<li onclick="headerReseve(2,'${sessionScope.closedRoom}')"><span>2열람실</span>
								<div>${R2Seat}석</div></li>
							<li onclick="headerReseve('${sessionScope.closedRoom}')"><span>스터디룸</span>
								<div>0석</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer" />
</body>

</html>