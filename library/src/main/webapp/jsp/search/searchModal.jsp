<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="context" value="/" />
<link href="${context}css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/search.css" rel="stylesheet" type="text/css">

<body>
	<div id="searchModal" class="modal">
		<div class="modal-content contentContainer">
			<p class="content">
			내용
			</p>
			<div class="buttonBox">
				<button id="loanButton">대여 예약</button>
				<button id="cancelButton">취소</button>
			</div>

		</div>
	</div>

</body>


