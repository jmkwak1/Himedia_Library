<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>하이디미어 도서관 - 문화행사 종료</title>
<link href="/css/cultural.css" rel="stylesheet" type="text/css">

<body>
    <div class="cul-list contentBox">
        <h2>종료된 문화 행사</h2>
        <ul class="teach_list">
            <c:forEach var="cultural" items="${pastCulturalList}">
                <li class="ever_one">
                    <div class="thumb">
                        <a href="${context}culwrite?culid=${cultural.culid}">
                            <img src="${cultural.imagepath}" alt="image" class="teach_img" style="width:280px; height: 385px;">
                        </a>
                    </div>
                    <div class="list_area">
                        <div class="title_area">
                            <a href="${context}culwrite?culid=${cultural.culid}">
                                <b class="title">${cultural.title}</b>
                            </a>
                        </div>
                        <ul class="con2">
                            <li><span class="tit">강의기간</span>${cultural.lecturestart} ~ ${cultural.lectureend}</li>
                            <li><span class="tit">접수기간</span>${cultural.registrationstart} ~ ${cultural.registrationend}</li>
                            <li><span class="tit">대상</span>${cultural.target}</li>
                        </ul>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
