
// 현재 URL을 가져오는 JavaScript 함수
function getCurrentURL() {
	return window.location.href;
}

// URL에 따라 버튼 색상을 변경하는 JavaScript 함수
function setButtonColorByURL() {
	var currentURL = getCurrentURL();
	document.getElementById("subTotalSearch").classList.add("active");
	// 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
	if (currentURL.includes("totalSearch")) {
		document.getElementById("subTotalSearch").classList.add("active");
		//document.getElementById("subMyBookStatus").classList.remove("active");
		//document.getElementById("subMyInquiry").classList.remove("active");
	} 
}

// 페이지 로드 시 버튼 색상을 설정합니다.
setButtonColorByURL();

// 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
window.onpopstate = function() {
	setButtonColorByURL();
};


function showMyLibSub(menu) {

	var url = "/myLibrary/" + menu;
	console.log(url);
	const myLibraryContent = document.querySelector('.myLibraryContent');
	const xhr = new XMLHttpRequest();
	xhr.open('GET', url, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			myLibraryContent.innerHTML = xhr.responseText;

		}

	};
	xhr.send();
}

// 검색어에 해당하는 글씨 색 바꾸기
/*const title = document.querySelector(".title");
const searchInput = document.querySelector(".searchInput").value;

// 검색어를 정규식 패턴으로 변환하여, 대소문자 구분 없이 검색어를 찾습니다.
const regex = new RegExp(searchInput, "gi");

// 제목 내에서 검색어와 일치하는 부분을 찾아 강조 표시합니다.
const highlightedTitle = title.innerHTML.replace(regex, match => `<span class="highlight">${match}</span>`);

// 강조 표시한 결과를 제목에 적용합니다.
title.innerHTML = highlightedTitle;
*/

// 책 정보 모달



//책 상세 페이지로 이동

let detailXhr;
function getBookDetail(isbn) {
	detailXhr = new XMLHttpRequest();
	detailXhr.open('POST', "bookDetailProc");
	detailXhr.send(isbn);
	detailXhr.onreadystatechange = bookDetailProc;
}

function bookDetailProc() {
	if (detailXhr.readyState === 4) {
		if (detailXhr.status === 200) {
			let resData = detailXhr.responseText;
			resData = JSON.parse(resData);
			console.log(resData);
			//location.href="/datasearch/bookDetail";
		} else {
			console.log('에러: ' + detailXhr.status);
		}
	}
}


