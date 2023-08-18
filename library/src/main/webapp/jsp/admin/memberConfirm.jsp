<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href = "css/main.css" rel = "stylesheet" type = "text/css">
<link href = "css/admin.css" rel = "stylesheet" type = "text/css">

<title>하이미디어 도서관 - 관리자 페이지 : 회원인증</title>

<c:import url = "/header"/>
<div class = "adminContainer inner pageContent_mt">
	<c:import url = "/subMenuAdmin"/>
	<div class = "adminContent">
		<div class = "admin header">
			<h1>회원관리</h1>
			<div class="mb_30 mt_20">
				<a href="/main">HOME</a> > 
				<a href="/member">관리자페이지</a> >
				<a class="checked" href="/member">회원관리</a>
			</div>
		</div>
		<div class="memberContainer">
			<form action = "memberConfirmProc" id ="f" method="post">
				<table class="memberDetail">
					<tr>
						<th>아이디</th>
						<td><input type = "text" name="id" class = "id" value="${member.id}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${member.name}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${member.birth}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${member.mobile}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${member.postCode}<br>${member.address}<br>${member.detailAddress}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${member.regDate }</td>
					</tr>
					<tr>
						<th>신청일</th>
						<td>${member.authDate }</td>
					</tr>
					<tr>
						<th>회원분류</th>
						<td>
							<select class="userGroup" id = "userGroup" name="userGroup" onchange="deputyApply()">
								<option value = "">선 택</option>
								<option value = "child">어린이</option>
								<option value = "student">중ㆍ고등학생</option>
								<option value = "adult">성인</option>
								<option value = "side">타시도 거주자</option>
								<option value = "foreign">외국인</option>
							</select>
							<div class = "deputy noline" id = "deputy" style="display:none">
								<input type = "checkbox" id ="deputyChk1" onclick="deChk()">
								<label for = "deputyChk1">보호자 대리신청</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>신청서류</th>
						<td>
							<select class = "paper" id ="paper" name ="paper">
								<option value = "">선 택</option>
								<option value = "resident">주민등록등본</option>
								<option value = "studentID">학생증</option>
								<option value = "identity">주민등록증</option>
								<option value = "driving">운전면허증</option>
								<option value = "alien">국내거소신고증/외국인등록증</option>
							</select>
							<div class = "deputy noline guardian" id = "deputyGuardian" style="display:none">
								<input type = "checkbox" id ="deputyChk2" name = "deputyChk2">
								<label for = "deputyChk2" class="deputyChk2">부모님 신분증</label>
								<input type = "checkbox" id ="deputyChk3" onclick="deChk()">
								<label for = "deputyChk3" class="deputyChk3">가족관계 증빙서류</label>
								<select id = "guardianPaper" class="guardianPaper" style="display:none">
									<option>선 택</option>
									<option>주민등록등본</option>
									<option>가족관계증명서</option>
									<option>기타</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>반려사유</th>
						<td>
							<input type = "text" name = "reject" class = "reject" id = "reject" placeholder ="반려시에만 작성해주세요.(10자이내)">
						</td>
					</tr>
				</table>
				<div>
					<input type = "button" value = "인증" onclick="certify()">
					<input type = "button" value = "반려" onclick="rejectProc()">
					<input type = "button" value = "취소" onclick="location.href='member'">
				</div>
			</form>
		</div>
	</div>
</div>
<c:import url = "/footer"/>
<script src = "javaScript/admin.js"></script>