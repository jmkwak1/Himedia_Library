<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.care.library.common.PageService" %>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/" />
<link href="css/cultural.css" rel="stylesheet" type="text/css">

<script>
  	document.addEventListener('DOMContentLoaded', function() {	
  		//JavaScript 코드가 DOM이 로드되기 전에 실행되면 해당 요소를 찾을 수 없기 때문에 오류가 발생할 수 있음
  		//DOMContentLoaded 이벤트가 발생할 때까지 스크립트가 실행되지 않고, DOM이 완전히 로드된 이후에 실행
    var id = "${sessionScope.id}"; // 세션에 저장된 id 값을 가져와서 id 변수에 할당
    if (id === 'admin') {
      document.getElementById('apply').style.display = 'block';
    } else {
      document.getElementById('apply').style.display = 'block';/* 
      document.getElementById('apply').style.display = 'none'; */
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
					<li>HOME</li>
					<li>&gt;</li>
					<li>문화행사</li>
					<li>&gt;</li>
					<li>문화행사 목록</li>
				</ul>
			</div>
		</div>
		
 		<div class="top-menu">
			<ul>
				<li class="menu-item" id="menu1"><a href="#"><span>접수중 / 예정행사</span></a></li>
				<!-- <li class="menu-item" id="menu2"><a href="#" keyvalue1="15" keyvalue2="9"><span>문화행사 신청</span></a></li> -->
				<li class="menu-item" id="menu3"><a href="#"><span>접수마감된 행사</span></a></li>
			</ul>
		</div>
	
		<div class="apply" id="apply" style="display:none">
		    <ul>
		        <li><a href="${context}culSubmit">신청하기</a></li>
		    </ul>
		</div>
		
		<div class="cul-list">
	        <%-- <ul class="teach_list">
	            <c:forEach var="cultural" items="${culturalList}">
	                <li class="ever_one">
                        <div class="thumb">
                        	<a href="${context}culWrite" >
               					<img src="${cultural.imagePath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
                        	</a>
                        </div>
                        <div class="list_area">
                            <div class="title_area">
                            	<a href="${context}culWrite" >
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
	        </ul> --%>
			<ul class="teach_list">
	            <c:forEach var="cultural" items="${culturalList}">
	                <li class="ever_one">
	                    <div class="thumb">
	                        <a href="${context}culWrite?culId=${cultural.culId}">
	                            <img src="${cultural.imagePath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
	                        </a>
	                    </div>
	                    <div class="list_area">
	                        <div class="title_area">
	                            <a href="${context}culWrite?culId=${cultural.culId}">
	                           <%--  <a href="${context}culWrite/${cultural.culId}"> --%>
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
	    </div>
		<div class="paging">	
            ${result}
        </div>
	</div>
</div>

<c:import url="/footer" />

<script src="javaScript/subCulTop.js"></script>
