<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/admin.css" rel = "stylesheet" type = "text/css">
<head>
	<title>하이미디어 도서관 - 관리자 페이지 : 회원관리</title>
		<script src = "/javaScript/admin.js"></script>
</head>

<c:import url = "/header"/>


<body>
	<div class = "adminContainer inner pageContent_mt">
		<c:import url = "/subMenuAdmin"/>
		<div class = "adminContent">
			<div class = "admin header">
				<h1>회원관리</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="/member">관리자페이지</a> >
					<a class="checked" href="/member">회원관리</a>
				</div>
				<div class = "subMenu_member" id = "subMenu_member">
					<ul >
						<li id = "activeLi" class = "admin_menu active" onclick="showMember('memberAuth')">인증 승인/반려</li>
						<li><a href = "#">회원 제재</a></li>
						<li><a href = "#">회원 목록 조회</a></li>
					</ul>
				</div>
			</div>
			<div class="adminMemberContainer">
				<div id = "memberContainer">
					<c:import url = "/admin/memberAuth"/>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
