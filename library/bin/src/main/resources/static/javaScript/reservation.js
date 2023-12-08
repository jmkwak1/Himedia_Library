let whichRoom;
// 현재 URL을 가져오는 JavaScript 함수
function getCurrentURL() {
	return window.location.href;
}

// URL에 따라 버튼 색상을 변경하는 JavaScript 함수
function setButtonColorByURL() {
	var currentURL = getCurrentURL();
	// 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
	if (currentURL.includes("readingRoom1")) {
		whichRoom = "R1"
	} else if (currentURL.includes("readingRoom2")) {
		whichRoom = "R2"
	} else {
		whichRoom = "SR"
	}
}

// 페이지 로드 시 버튼 색상을 설정합니다.
setButtonColorByURL();

// 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
window.onpopstate = function() {
	setButtonColorByURL();
};



//각 좌석 클릭 리스너 등록
let each_seat = document.querySelectorAll('.each_seat');
each_seat.forEach(item => item.addEventListener('click', activateEach_seat));


// 좌석 상태 업데이트 관련
var reservedSeat = [];
let seatXhr;
let emptyNum;
let usingNum;

showReservedSeat(whichRoom);

// 예약된 좌석 리스트 가져오기.
function showReservedSeat(whichRoom) {
	seatXhr = new XMLHttpRequest();
	seatXhr.open('POST', "room");
	seatXhr.send(whichRoom);
	seatXhr.onreadystatechange = roomProc;
}

function roomProc() {
	if (seatXhr.readyState === 4) {
		if (seatXhr.status === 200) {
			reservedSeat = JSON.parse(seatXhr.responseText);
			usingNum = reservedSeat.length;
			emptyNum = 96 - usingNum;
			
			//사용중인 좌석 색 바꾸기.
			updateSeatStatus();
		} else {
			console.log('에러: ' + seatXhr.status);
		}
	}
}


// 초기 로딩 시 좌석 상태 업데이트
//updateSeatStatus();


// 현재 좌석 상태 업데이트 함수
function updateSeatStatus() {
	if(sessionId == ""){
		document.querySelector('.seat_status.mine').style.display = "none";
	}else{
		document.querySelector('.seat_status.mine').style.display = "block";
	}

	document.querySelector('.empty_seat').textContent = emptyNum;
	document.querySelector('.using_seat').textContent = usingNum;
	
	each_seat.forEach(item => {
		for (let i = 0; i < reservedSeat.length; i++) {
			if (item.textContent === String(reservedSeat[i].seatId)) {
				//사용중인 좌석에 className 추가하기.(안하면 새로고침시 다 사라짐.)
				item.classList.add('using');
			
				if(sessionId ==  String(reservedSeat[i].userId)){
					//'내 좌석'상태에 번호 표기
					//document.querySelector('.my_seat').textContent = reservedSeat[i].seatId+"번";
					// 내가 예약한 좌석 색 보라색으로 바꾸기.
					item.classList.add('mine');
				}else{
				}
			}
		}
	});

}

//각 좌석 클릭시 예약하는 로직 함수.
let popupWindow;
//let popupForm;
let seatNumber;
let recentRoom;
let reserveXhr;

function nonLoginAlert(){
		//비로그인시 처리.
	result = confirm("로그인 후 이용해주세요.");
	if (result) {
		location.href = "/login";
		return;
	}
	return;
}

function activateEach_seat() {
	if (sessionId == "") {
		nonLoginAlert();
		return;
	}
	
	//선택한 좌석 번호, 열람실 이름을 변수에 설정.
	seatNumber = this.textContent;
	
	let roomDiv = document.querySelector('.whichRoom');
	recentRoom = roomDiv.innerText.split('\n')[0];
	
	if (this.classList.contains("using")) {
		if(this.classList.contains("mine")){
			if (sessionId == "") {
				nonLoginAlert();
				return;
			}
			// 내 좌석 정보 보기 모달창 열기.
			mySeatProc();
			return;
		}
		alert("이미 예약된 좌석입니다.");
		return;
	}

	let message = `열람실: ${recentRoom}\n좌석 번호: ${seatNumber}\n이름: ${userName}\n\n예약하시겠습니까?`; // 메시지 구성
	let isConfirmed = confirm(message);
	if (isConfirmed) {
		// 사용자가 확인을 선택한 경우 서버에 좌석번호, 열람실 정보를 보냄.
		var reqData = { seatId: seatNumber, room: whichRoom }
		reqData = JSON.stringify(reqData);
		reserveXhr = new XMLHttpRequest();
		reserveXhr.open('POST', "/reservation/reserveProc");
		reserveXhr.setRequestHeader('content-type', 'application/json');
		reserveXhr.send(reqData);
		reserveXhr.onreadystatechange = reserveProc;

	}
}
//예약 요청했을 때, 예약 성공 여부를 서버에서 받아옴.
function reserveProc() {
	if (reserveXhr.readyState === 4) {
		if (reserveXhr.status === 200) {
			showReservedSeat(whichRoom);

			let response = reserveXhr.responseText;
			alert(response);
			return;
		} else {
			console.log('에러: ' + reserveXhr.status);
		}
	}
	//좌석 예약 알람 기능을 바로 적용하기 위해 새로고침 적용.
	window.location.reload();
}

//내 좌석(상태표시, 좌석) 클릭시 좌석 정보를 보여주고 퇴실 여부 묻는 모달창.
let mySeat = document.querySelector('.mine');
mySeat.addEventListener('click', mySeatProc);

function mySeatProc(){
	console.log("내 자리");
	openCustomModal();
	//let message = `열람실: ${recentRoom}\n좌석 번호: ${seatNumber}\n이름: ${userName}\n\n예약하시겠습니까?`; // 메시지 구성
	//let isConfirmed = confirm(message); // confirm 다이얼로그 표시
}

//내  자리 클릭시에 뜨는 모달창.
const customModal = document.getElementById('customModal');
const modalContent = document.querySelector('.modal-content');
const leaveButton = document.getElementById('leaveButton');
const cancelButton = document.getElementById('cancelButton');

function openCustomModal() {
  customModal.style.display = 'flex';
}

function closeCustomModal() {
  customModal.style.display = 'none';
}

customModal.addEventListener('click', function(event) {
    // 클릭된 요소가 모달 내부의 컨텐츠 영역이 아니면 모달을 닫습니다.
  /*  if (event.target !== modalContent) {*/
        customModal.style.display = 'none';
   /* }*/
});

modalContent.addEventListener('click', function(event) {
    event.stopPropagation();
});


let leaveXhr;
function leaveSeat() {
  let result = confirm("퇴실하시겠습니까?");
  if(result){
		leaveXhr = new XMLHttpRequest();
		leaveXhr.open('POST', "leaveProc");
		leaveXhr.send(sessionId);
		leaveXhr.onreadystatechange = leaveSeatProc;
  }
}

function leaveSeatProc() {
	if (leaveXhr.readyState === 4) {
		if (leaveXhr.status === 200) {
			//showReservedSeat(whichRoom);
			//updateSeatStatus();
			let response = leaveXhr.responseText;
			alert(response);
			//closeCustomModal();
		} else {
			console.log('에러: ' + leaveXhr.status);
		}
	}
	//좌석 예약 알람 기능을 바로 적용하기 위해 새로고침 적용.
	window.location.reload();
}

//퇴실 버튼
if(leaveButton !== null )
	leaveButton.addEventListener('click', leaveSeat);
if(cancelButton !== null )
	cancelButton.addEventListener('click', closeCustomModal);
