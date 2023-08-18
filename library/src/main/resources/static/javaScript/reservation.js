const room_menu = document.querySelectorAll('.room_menu');
//console.log(room_menu);

function activateMenuItem() {
	// 모든 메뉴 항목에서 '활성' 클래스 제거
	room_menu.forEach(item => item.classList.remove('active'));

	// 클릭한 메뉴 항목에 '활성' 클래스 추가
	this.classList.add('active');
}

//기본설정으로 첫번째 li는 활성화
room_menu[0].classList.add('active');

// 클릭한 메뉴 항목에 '활성' 클래스 추가
room_menu.forEach(item => item.addEventListener('click', activateMenuItem));

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
	}
}



