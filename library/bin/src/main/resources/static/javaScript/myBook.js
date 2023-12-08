function extend(isbn, endDate) {
	console.log(isbn);
	let con = confirm('대출 연장을 신청하시겠습니까?');
	if (con) {

		const endDateObject = new Date(endDate); // 이미 생성한 endDate를 Date 객체로 변환
		endDateObject.setDate(endDateObject.getDate() + 10); // 10일 추가

		const newEndDate = endDateObject.toISOString().slice(0, 10);
		location.href = '/myLibrary/myBookStatus?isbn=' + isbn + "&newEndDate=" + newEndDate;
	}
}

let loanXhr;
function Book(bookName, isbn) {
	console.log("클");
	const currentDate = new Date();
	const startDate = currentDate.toISOString().slice(0, 10);

	const futureDate = new Date(currentDate);
	futureDate.setDate(currentDate.getDate() + 14);
	const endDate = futureDate.toISOString().slice(0, 10);


	let message = `도서명 : ${bookName}\n대출 신청 일자 : ${startDate}\n도서 반납 일자 : ${endDate}\n\n대출 예약 신청 하시겠습니까?`; // 메시지 구성
	let isConfirmed = confirm(message);
	if (isConfirmed) {
		let reqData = { bookName, isbn, startDate, endDate, status: "R" }; //처음 신청하면 대출 예약으로 들어감.
		reqData = JSON.stringify(reqData);

		loanXhr = new XMLHttpRequest();
		loanXhr.open('POST', "bookLoanProc");
		loanXhr.setRequestHeader('content-type', 'application/json');
		loanXhr.send(reqData);
		loanXhr.onreadystatechange = loanProc;
	}
}

function loanProc() {
	if (loanXhr.readyState === 4) {
		if (loanXhr.status === 200) {
			let response = loanXhr.responseText;
			alert(response);
			return;
		} else {
			console.log('에러: ' + loanXhr.status);
		}
	}
	//좌석 예약 알람 기능을 바로 적용하기 위해 새로고침 적용.
	window.location.reload();
}

/*책 소장 정보*/
function toggleBookStatusPopup(popupId) {
	const popup = document.getElementById(popupId);
	if (popup) {
		if (popup.style.display === "block") {
			popup.style.display = "none"; // Hide the popup if it's already open
		} else {
			popup.style.display = "block"; // Show the popup if it's closed
		}
	}
}
