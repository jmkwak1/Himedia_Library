<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/container.css" rel="stylesheet" type="text/css">

<title>하이디미어 도서관 - 회원탈퇴</title>
<c:import url = "/header"/>
<script>
	var id = '${sessionScope.id}';
	if(id == ''){
		alert('로그인 후 이용 가능합니다.')
		location.href = '/login';
	}
	
	function deletePwChk(){
		var pw = document.getElementById('pw').value;
		if(pw == ''){
			var label = document.getElementById('deletePw');
			label.innerHTML = '비밀번호를&nbsp;입력하세요';
			return;
		} else {
			var f = document.getElementById('deleteMember');
			f.submit();
		}
	}
</script>

<div class="RegisterContainer inner mb_30">
	<c:import url="/subMenuLogin" />
	<div class="loginContent">
		<h1>회원탈퇴</h1>
		<div class="mb_30 mt_20">
			<a href="/main">HOME</a> > <a href="/register">회원정보</a> > <a class="checked" href="/deleteMember">회원탈퇴</a>
		</div>
		<div>
			<h2 align="center">회원탈퇴</h2>
			<div class="info" align="center">
				<div class="delete_info">
					- 회원 탈퇴를 하시면 아이디를 포함한 모든 개인정보가 영구적으로 삭제되어 복구되지 않습니다.<br> - 탈퇴
					후에는 자료대출, 홈페이지 이용, 전자도서관 이용 등 모든 도서관 서비스를 이용하실 수 없습니다.<br> -
					탈퇴 시 미처리 업무(미반납 도서 등)가 있을 경우 탈퇴가 불가능합니다.<br> - 회원님의 정보를 안전하게
					보호하기 위해 한번 더 비밀번호를 입력해 주시기 바랍니다.<br>
				</div>
				<form action="deleteMemberProc" id="deleteMember" class="deleteMember" method="post">
					<table>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="pw" name="pw" ></td>
						</tr>
						<tr>
							<td colspan=2><label id="deletePw"></label></td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<div>
									<input type="button" value="탈퇴" onclick="deletePwChk()"> <input type="button" value="취소" style="margin-left:10px" onclick="location.href='/login'">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/footer"/>
