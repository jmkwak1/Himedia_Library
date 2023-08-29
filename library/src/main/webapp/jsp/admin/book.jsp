<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:url var="context" value="/"/>
    <head>
    
<title>하이디미어 도서관 - 관리자 페이지 : 대출관리</title>
<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/admin.css" rel="stylesheet" type="text/css">

<c:import url = "/header"/>
<script>
//탭 클릭 시 active 추가
document.addEventListener('DOMContentLoaded', function() {
    const subMenuItems = document.querySelectorAll('.info_menu');
    subMenuItems[0].classList.add('active');

    subMenuItems.forEach(item => {
        item.addEventListener('click', function() {
            subMenuItems.forEach(item => {
                item.classList.remove('active');
            });

            this.classList.add('active');
            
            var value = this.getAttribute("value");
            
            // Remove the existing content and update with new content
            var contentBox = document.querySelector('.contentBox');
            contentBox.innerHTML = ''; // Clear existing content

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        contentBox.innerHTML = xhr.responseText; // Update with new content
                    } else {
                        console.log("Error:", xhr.status);
                    }
                }
            };
            
            xhr.open('POST', '/info/faqList', true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("category=" + encodeURIComponent(value));
        });
    });
});
</script>
</head>
<body>
<div class="adminContainer inner mb_30" >
	<c:import url = "/subMenuAdmin"/>
	<div class="adminContent">
		<h1>대출관리</h1>
		<div class="mb_30 mt_20" style = "border-bottom:1px solid #ddd; padding-bottom:20px;">
			<a href="${context }main">HOME</a> > 
			<a href="${context }admin/member">관리자페이지</a> >
			<a class="checked" href="${context }admin/book">대출관리</a>
		</div>
		<form id = "f" action="" method="post">
			<input type="hidden" id="menuItemValue" name="category" value="">
		</form>
		<div class="bookContainer" style = "border-top:none; padding-top:0;">
			<c:import url = "${context }admin/loan"/>
		</div>
	</div>
</div>
<c:import url="/footer"/>
</body>
<script src = "${context }javaScript/admin.js"></script>


