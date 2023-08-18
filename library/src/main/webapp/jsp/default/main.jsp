<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/home.css" rel="stylesheet" type="text/css">

<title>하이미디어 도서관</title>

<script>
        // 메세지 변수를 JavaScript 변수로 변환
        var message = "${msg}";
        var updateMsg = "${updateMsg}";
        
        if(message !== "")
        // alert로 메세지 출력
        	alert(message);
        if(updateMsg !== "")
        // alert로 메세지 출력
        	alert(updateMsg);
    </script>
</head>
<body class = "mainController">
	<c:import url = "/header"/> 
		<div class = "homeContainer">
			<div class="visual" >
				<div class=" inner">
					<div class="content left">
					왼쪽
					</div>
					<div class="content right">
					오른쪽
					</div>
				</div>
			
			</div>
			<div class="condition">
				<div class="inner">
					<div class="announcement">공지사항</div>
					<div class="schedule">도서관 일정</div>
					<div class="readingRoom">열람실 현황</div>
				</div>
			</div>
		</div>
	<c:import url="/footer"/>
</body>

</html>