<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<link href="/css/subMenu.css" rel="stylesheet" type="text/css">
<c:url var="context" value="/"/>
<div class = "subMenu subMyLibrary">
	<h2>마이라이브러리</h2>
	<ul>
		<li class="submyLibrary_menu" id="subMyBookStatus"><a href="/myLibrary/myBookStatus">대출/예약/연장 현황</a></li>
		<li class="submyLibrary_menu" id="subMyLoanHistory"><a href="/myLibrary/myLoanHistory">대출이력조회</a></li>
		<li class="submyLibrary_menu" id="subMyProgram"><a href = "/myLibrary/myProgram">문화행사 현황</a></li>
		<li class="submyLibrary_menu" id="subMyPay"><a href = "/myLibrary/myPay">결제 관리</a></li>
		<li class="submyLibrary_menu" id="subMyInquiry"><a href="/myLibrary/myInquiry">1:1문의</a></li>
		<li class="submyLibrary_menu" id="subMyInfo"><a href="/myLibrary/myInfo">회원정보</a></li>
	</ul>
</div>
<script src="${context }javaScript/subMyLibrary.js"></script>

