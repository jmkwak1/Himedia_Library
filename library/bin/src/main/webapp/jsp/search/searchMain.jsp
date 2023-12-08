<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>하이미디어 도서관 - 검색 메인</title>

<link href="${context}css/main.css" rel="stylesheet" type="text/css">
<link href="${context}css/search.css" rel="stylesheet" type="text/css">
</head>

<body>
	<c:import url="/header" />
	<div class="searchContainer pageContent_mt">
		<div class="condition">
			<div class="inner">
				<form class="search_area" action="datasearch/totalSearchProc"
					method="post" accept-charset="UTF-8">
					<input class="searchInput" name="totalSearch"
						placeholder="검색어를 입력하세요."> <input type="hidden"
						name="gotoSearchMain" value="1">
					<button type="submit" class="search_Btn">
						<img src="/image/search.png">
					</button>
				</form>
			</div>
		</div>
		<div class="visual">
			<div class="inner">
				<div class="content left">
					<div class="popularBook">
						<div class="iconContainer">
							<div class="iconBox">
								<img src="/image/popBook.png" />
							</div>
							<span>인기도서</span>
						</div>
						<div class="bookContainer">
							<c:forEach var="bookInfo" items="${popularBook}">
								<div class="bookImageBox"
									onclick="location.href='/datasearch/bookDetail?isbn=${bookInfo.isbn}'">
									<img src="${bookInfo.bookImageURL}">
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="newBook">
						<div class="iconContainer">
							<div class="iconBox">
								<img src="/image/newBook.png" />
							</div>
							<span>신착도서</span>
						</div>
						<div class="bookContainer">
							<c:forEach var="bookInfo" items="${recentBook}" varStatus="loop">
								<c:if test="${loop.index < 5}">
									<div class="bookImageBox"
										onclick="location.href='/datasearch/bookDetail?isbn=${bookInfo.isbn}'">
										<img src="${bookInfo.bookImageURL}">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 
					<div class="content right">
					</div> -->
			</div>
		</div>

	</div>
	<c:import url="/footer" />
</body>


