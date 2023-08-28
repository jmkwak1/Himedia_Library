<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
<title>하이미디어 도서관 - 마이라이브러리 : 열람실 좌석 예약</title>

<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/reservation.css" rel = "stylesheet" type = "text/css">
<!-- <script src = "/javaScript/reservation.js"></script> -->
</head>   
<body>
	<c:import url = "/header"/>
	<div class = "reserve_container inner pageContent_mt">
			<div class = "reserve_content">
				<div class="reserve_top">
					<h1>열람실 좌석 예약</h1>
					<div class = "subMenu_reserve">
						<ul>
						    <li class="room_menu" onclick="showInfo('readingRoom1')">자율학습실1</li>
						    <li class="room_menu" onclick="showInfo('readingRoom2')">자율학습실2</li>
						    <li class="room_menu" onclick="showInfo('studyRoom')">스터디룸</li>
						  </ul>
					</div>
				</div>
				<div class="RIContainer">
					<div id="room_container">
						<c:import url="/reservation/readingRoom1"/>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/footer"/>

	<script src = "javaScript/reservation.js"></script>
</body>