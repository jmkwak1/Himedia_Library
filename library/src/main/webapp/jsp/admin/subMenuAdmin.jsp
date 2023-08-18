<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="css/subMenu.css" rel="stylesheet" type="text/css">
<c:url var="context" value="/"/>

<div class = "subMenu">
	<h2>관리자페이지</h2>
	<ul>
		<li><a href="${context }admin/member" class="button" id="subMember">회원관리</a></li>
		<li><a href="/login" class="button" id="subBook">도서관리</a></li>
		<li><a href="/login" class="button" id="subPro">프로그램관리</a></li>
		<li><a href="/login" class="button" id="subRoom">열람실관리</a></li>
		<li><a href="/login" class="button" id="subPay">결제관리</a></li>
		<li><a href="${context }admin/inquiry" class="button" id="subInquiry">문의관리</a></li>
	</ul>
</div>


