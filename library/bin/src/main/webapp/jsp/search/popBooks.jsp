<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>하이미디어 도서관 - 통합검색</title>
<c:url var="context" value="/" />

<link href="${context }css/main.css" rel="stylesheet" type="text/css">
<link href="${context }css/search.css" rel="stylesheet" type="text/css">
<link href="${context }css/myLibrary.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<c:import url="${context }header" />
	<%-- <c:import url="${context }datasearch/searchModal" /> --%>
	<div class="search_totalContainer inner pageContent_mt">
		<c:import url="/datasearch/subMenuSearch" />
		<div class="searchContent">
			<div>
				<h1>통합검색</h1>
				<div class="search_title">
					<p>소장하고 있는 자료에 대한 가장 기본적인 검색입니다.</p>
				</div>
				<div class="mb_30 mt_20">
					<a href="/main">HOME</a> > <a href="/datasearch">자료검색</a> > <a
						class="checked" href="/datasearch/totalSearch">통합검색</a>
				</div>
			</div>
			<div class="searchBox">
				<form class="search_area totalSearch" action="totalSearchProc"
					method="post" accept-charset="UTF-8">
					<input class="searchInput" name="totalSearch"
						placeholder="검색어를 입력하세요.">
					<button class="search_Btn totalSearch">
						<img src="/image/search.png">
					</button>
				</form>
			</div>
			<c:choose>
				<c:when test="${empty searchResult}">
					<span>0개의 검색 결과가 존재합니다.</span>
				</c:when>
				<c:otherwise>
					<c:forEach var="result" items="${searchResult}">
						<div class="search_Container">
							<div class="search_result">
								<div class="bookImgBox" onclick="getBookDetail()">
									<!-- span>1</span> -->
									<div class="result_bookImg">
										<img src="${result.bookImageURL}" alt="이미지 없음" />
									</div>
								</div>
								<div class="result_bookContent">
									<div class="bookContentBox">
										<div>
											<div class="title search ">${result.bookName}</div>
											<div class="bookInfo">
												<span>${result.authors} |</span> <span>${result.publisher}
													|</span> <span>${result.publicationYear}</span>
											</div>
										</div>
										<div>
											<span class="bookStatusButton"
												onclick="toggleBookStatusPopup('bookStatusPopup${result.isbn}')">소장
												정보</span> <span class="bookDtlButton"
												onclick="location.href='/datasearch/bookDetail?isbn=${result.isbn}'">도서
												정보</span>
										</div>

									</div>
								</div>
							</div>
							<div class="bookStatus_Container"
								id="bookStatusPopup${result.isbn}">
								<table>
									<thead>
										<tr>
											<th>도서관</th>
											<th>대출상태</th>
											<th>isbn</th>
											<th>예약</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>은평구립도서관</td>
											<c:choose>
												<c:when test="${result.restVol > 0 }">
													<td><span class="possible">${result.restVol}(대출
															가능)</span> / ${result.vol}</td>
												</c:when>
												<c:otherwise>
													<td><span class="impossible">${result.restVol}(대출
															불가)</span> / ${result.vol}</td>
												</c:otherwise>
											</c:choose>
											<td>${result.isbn}</td>
											<c:choose>
												<c:when test="${empty sessionScope.id }">
													<td class="impossible" onclick="location.href='/login'">로그인
														필요</td>
												</c:when>
												<c:when test="${result.restVol < 1 }">
													<td class="bookStatus_loanBook impossible">대출 불가</td>
												</c:when>
												<c:otherwise>
													<td class="bookStatus_loanBook"
														onclick="loanBook('${result.bookName}', '${result.isbn}')">대출
														예약</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<div class="totalSearchPage">${result }</div>
		</div>
	</div>
	<script src="${context }javaScript/search.js"></script>
	<c:import url="/footer" />
</body>