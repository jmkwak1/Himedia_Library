<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
    
<title>하이디미어 도서관 - 마이라이브러리 : 문화행사 현황</title>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/admin.css" rel="stylesheet" type="text/css">
<link href="${context }css/myLibrary.css" rel="stylesheet" type="text/css">

<c:import url = "/header"/>

<body>
<div class="adminContainer inner mb_30" >
	<c:import url = "/subMenuMyLibrary"/>
	<div class="adminContent">
		<h1>문화행사 현황</h1>
		<div class="mb_30 mt_20" style = "border-bottom:1px solid #ddd; padding-bottom:20px;">
			<a href="/main">HOME</a> > 
			<a href="/myLibrary/myBookStatus">마이라이브러리</a> >
			<a class="checked" href="${context }myLibrary/myProgram">문화행사 현황</a>
		</div>
		<div class = "subMenu_book" id = "subMenu_info">
			<ul id = "info_menu">
				<li class = "info_menu active" value="bookLoan">신청현황</li>
				<li class = "info_menu" id="memberListMenu" value = "bookManage">이력조회</li>
			</ul>
		</div>
		<div class="bookContainer" style = "border-top:none; padding-top:0;">
			<form action="" id="f" class="bookLoanForm">
				<div class="bookSearch">
					<select class="loanSelect" name = "select" id="loanSelect" onchange="searchChange()">
						<option <c:if test="${param.select == 'status'}">selected='selected'</c:if>value="status">상태</option>
						<option <c:if test="${param.select == 'title'}">selected='selected'</c:if>value="title">제목</option>
					</select>
					<c:choose>
					    <c:when test="${param.select == 'status' || param.select == null}">
					        <select class="loanStatusSelect" name="loanStatusSelect" id="loanStatusSelect">
					            <option <c:if test="${param.loanStatusSelect == 'R'}">selected='selected'</c:if>value="R">접수중</option>
					            <option <c:if test="${param.loanStatusSelect == 'E'}">selected='selected'</c:if>value="E">마감</option>
					            <option <c:if test="${param.loanStatusSelect == 'T'}">selected='selected'</c:if>value="T">전체</option>
					        </select>
					    </c:when>
					    <c:otherwise>
					        <select class="loanStatusSelect" name="loanStatusSelect" id="loanStatusSelect" style="display:none">
					            <option value="R">접수중</option>
					            <option value="E">마감</option>
					            <option value="T">전체</option>
					        </select>
					    </c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test = "${param.select == 'status' || param.select == null}">
							<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:none">
						</c:when>
						<c:otherwise>
							<input type = "text" name = "search" id = "search" placeholder ="검색어를 입력하세요" style = "display:inline-block">
						</c:otherwise>
					</c:choose>
					<input type = "submit" id="loanSearchBtn" value = "검색" onclick="loanSearch()" >
				</div>
				<table class="inquiry">
					<tr>
						<th>번호</th>
						<th>프로그램명</th>
						<th>기간</th>
						<th>장소</th>
						<th>상태</th>
						<th>신청취소</th>
					</tr>
					<c:choose>
						<c:when test = "${empty loans}">
							<tr>
								<td colspan = 6 style = "cursor:default; color:#000;">
									신청 중인 프로그램이 없습니다.
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="loan" items = "${loans}">
								<c:choose>
									<c:when test = "${param.loanStatusSelect == 'R' || param.loanStatusSelect == null}">
										<tr onclick="location.href='bookLoanRegister?loanId=${loan.loanId}'">
									</c:when>
									<c:otherwise>
										<tr onclick="location.href='bookLoanContent?loanId=${loan.loanId}'">
									</c:otherwise>
								</c:choose>
									<td>${loan.loanId}</td>
									<td>${loan.bookName }</td>
									<td>${loan.userId}</td>
									<c:choose>
										<c:when test="${param.select == null || (param.select == 'status' && param.loanStatusSelect == 'R')}">
											<td>${loan.reserveDate}</td>
										</c:when>
										<c:when test = "${param.select ==  'status' && param.loanStatusSelect == 'T'}">
											<td>
												<c:if test ="${loan.status == 'R'}">
													예약중
												</c:if>
												<c:if test ="${loan.status == 'L'}">
													대출중
												</c:if>
												<c:if test ="${loan.status == 'LE'}">
													대출중(연장)
												</c:if>
												<c:if test ="${loan.status == 'O'}">
													연체중
												</c:if>
												<c:if test ="${loan.status == 'C'}">
													반납완료
												</c:if>
											</td>
										</c:when>
										<c:when test = "${param.select == 'status' && param.loanStatusSelect == 'C'}">
											<td>${loan.returnDate}</td>
										</c:when>
										<c:otherwise>
											<td>${loan.startDate }</td>
											<td>${loan.endDate }</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<div class="loanPage">
					${result}
				</div>
			</form>
		</div>
	</div>
</div>
<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/admin.js"></script>


