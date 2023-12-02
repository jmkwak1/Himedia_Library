<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<link href="${context }css/subMenu.css" rel="stylesheet" type="text/css">

<div class = "subMenu">
	<h2>문화행사</h2>
	<ul>
		<li><a href="${context}cultural" class="button" id="cultural">문화 행사 안내</a></li>
		<li><a href="${context}cullist" class="button" id="cullist">문화 행사 목록</a></li>
		<li><a href="${context}culResult" class="button" id="culResult">문화 행사 결과</a></li>
		<li><a href="#" class="button">한 주제 함께 읽기</a></li>
	</ul>
</div>

<script src="${context }javaScript/subMenu.js"></script>

