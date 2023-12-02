<<<<<<< HEAD
const room_menu = document.querySelectorAll('.room_menu');
//console.log(room_menu);

function activateMenuItem() {
	// 모든 메뉴 항목에서 '활성' 클래스 제거
	room_menu.forEach(item => item.classList.remove('active'));

	// 클릭한 메뉴 항목에 '활성' 클래스 추가
	this.classList.add('active');
=======
let whichRoom;
// 현재 URL을 가져오는 JavaScript 함수
function getCurrentURL() {
	return window.location.href;
>>>>>>> refs/heads/main
}

<<<<<<< HEAD
//기본설정으로 첫번째 li는 활성화
room_menu[0].classList.add('active');
=======
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
>>>>>>> refs/heads/main

<<<<<<< HEAD
// 클릭한 메뉴 항목에 '활성' 클래스 추가
room_menu.forEach(item => item.addEventListener('click', activateMenuItem));
=======
// 페이지 로드 시 버튼 색상을 설정합니다.
setButtonColorByURL();

// 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
window.onpopstate = function() {
	setButtonColorByURL();
};
>>>>>>> refs/heads/main

<<<<<<< HEAD
function showInfo(menu) {
      var url = "/reservation/"+ menu;
        const room_container = document.getElementById('room_container');
        const xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            room_container.innerHTML = xhr.responseText;
            
            const each_seat = document.querySelectorAll('.each_seat');  
		
			each_seat.forEach(item => item.addEventListener('click', activateEach_seat));
			      
	
			          }
			        };
        xhr.send();
}

				
function activateEach_seat() {
	let seatNumber = this.textContent;
	console.log(seatNumber)
	
	// 확인을 누르면 팝업창 띄우기
		
	let reserve = confirm(seatNumber+"를 예약하시겠습니까?"); 
	if(reserve){
		console.log("확인");
		  var url = "/reservation/roomPopUp";
		  const xhr = new XMLHttpRequest();
		  xhr.open('GET', url, true);
		  
		  xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4) {
		      if (xhr.status === 200) {
		        console.log("통신 성공 후 내용: " + xhr.responseText);
		        //popupDiv.innerHTML = xhr.responseText;
    		      var popupWidth = 500;
					var popupHeight = 500;
							  
					var leftPosition = (window.innerWidth - popupWidth) / 2;
					var topPosition = (window.innerHeight - popupHeight) / 2;
					  
					var popupWindow = window.open('', 'Seat Popup', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);
							
          
		          popupWindow.document.open();
		          popupWindow.document.write(xhr.responseText);
		          popupWindow.document.close();
		document.addEventListener('click', function (event) {
		  // 팝업 창이 열려있고, 클릭된 요소가 팝업 창 내부가 아닌 경우 팝업을 닫음
		  if (popupWindow !== null && event.target !== popupWindow) {
		    popupWindow.close();
		    popupWindow = null; // 전역 변수 초기화
		  }
		}
		);
				console.log("4")
		      } else {
		        console.log("통신 오류 발생: " + xhr.status);
		      }
		    }
		    // document의 클릭 이벤트 리스너 추가

  	};
  
  xhr.send();
=======


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

>>>>>>> refs/heads/main
	}
}
//예약 요청했을 때, 예약 성공 여부를 서버에서 받아옴.
function reserveProc() {
	if (reserveXhr.readyState === 4) {
		if (reserveXhr.status === 200) {
			showReservedSeat(whichRoom);

<<<<<<< HEAD


=======
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
>>>>>>> refs/heads/main
