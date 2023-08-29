<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:url var="context" value="/"/>
<link href="${context }css/subMenu.css" rel="stylesheet" type="text/css">
<div class = "subMenu subMyLibrary">
	<h2>자료 검색</h2>
	<ul>
		<li class="submyLibrary_menu" id="subTotalSearch"><a href="${context }datasearch/totalSearch">통합검색</a></li>
		<li class="submyLibrary_menu"><a>고급검색</a></li>
		<li class="submyLibrary_menu"><a>자료탐색</a></li>
		<li class="submyLibrary_menu"><a>스마트 도서관 검색</a></li>
		<li class="submyLibrary_menu"><a>연속간행물</a></li>
		<li class="submyLibrary_menu"><a>큐레이션</a></li>
	</ul>
</div>


