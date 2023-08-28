<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">

<title>하이디미어 도서관 - 회원가입</title>
<c:import url = "/header"/>

<style>
	.info {margin:40px 0; padding:20px; border:1px solid #ddd; font-size:17px; line-height:145%;}
	input[type="button"] {position:relative; left:35%; width: 270px; padding:18px; cursor: pointer; font-size:20px;}
</style>


<div class="RegisterContainer inner mb_30" >
	<c:import url = "/subMenuLogin"/>
	<div class="loginContent">
		<h1>회원가입</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > 
			<a href="/register">회원정보</a> >
			<a class="checked" href="/register">회원가입</a>
		</div>
		<div class="register">
			<div class="regProcess">
				<span>회원유형</span> <p>></p>
				<span>약관동의</span> <p>></p>
				<span>본인확인</span> <p>></p>
				<span>정보입력</span> <p>></p>
				<span class="active">가입완료</span>
			</div>
		</div>
		<div>
			<h2>도서관 이용 안내</h2>
			<div class="info">
				<h4 style = "font-size:20px;">회원 종류 및 이용 서비스</h4><br>
				* 준회원<br>
				- 취득방법 : 도서관 홈페이지에서 회원 가입<br>
				- 이용가능 서비스 : 자율학습실 및 디지털자료실 좌석 예약<br><br>
				* 정회원<br>
				- 취득방법<br>
				　· 홈페이지 회원 가입(준회원) → 자료실 직원에게 필요 서류 제시(방문 가입 시 필요 서류는 아래 참고)<br>
				- 이용가능 서비스 : 위 준회원 서비스 외 자료 대출·예약, 구입희망도서 신청, 책바다 등<br><br>
				* 방문 가입 시 필요 서류 (※ 홈페이지 회원가입 완료 후 필요 서류 제시)<br>
				- 어린이 : 현재 주소가 기재된 주민등록등본<br>
				※ 부모님 대리신청 시 : 부모님 신분증, 가족관계 증빙서류(주민등록등본, 의료보험증 등)<br><br>
				- 중·고등학생 : 학생증(주소 미기재 시 주민등록등본 함께 제시)<br>
				- 성인 : 현재 주소가 기재된 신분증(주민등록증, 운전면허증, 주민등록등본 등)<br>
				　· 서울시 소재 직장에 재직 중인 타시도 거주자 : 현주소가 기재된 신분증, 재직증명서<br>
				　· 서울시 소재 학교에 재학 중인 타시도 거주자 : 현주소가 기재된 신분증, 재학증명서<br>
				　· 외국인 : 국내거소신고증 또는 외국인등록증<br>
			</div>
			<h2 align="center">회원가입이 완료되었습니다.</h2>
			<div class="info" style = "text-align:center";>
				아래의 내용을 확인해 주시기 바랍니다.<br>
				${sessionScope.name}님의 아이디는 ${sessionScope.id}입니다.<br>
				이메일은 ${sessionScope.email}입니다.
			</div>
			<input type = "button" value = "확인" onclick = "location.href='/main'">
		</div>
	</div>
</div>
<c:import url="/footer"/>
