<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/reservation.css" rel = "stylesheet" type = "text/css">

<body>
	<div class="pop_container">
		<div class="pop_inner">
			<div class="pop_logo"><img src="/image/LOGO.png"/></div>
			<div class="pop_contentBox">
				<h2>열람실 예약</h2>
				<form action="reserveProc" method="post" id="f">
					<div>
						<label for = "name">이름 : </label>
						<span id ="name">${sessionScope.name}</span><br>
						
						<label for = "id">아이디 : </label>
						<span id ="id">${sessionScope.id}</span><br>
						
						<label for = "room">열람실 : </label>
						<span id = "room">${param.room}</span><br>
						
						<label for = "seat">좌석 번호 : </label>
						<span id = "seat">${param.seatId} 번</span><br>
					</div>
					<div class="pop_BtnBox">
						<input type="button" class="reserveBtn" value="예약" onclick="reserveSubmit()">
						<input type="button" class="popCancelBtn" value="취소" onclick="closePopUp()"><br>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/javaScript/reservation.js"></script>
</body>
