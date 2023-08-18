<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="css/header.css" rel="stylesheet" type="text/css">
    <c:url var="context" value="/"/>
    <script>
    	function header(){
    		var id = "${sessionScope.id}";
  			var status = "${sessionScope.status}"
			var mainNav = document.querySelector(".main_nav");
  			var mainNavLi = document.querySelectorAll(".left li");
  			if(id != ''){
  				for (var i = 0; i < mainNavLi.length; i++) {
  				    var liElement = mainNavLi[i];
  				    liElement.style.height = "45px";
  				    liElement.style.lineHeight = "45px";
  				}
  				mainNav.style.marginTop = "-7px";
  				document.getElementById('welcome').style.display = 'block';
  				document.getElementById('welcome').style.height = '30px';
  				document.getElementById('welcome').style.lineHeight = '30px';
  				document.getElementById('login').style.display = 'none';
  				document.getElementById('register').style.display = 'none';
  				document.getElementById('logout').style.display = 'table-cell';
  				document.getElementById('myLibrary').style.display = 'table-cell';
  				document.getElementById('notify').style.display = 'table-cell';
  				if(status == 'M'){
	  				document.getElementById('myLibrary').style.display = 'none';
	  				document.getElementById('adminForm').style.display = 'table-cell';
  				}
  			}
    }
    </script>
</head>
<body onload="header()">
	<div id="top_container">
	    <div class="container" id = "container">
	            <div class="logo">
	                <a href="${context}main"><img src="image/LOGO.png"></a>
	            </div>
	            <div class="main_search">
	                <form action="${context}search" method="post">
	                    <input type="text" name="query" placeholder="검색어를 입력하세요">
	                    <button type="submit">
	                        <img src="image/search.png" width="25" height="25">
	                    </button>
	                </form>
	            </div>
	            <div class="main_nav">
	            	<div id="welcome" style = "display:none" align="right" >${sessionScope.id }님 환영합니다.</div>
	                <ul class="left">
	                    <li><a href="${context}main">메인</a></li>
	                    <li id="login" ><a href="${context}login">로그인</a></li>
	                    <li id="register"><a href="${context}register">회원가입</a></li>
	                    <li id="myLibrary" style = "display:none"><a href="${context}myLibrary/myBookStatus">마이라이브러리</a></li>
	                    <li id="adminForm" style = "display:none"><a href="${context}admin/member">관리자페이지</a></li>
	                    <li id="logout" style = "display:none"><a href="${context}logout">로그아웃</a></li>
	                    <li id="notify" class="notify"  style="display:none" aria-haspopup="true" aria-expanded="false" onclick="toggleMenu()">
	                    	<img src = "/image/notifications.png">
	                    </li>
	                </ul>
                   	<div id = "notification" class="notification" role = "menu" aria-hidden="true" >
	                    <div>
					        <div role="menuitem">
				        		<c:import url = "/notification"/>
					        </div>
                   		</div>
                   	</div>
	            </div>
	    </div>
	    <div class="header_nav">
	        <ul class="inner">
	            <li><a href="${context}index">도서관 소개</a>
	            	<ul class="toggleBox">
						<li><a href="#" class="menu">도서관현황</a></li>
						<li><a href="#" class="menu">도서관이용안내</a></li>
						<li><a href="#" class="menu">자료실 안내</a></li>
						<li><a href="#" class="menu">오시는 길/주차안내</a></li>
					</ul>
	            </li>
	            <li><a href="${context}recom">추천자료</a>
	            	<ul class="toggleBox">
						<li><a href="#" class="menu">추천도서</a></li>
						<li><a href="#" class="menu">인기자료</a></li>
					</ul>
	            </li>
	            <li><a href="${context}datasearch">자료검색</a>
	            	<ul class="toggleBox">
						<li><a href="#" class="menu">통합검색</a></li>
						<li><a href="#" class="menu">고급검색</a></li>
						<li><a href="#" class="menu">자료탐색</a></li>
						<li><a href="#" class="menu">스마트도서관검색</a></li>
						<li><a href="#" class="menu">연속간행물</a></li>
						<li><a href="#" class="menu">큐레이션</a></li>
					</ul>
	            </li>
	            <li><a href="${context}reservation">좌석예약</a>
	            	<ul class="toggleBox">
						<li><a href="#" class="menu">자율학습실1</a></li>
						<li><a href="#" class="menu">자율학습실2</a></li>
						<li><a href="#" class="menu">스터디룸</a></li>
					</ul>
	            </li>
	            <li><a href="${context}cultural">문화행사</a>
	            	<ul class="toggleBox">
						<li><a href="#" class="menu">문화행사 신청</a></li>
						<li><a href="#" class="menu">문화행사 결과</a></li>
						<li><a href="#" class="menu">한 주제 함께 읽기</a></li>
					</ul>
	            </li>
	            <li><a href="${context}info">정보광장</a>
	            	<ul class="toggleBox">
						<li><a href="#" class="menu">공지사항</a></li>
						<li><a href="#" class="menu">자주하는 질문</a></li>
						<li><a href="#" class="menu">자유게시판</a></li>
						<li><a href="#" class="menu">자원봉사 안내</a></li>
					</ul>
	            </li>
	        </ul>
	    </div>
    </div>
    <script src = "javaScript/header.js"></script>
</body>
</html>
