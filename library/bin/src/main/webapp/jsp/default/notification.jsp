<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table tr{height:40px; line-height:40px;}
</style>
</head>
<body>
	<c:choose>
		<c:when test = "${empty notify || notify.size() ==0}">
			최근 알림 내역이 없습니다.
		</c:when>
		<c:otherwise>
			<table>
				<c:forEach var="i" begin="0" end="${notify.size()-1}" step="1">
						<tr>
							<th width="100">[${notify.get(i).getCategory() }]</th>
							<td>
								<a href = "${notify.get(i).getUrl()}">${notify.get(i).getTitle() }</a><br>
							</td>
						</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>