<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.care.library.common.PageService" %>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/" />
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/cultural.css" rel="stylesheet" type="text/css">

<script>
	document.addEventListener('DOMContentLoaded', function() {	
	    var status = "${sessionScope.status}"; // 세션에 저장된 id 값을 가져와서 status 변수에 할당
	    var applyElement = document.getElementById('apply'); // apply 요소를 가져옵니다.
	
	    if (status === 'M') {
	        applyElement.style.display = 'block'; // status가 'M'일 때 표시
	    } else {
	        applyElement.style.display = 'none'; // 그 외의 경우 숨김
	    }
	});
</script>
	
<style>
  	.paging{
  		display: flex;
    	justify-content: center;
    	margin-bottom: 50px;
  	}
  	.subMenu .active{background-color:#338cfa;}
	.subMenu .active a{color:#fff;}
	
	input[type="button"] {
        /* padding: 8px 15px;
        background-color: #338cfa;
        color: white;
        border: none; */
        cursor: pointer;	/*hover시 마우스 손모양*/
    }

 /*    input[type="button"]:hover {
        background-color: #256aaa;
    } */

	.Route li:last-child {
	  font-weight: bold; /* 마지막 li에 굵은 글꼴 적용 */
	}
</style>

<c:import url="/header" />

<div class="inner pageContent_mt">
	<div class="sub-menu">
		<c:import url="/subMenuCultural" />
	</div>

	<div class="culturalContainer">
		<div class="top-cultural">
			<div class="top-cbox">
				<h1>문화행사 목록</h1>
				<p>
					지역주민들의 평생학습을 지원하고 건전한 취미, 여가생활을<br> 
					영위할 수 있도록 학습 및 교양 프로그램을 운영하고 있습니다.
				</p>
				<ul class="Route">
					<li><a href="${context}main">HOME</a></li>
					<li>&gt;</li>
					<li><a href="${context}cultural">문화행사</a></li>
					<li>&gt;</li>
					<li><a href="${context}cullist">문화행사 목록</a></li>
				</ul>
			</div>
		</div>
		
 		<div class="top-menu">
		    <ul>
		        <li class="menu-item" id="menu1"><a href="${context}cullist"><span>접수중 / 예정행사</span></a></li>
		        <li class="menu-item  active" id="menu2"><a href="${context}culFormEnd"><span>접수마감된 행사</span></a></li>
		    </ul>
		</div>
	
		<div class="apply" id="apply" style="display:none">
			<input type = "button" value = "신청하기" onclick="location.href='${context}culSubmit'">
		</div>
		
		<table class="notice">
			<tr>
				<th>제목</th>
				<th>강의기간</th>
				<th>접수기간</th>
				<th>대상</th>
			</tr>
			<c:choose>
				<c:when test = "${empty pastCulturalList}">
					<tr>
						<td colspan = 4 style = "cursor:default; color:#000;">
							현재 신청 가능한 문화 행사가 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="cultural" items = "${pastCulturalList}">
						<tr onclick="location.href='${context}culWrite?culId=${cultural.culId}'">
							<td style="width: 35%;">${cultural.title}</td>
						    <td style="width: 25%;">${cultural.lectureStart} ~ ${cultural.lectureEnd}</td>
						    <td style="width: 25%;">${cultural.registrationStart} ~ ${cultural.registrationEnd}</td>
						    <td style="width: 15%;">${cultural.target}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<%-- <div class="cul-list">
			<ul class="teach_list">
	            <c:forEach var="cultural" items="${pastCulturalList}">
	                <li class="ever_one">
	                    <div class="thumb">
	                        <a href="${context}culWrite?culId=${cultural.culId}">
	                            <img url="${cultural.imagePath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
	                        </a>
	                    </div>
	                    <div class="list_area">
	                        <div class="title_area">
	                            <a href="${context}culWrite?culId=${cultural.culId}">
	                            <a href="${context}culWrite/${cultural.culId}">
	                                <b class="title">${cultural.title}</b>
	                            </a>
	                        </div>
	                        <ul class="con2">
	                            <li><span class="tit">강의기간</span>${cultural.lectureStart} ~ ${cultural.lectureEnd}</li>
	                            <li><span class="tit">접수기간</span>${cultural.registrationStart} ~ ${cultural.registrationEnd}</li>
	                            <li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span>${cultural.target}</li>
	                        </ul>
	                    </div>
	                </li>
	            </c:forEach>
			</ul>
	    </div> --%>
		<div class="paging">	
            ${result}
        </div>
	</div>
</div>

<c:import url="/footer" />

<script src="${context }javaScript/subCulTop.js"></script>
