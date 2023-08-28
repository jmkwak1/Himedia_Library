<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>하이미디어 도서관 - 통합검색</title>
<c:url var="context" value="/" />

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/search.css" rel="stylesheet" type="text/css">

</head>
<body>

	<c:import url="${context }header" />
	<%-- <c:import url="${context }datasearch/searchModal" /> --%>
	<div class="search_detailContainer inner pageContent_mt">
		<c:import url="/datasearch/subMenuSearch" />
		<div class="searchContent">
			<div>
				<h1>통합검색</h1>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > <a href="/datasearch">자료검색</a> > <a
						class="checked" href="/datasearch/totalSearch">통합검색</a>
				</div>
			</div>
			<div class="detail_contentBox">
				<div class="detailImgBox">
					<img src="${detail.bookImageURL}" />
				</div>
				<div class="detailContent">
					<h2>${detail.bookName}</h2>
					<div class="detail_info">
						<span>${detail.authors}</span> | <span>${detail.publisher}</span>
						| <span>${detail.publicationYear}</span>
					</div>
					<div class="detail_class">
						<c:if test="${not empty detail.className}">
							<span>한국십진분류</span>${detail.className}
						</c:if>
					</div>
					<div class="detail_description" id="detailContent">
						<div class="desc_title">책 소개</div>
						<c:if test="${empty detail.description}">
							<span>제공된 책 정보가 없습니다.</span>
						</c:if>
						<c:if test="${not empty detail.description}">
							<p>${detail.description}</p>
						</c:if>
						
						<div class="detail_loanBox" >
							<div class="detail_loan" onclick="loanBook('${detail.bookName}', '${detail.isbn}')">
								<img src="${context}image/loanBook.png" />
							</div>
							<span>대출 예약</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${context }javaScript/search.js"></script>
	<c:import url="/footer" />
</body>