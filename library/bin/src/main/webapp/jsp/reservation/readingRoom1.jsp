<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="context" value="/" />

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/reservation.css" rel="stylesheet"
	type="text/css">
<title>하이미디어 도서관 - 좌석예약</title>

<script>
	// 메세지 변수를 JavaScript 변수로 변환
	let userCheckMsg = "${userCheckMsg}";
	let reserveMsg = "${reserveMsg}";

	if (userCheckMsg !== "")
		// alert로 메세지 출력
		alert("${sessionScope.name}" + "님은 " + userCheckMsg);
	if (reserveMsg !== "")
		// alert로 메세지 출력
		alert(reserveMsg);

	let sessionId = "";
	if ("${sessionScope.id}" !== null) {
		sessionId = "${sessionScope.id}";
	}

	let userName = "";
	if ("${sessionScope.name}" !== null) {
		userName = "${sessionScope.name}";
	}
</script>
<body>
	<div id="customModal" class="modal">
		<div class="modal-content contentContainer">
			<c:choose>
				<c:when test="${empty mySeat}">
					<div>예약한 좌석이 없습니다.</div>
					<button id="cancelButton">취소</button>
				</c:when>
				<c:otherwise>
					<p class="content">
					<div>열람실 : ${mySeat.room}</div>
					<div>좌석 : ${mySeat.seatId}번</div>
					<div>이름 : ${sessionScope.name}</div>
					</p>
					<div class="buttonBox">
						<button id="leaveButton">퇴실</button>
						<button id="cancelButton">취소</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<c:import url="/header" />
	<div class="reserve_container inner pageContent_mt">
		<div class="reserve_content">
			<div class="reserve_top">
				<h1>열람실 좌석 예약</h1>
				<div class="subMenu_reserve">
					<ul>
						<li class="room_menu active"><a
							href="${context}reservation/readingRoom1">자율학습실1</a></li>
						<li class="room_menu"><a
							href="${context}reservation/readingRoom2">자율학습실2</a></li>
						<li class="room_menu"><a href="">스터디룸</a></li>
					</ul>
				</div>
			</div>
			<div class="RIContainer">
				<div id="room_container">
					<div class="reserve_menu mb_30 mt_20">
						<div class="whichRoom">
							자율 학습실1<br> <span>96석</span>
						</div>
						<div style="background-color: #338cfa; color: white">
							빈좌석<br> <span class="empty_seat"></span> 석
						</div>
						<div class="seat_status using">
							사용중<br> <span class="using_seat"></span> 석
						</div>
						<div class="seat_status mine">
							내 좌석<br>정보
							<!-- <br> <span class="my_seat"></span> -->
						</div>
						<!-- <div>대기자<br>96석</div> -->
					</div>
					<div class="room_container">
						<div class="seat_division">
							<c:forEach var="i" begin="1" end="96" step="8">
								<div class="line">
									<div class="seat_left">
										<ul>
											<li class="each_seat" data-room="R1" data-seat="${i}"><span>${i}</span></li>
											<li class="each_seat" data-room="R1" data-seat="${i+1}"><span>${i+1}</span></li>
											<li class="each_seat" data-room="R1" data-seat="${i+2}"><span>${i+2}</span></li>
											<li class="each_seat" data-room="R1" data-seat="${i+3}"><span>${i+3}</span></li>
										</ul>
									</div>
									<div class="seat_right">
										<ul>
											<li class="each_seat" data-room="R1" data-seat="${i+4}"><span>${i+4}</span></li>
											<li class="each_seat" data-room="R1" data-seat="${i+5}"><span>${i+5}</span></li>
											<li class="each_seat" data-room="R1" data-seat="${i+6}"><span>${i+6}</span></li>
											<li class="each_seat" data-room="R1" data-seat="${i+7}"><span>${i+7}</span></li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${context }javaScript/reservation.js"></script>
	<c:import url="/footer" />
</body>
