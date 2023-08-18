<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
    
<title>하이디미어 도서관 - 로그인</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/container.css" rel="stylesheet" type="text/css">
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

<c:import url = "/header"/>
<script src = "dbLibrary.js"></script>
<c:set var="RESTAPIKEY" value="3f70e9cb27d96ef5a414516587c2cb5c"/>
<c:set var="redirectURI" value="http://localhost/kakaoLogin"/>
</head>
<body>
<div class="loginContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>로그인</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="/register">회원정보</a> >
			<a class="checked" href="/login">로그인</a>
		</div>
		<div class="contentBox">
			<div class="loginImgBox">
				<img src="image/loginImg.png" alt="yanolja-logo-gray"> 
			</div>
			<div class="loginFormContainer">
				<form action="loginProc" method="post" class="mb_10" id="f">
					<div class="loginForm">
						<div class="mr_10">
							<label>아이디 </label>
							<input type="text" name="id" placeholder="아이디" class="mb_10" id="id" autofocus="autofocus" value="${sessionScope.savedId}"><br>
							<label>비밀번호 </label>
							<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
						</div>
						<input type="submit" value="로그인" class="loginButton">
					</div>
					<div class="saveIdBox">
						<c:choose>
							<c:when test="${not empty sessionScope.savedId }">
								<input type="checkbox" name="checkbox" id="saveIdBox" checked class="saveId"/>
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="checkbox" id="saveIdBox" class="saveId"/>
							</c:otherwise>
						</c:choose>
						<label>아이디 저장</label>
					</div>
				</form>
				<div class="kakao">
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&
					client_id=<c:out value="${RESTAPIKEY}"/>&
					redirect_uri=<c:out value="${redirectURI}"/>">
						<img class="kakaoLoginBox" src = "https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" />
					</a>
				</div>
				<div class="bottomButtonBox">
					<button class="registerButton" onclick="location.href='register'">회원가입</button>
					<button class="findButton">아이디/비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
</body>


