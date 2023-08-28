<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<link href="${context }css/subMenu.css" rel="stylesheet" type="text/css">

<div class = "subMenu">
	<h2>관리자페이지</h2>
	<ul>
		<li><a href="${context }admin/member" class="button" id="subMember">회원관리</a></li>
		<li><a href="${context }admin/book" class="button" id="subBook">대출관리</a></li>
		<li><a href="${context }admin/program" class="button" id="subProgram">프로그램관리</a></li>
		<li><a href="${context }admin/room" class="button" id="subRoom">열람실관리</a></li>
		<li><a href="${context }admin/pay" class="button" id="subPay">결제관리</a></li>
		<li><a href="${context }admin/inquiry" class="button" id="subInquiry">1:1문의</a></li>
	</ul>
</div>


