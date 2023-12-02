<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.care.library.common.PageService" %>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/" />
<link href="${context}css/cultural.css" rel="stylesheet" type="text/css">

<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var status = "${sessionScope.status}"; // 세션에 저장된 id 값을 가져와서 status 변수에 할당
	    var applyElement = document.getElementById('apply'); // apply 요소를 가져옵니다.
	    var inquiryContainerElement = document.getElementById('inquiryContainer'); // inquiryContainer 요소를 가져옵니다.
	
	    if (status === 'M') {
	        applyElement.style.display = 'block';
	        inquiryContainerElement.style.marginTop = '0'; // status가 'M'일 때는 marginTop을 0으로 설정
	    } else {
	        applyElement.style.display = 'none';
	        inquiryContainerElement.style.marginTop = '30px'; // 그 외의 경우 marginTop을 20px로 설정
	    }
	});
  	
  	function deleteCheck() {
  	    result = confirm('진짜로 삭제하겠습니까?');
  	    
  	    if (result) {
  	        // AJAX 요청을 보냅니다.
  	        const xhr = new XMLHttpRequest();
  	        
  	        xhr.onreadystatechange = function() {
  	            if (xhr.readyState === 4 && xhr.status === 200) {
  	                // 요청이 성공적으로 완료됐을 때 수행할 작업을 여기에 추가합니다.
  	                // 예를 들어, 페이지를 다시 로드하거나 갱신할 수 있습니다.
  	                window.location.href = '${context}cullist'; // 이동할 페이지 URL을 지정
  	            }
  	        };
  	        
  	        xhr.open('GET', `culturalDeleteProc?culId=${cultural.culId}`, true);
  	        xhr.send();
  	    }
  	}
  	document.addEventListener('DOMContentLoaded', function() {	
  		//JavaScript 코드가 DOM이 로드되기 전에 실행되면 해당 요소를 찾을 수 없기 때문에 오류가 발생할 수 있음
  		//DOMContentLoaded 이벤트가 발생할 때까지 스크립트가 실행되지 않고, DOM이 완전히 로드된 이후에 실행
    var status = "${sessionScope.status}"; // 세션에 저장된 id 값을 가져와서 id 변수에 할당
    if (status === 'M') {
      document.getElementById('apply').style.display = 'block';
    } else {
      document.getElementById('apply').style.display = 'block';/* 
      document.getElementById('apply').style.display = 'none'; */
    }
  });
</script>
	
<style>
	.applyW ul{
		display: flex;
		justify-content: right;
		margin-right: 25px;
		margin-top: 10px;
		margin-bottom: 15px;
	}
	
	.applyW ul li{
		padding: 8px 10px 8px 10px;
		margin-right:5px;
		border: 1px solid rgba(0, 0, 0, 0.4);
		background-color: cornflowerblue;
	}
	
	.applyW ul li a{
		color: white;
	}
	
	input[type="button"] {
        padding: 10px 20px;
        background-color: #338cfa;
        color: white;
        border: none;
        cursor: pointer;	/*hover시 마우스 손모양*/
    }

    input[type="button"]:hover {
        background-color: #256aaa;
    }
	
	.culBtn {
    	margin-top:30px;
    	margin-bottom:50px;
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
		<div class="applyW"  style="display:none">
		    <ul id="apply">
		        <li><a href="${context}culModify?culId=${cultural.culId}">수정</a></li>
		        <li><a href="javascript:void(0);" onclick="deleteCheck()">삭제</a></li>
		    </ul>
		</div>
		<div align="center">
		    <table class="inquiryContainer" id="inquiryContainer">
		        <tr>
		            <td colspan="2" class="inquiryWriteForm">
		                <table width="850px">
		                    <tr>
		                        <th width="100px">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
		                        <td><span class="title">${cultural.title}</span></td>
		                    </tr>
		                    <tr>
		                        <th>강의기간</th>
		                        <td class="calender">
		                            <span class="lecture">${cultural.lectureStart} ~ ${cultural.lectureEnd}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>접수기간</th>
		                        <td class="calender">
		                            <span class="registration">${cultural.registrationStart} ~ ${cultural.registrationEnd}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</th>
		                        <td>
		                            <span class="target">${cultural.target}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>강의시간</th>
		                        <td>
		                            <span class="lectureTime">${cultural != null ? cultural.lectureTime : ''}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>강의장소</th>
		                        <td>
		                           <span class="lecturePlace">${cultural != null ? cultural.lecturePlace : ''}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>강의요일</th>
		                        <td>
		                            <span class="lectureDay">${cultural != null ? cultural.lectureDay : ''}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>강사명</th>
		                        <td>
		                            <span class="lectureName">${cultural != null ? cultural.lectureName : ''}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>준비물</th>
		                        <td>
		                            <span class="cost">${cultural != null ? cultural.cost : ''}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
		                        <td>
		                            <span class="lectureText">${cultural.lectureText}</span></br>
		                            <span class="ImagePath">
		                            <img url="${cultural.imagePath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
		                            </span>
		                            
		                        </td>
		                    </tr>
		                </table>
		            </td>
		        </tr>
		    </table>
		    <div class="culBtn" align="center">
				<input type="button" value="신청하기"	 onclick="location.href='cullist'">
				<input type="button" value="목록으로"	 onclick="location.href='cullist'">
			</div>
		</div>
		
		<%-- <c:out value="${param.culId}" /> --%>
		<%-- <div align="center">
		    <ul>
		        <li class="culWrite">
		            <div class="writeImg">
		                <img src="${cultural.imagePath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
		            </div>
		            
		            <div class="write_list_area">
		                <div class="title_area">
		                    <!-- 제목을 그대로 표시합니다. -->
		                    <b class="title">${cultural.title}</b>
		                </div>
		                
		                <ul class="Write_con">
		                    <li><span class="tit">강의기간</span>${cultural.lectureStart} ~ ${cultural.lectureEnd}</li>
		                    <li><span class="tit">접수기간</span>${cultural.registrationStart} ~ ${cultural.registrationEnd}</li>
		                    <li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span>${cultural.target}</li>
		                </ul>
		            </div>
		        </li>
		    </ul>
		</div> --%>
	</div>
</div>

<c:import url="/footer" />

<script src="${context }javaScript/subCulTop.js"></script>
