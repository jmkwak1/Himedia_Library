<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href = "${context }css/main.css" rel = "stylesheet" type = "text/css">
<link href = "${context }css/admin.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 관리자 페이지 : 결제관리</title>

<body>
<c:import url = "/header"/>
	<div class = "adminContainer inner pageContent_mt">
	<c:import url = "/subMenuAdmin"/>
		<div class = "adminContent">
			<div class = "admin header">
				<h1>결제관리</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > 
					<a href="${context }admin/member">관리자페이지</a> >
					<a class="checked" href="${context }admin/pay">결제관리</a>
				</div>
			</div>
			<div class="payContainer">
				<form action="" id="f">
					<div class="paySearch">
						<select class="paySelect" name = "select" id="paySelect" onchange="searchChange()">
							<option <c:if test="${param.select == 'pay'}">selected='selected'</c:if>value="pay">결제상태</option>
							<option <c:if test="${param.select == 'id'}">selected='selected'</c:if>value="id">아이디</option>
							<option <c:if test="${param.select == 'name'}">selected='selected'</c:if>value="name">이름</option>
						</select>
						<c:choose>
						    <c:when test="${param.select == 'pay' || param.select == null}">
						        <select class="payDetailSelect" name="payDetailSelect" id="payDetailSelect">
						            <option <c:if test="${param.payDetailSelect == 'N'}">selected='selected'</c:if>value="N">미납</option>
						            <option <c:if test="${param.payDetailSelect == 'Y'}">selected='selected'</c:if>value="Y">납부</option>
						            <option <c:if test="${param.payDetailSelect == 'O'}">selected='selected'</c:if> value="O">연체</option>
						            <option <c:if test="${param.payDetailSelect == 'T'}">selected='selected'</c:if> value="T">전체</option>
						        </select>
						    </c:when>
						    <c:otherwise>
						        <select class="payDetailSelect" name="payDetailSelect" id="payDetailSelect" style="display:none;">
						            <option value="N">미납</option>
						            <option value="Y">납부</option>
						            <option value="O">연체</option>
						            <option value="T">전체</option>
						        </select>
						    </c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test = "${param.select == 'pay' || param.select == null}">
								<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:none">
							</c:when>
							<c:otherwise>
								<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:inline-block">
							</c:otherwise>
						</c:choose>
						<input type = "submit" id="paySearchBtn" value = "검색" onclick="paySearch()" >
					</div>
					<table class="pay">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>금액</th>
							<th>납기일</th>
							<th>납부상태</th>
						</tr>
						<c:choose>
							<c:when test = "${empty inquiries}">
								<tr>
									<td colspan = 5 style = "cursor:default; color:#000;">
										조회된 자료가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="inquiry" items = "${inquiries}">
									<tr onclick="location.href='inquiryContent?no=${inquiry.no}'">
										<td>${inquiry.no}</td>
										<td>${inquiry.title }</td>
										<td>
											<c:if test = "${inquiry.reply == 'N' }">
												미답변
											</c:if>
											<c:if test = "${inquiry.reply == 'Y' }">
												답변완료
											</c:if>
										</td>
										<td>${inquiry.id }</td>
										<td>${inquiry.writeDate }</td>
									</tr>
									<div class="payPage">
										${result }
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script>
	function searchChange(){
		var paySelect = document.getElementById('paySelect');
		var select = document.getElementById('paySelect').options.selectedIndex;
		var option = paySelect.options[select].value;
		if(option == "pay"){
			document.getElementById('search').style.display='none';
			document.getElementById('payDetailSelect').style.display='inline-block';
		} else {
			document.getElementById('search').style.display='inline-block';
			document.getElementById('payDetailSelect').style.display='none';
		}
	}
	
	/*submit 시 parameter 안 넘어가게 조절함(disabled)*/
	function paySearch(){ 
		const paySearchBtn = document.getElementById('paySearchBtn');
		var paySelect = document.getElementById('paySelect');
		var select = document.getElementById('paySelect').options.selectedIndex;
		var option = paySelect.options[select].value;
		
		var payDetailSelect = document.getElementById('payDetailSelect');
		if(option == 'id' || option == 'name'){
			document.getElementById('payDetailSelect').disabled = true;
			var search = document.getElementById('search').value;
			if(search == ''){
				alert('검색어를 입력하세요.');
				return false;
			}
		} else{	
			document.getElementById('search').disabled=true;
		}
	}
</script>

<script src = "${context }javaScript/admin.js"></script>