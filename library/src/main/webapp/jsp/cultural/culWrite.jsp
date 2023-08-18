<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.care.library.common.PageService" %>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/" />
<link href="css/cultural.css" rel="stylesheet" type="text/css">

<script>
/*   	document.addEventListener('DOMContentLoaded', function() {	
  		//JavaScript 코드가 DOM이 로드되기 전에 실행되면 해당 요소를 찾을 수 없기 때문에 오류가 발생할 수 있음
  		//DOMContentLoaded 이벤트가 발생할 때까지 스크립트가 실행되지 않고, DOM이 완전히 로드된 이후에 실행
    var id = "${sessionScope.id}"; // 세션에 저장된 id 값을 가져와서 id 변수에 할당
    if (id === 'admin') {
      document.getElementById('apply').style.display = 'block';
    } else {
      document.getElementById('apply').style.display = 'block';/* 
      document.getElementById('apply').style.display = 'none'; */
/*     }
  }); */ 
</script>
	
<style>
/*   	.paging{
  		display: flex;
    	justify-content: center;
    	margin-bottom: 50px;
  	} */
  	.culWrite {
	    list-style-type: none;
	    padding-left: 0; /* Optionally remove left padding */
	    margin-top:40px;
	    margin-bottom:50px;
	}
	.writeImg{
		margin-bottom:40px;
	}
	.Write_con li::before {		/*::before > 선택한 요소의 시작 부분에 콘텐츠를 생성*/
	  content: "•"; /* 임의의 원형 마커를 생성 */
	  color: #999999; /* 마커 색상 */
	  font-size: 16px; /* 마커 크기 */
	  position: absolute;
	  left: 0;
	  top: 50%;
	  transform: translateY(-50%);	/*세로 중앙을 기준으로 위쪽으로 50%만큼 이동*/
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
					<li>HOME</li>
					<li>&gt;</li>
					<li>문화행사</li>
					<li>&gt;</li>
					<li>문화행사 목록</li>
				</ul>
			</div>
		</div>
		<c:out value="${param.culId}" />
		<div align="center">
	        <ul>
	            <li class="culWrite">
	                <div class="writeImg">
	                    <img src="${param.imagePath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
	                </div>
	                
	                <div class="write_list_area">
	                    <div class="title_area">
	                        <!-- 제목을 그대로 표시합니다. -->
	                        <b class="title">${param.title}</b>
	                    </div>
	                    
	                    <ul class="Write_con">
	                        <li><span class="tit">강의기간</span>${param.lectureStart} ~ ${cultural.lectureEnd}</li>
	                        <li><span class="tit">접수기간</span>${cultural.registrationStart} ~ ${cultural.registrationEnd}</li>
	                        <li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span>${cultural.target}</li>
	                    </ul>
	                </div>
	            </li>
	        </ul>
		</div>

 		
	</div>
</div>

<c:import url="/footer" />

<script src="javaScript/subCulTop.js"></script>
