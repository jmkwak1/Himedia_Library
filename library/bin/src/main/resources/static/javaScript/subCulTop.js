/*console.log('subTop.js is loaded.');
const menuItems = document.querySelectorAll('.menu-item');

function activateMenuItem() {
	// 모든 메뉴 항목에서 '활성' 클래스 제거
	menuItems.forEach(item => item.classList.remove('active'));

	// 클릭한 메뉴 항목에 '활성' 클래스 추가
	this.classList.add('active');
}

//기본설정으로 첫번째 li는 활성화
menuItems[0].classList.add('active');

// 클릭한 메뉴 항목에 '활성' 클래스 추가
menuItems.forEach(item => item.addEventListener('click', activateMenuItem));*/

 // 현재 URL을 가져오는 JavaScript 함수
    function getCurrentURL() {
      return window.location.href;
    }

    // URL에 따라 버튼 색상을 변경하는 JavaScript 함수
    function setButtonColorByURL() {
      var currentURL = getCurrentURL();
      console.log(document.getElementById("subLogin"))
      
      // 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
      if (currentURL.includes("culturalForm")) {
        document.getElementById("menu1").classList.add("active");
        document.getElementById("menu2").classList.remove("active");
      } else if (currentURL.includes("culFormEnd")) {
        document.getElementById("menu2").classList.add("active");
        document.getElementById("menu1").classList.remove("active");
      } 
       console.log(document.getElementById("menu1"))
       console.log(document.getElementById("menu2"))
    }

    // 페이지 로드 시 버튼 색상을 설정합니다.
    setButtonColorByURL();

    // 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
    window.onpopstate = function () {
      setButtonColorByURL();
    };