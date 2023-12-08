<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<!-- 캘린더 추가 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.css">

<script src="${context }javaScript/daytoday.js"></script>

<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/"/>
<!-- JavaScript 코드 추가 -->

<link href="${context }css/cultural.css" rel="stylesheet" type="text/css">

<style>
	input[type="file"] {
	    display: none;
	}

  /* 파일첨부 버튼 스타일 */
  .file-upload-btn {
    padding: 0px 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    color: #555;
    cursor: pointer;
  }

  /* 파일첨부 input 요소를 숨김 */
  .file-upload-input {
    display: none;
  }

  /* 파일명을 보여주는 요소 스타일 */
  #fileNameDisplay {
    padding: 0px 20px;
/*     border: 1px solid #ccc;*/
    background-color: #f9f9f9;
    color: #555;
  }

    input[type="submit"], input[type="button"] {
        padding: 10px 20px;
        background-color: #338cfa;
        color: white;
        border: none;
        cursor: pointer;	/*hover시 마우스 손모양*/
    }

    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: #256aaa;
    }
	
    .culBtn {
    	margin-top:30px;
    	margin-bottom:50px;
    }
   
</style>

<c:import url="/header" />

<div class="table-wrapper">
	<div class="inner pageContent_mt">
		<div class="sub-menu">
			<c:import url="/subMenuCultural" />
		</div>

		<div class="culturalContainer">
			<div class="top-cultural">
				<div class="top-cbox">
					<h1>문화행사 신청</h1>
					<p>
						
					</p>
					<ul class="Route">
						<li>HOME</li>
						<li> &gt; </li>
						<li>문화행사</li>
						<li> &gt; </li>
						<li>문화행사 신청</li>
					</ul>
				</div>
			</div>

			<div class="inquiryContainer" align="center">
				<form action="culFormWriteProc" method='post' enctype="multipart/form-data">
					<table class="table inquiryWriteForm">
						<tr>
							<th width="100px">제목</th>
							<td><input style="width: 100%; height: 30px" type="text" name="title"></td>
						</tr>
						<tr>
						    <th>강의기간</th>
						    <td class="calender">
						        <input style="width: 100px; height: 30px;" class="lecture start-date" name="lectureStart">
						        &nbsp;&nbsp;~&nbsp;&nbsp;
						        <input style="width: 100px; height: 30px;" class="lecture end-date" name="lectureEnd">
						    </td>
						</tr>
						<tr>
						    <th>접수기간</th>
						    <td class="calender">
						        <input style="width: 100px; height: 30px;" class="registration start-date" name="registrationStart">
						        &nbsp;&nbsp;~&nbsp;&nbsp;
						        <input style="width: 100px; height: 30px;" class="registration end-date" name="registrationEnd">
						    </td>
						</tr>


						<tr>
						    <th>대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</th>
						    <!-- appearance: auto; -webkit-appearance: auto; 글씨 크기에 맞게 아래방향 화살표 -->
						    <td>
						        <select class="select2" style="width: 100px; height: 30px; appearance: auto; -webkit-appearance: auto;" name="target">
								    <option value="전체">전체</option>
								    <option value="어린이">어린이</option>
								    <option value="청소년">청소년</option>
								    <option value="성인">성인</option>
								    <option value="어르신">어르신</option><!-- 65세이상 -->
								</select>
						    </td>
						</tr>
						<tr>
							<th width="100px">강의시간</th>
							<td><input style="width: 100%; height: 30px" type="text" name="LectureTime" placeholder="10:00 - 12:00"></td>
						</tr>
						<tr>
							<th width="100px">강의장소</th>
							<td><input style="width: 100%; height: 30px" type="text" name="LecturePlace" placeholder="하이미디어 도서관"></td>
						</tr>
						<tr>
							<th width="100px">강의요일</th>
							<td><input style="width: 100%; height: 30px" type="text" name="LectureDay" placeholder="월, 화, 수, 목, 금"></td>
						</tr>
						<tr>
							<th width="100px">강사명</th>
							<td><input style="width: 100%; height: 30px" type="text" name="LectureName"></td>
						</tr>
						<tr>
							<th width="100px">준비물</th>
							<td><input style="width: 100%; height: 30px" type="text" name="Cost" placeholder="없음"></td>
						</tr>
						<tr>
							<th width="100px">설명 내용</th>
							<td><textarea style="width: 100%; height: 200px; resize: none;" name="LectureText"></textarea></td>
						</tr>
						<tr>
							<th class="picture">사진&nbsp;첨부</th>
							<td>
								<!-- 실제 파일 첨부 input 요소 -->
								<input type="file" name="upfile" id="fileInput" class="file-upload-input" onchange="showFileName()" name="ImagePath">
								<!-- 파일명을 보여주는 요소 -->
								<span id="fileNameDisplay">첨부된 파일이 없음</span>
								<!-- 파일첨부 버튼 -->
								<label for="fileInput" class="file-upload-btn">파일 첨부</label>
							</td>
						</tr>
					</table>
					<div class="culBtn" align="center">
						<input type="submit" value="신청"> 
						<input type="button" value="취소"	 onclick="location.href='cullist'">
					</div>
				</form>
			</div>

		</div>	    
	</div>
</div>

<c:import url="/footer" />

<script src="${context }javaScript/file.js"></script>
<script src="${context }javaScript/subCulTop.js"></script>
