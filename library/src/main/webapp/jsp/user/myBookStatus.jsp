<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
<title>하이미디어 도서관 - 마이라이브러리 : 회원정보</title>

<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/myLibrary.css" rel = "stylesheet" type = "text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

 </head>   
<body>
	<c:import url = "/header"/>
	<div class = "myLibraryContainer inner pageContent_mt">
		<c:import url = "/subMenuMyLibrary"/>
			<div class = "myLibraryContent">
				<div>
					<h1>회원정보</h1>
					<div class="mb_30 mt_20">
						<a href="/main">HOME</a> > 
						<a href="/adminMember">마이라이브러리</a> >
						<a class="checked" href="/adminMember">대출/예약/연장 현황</a>
					</div>
				</div>
				<div class="RIContainer">
					<div id="myInfoContainer">
					테스트용
					</div>
				</div>
			</div>
			</div>
		
	<c:import url="/footer"/>
</body>