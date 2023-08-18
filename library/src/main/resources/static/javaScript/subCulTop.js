console.log('subTop.js is loaded.');
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
menuItems.forEach(item => item.addEventListener('click', activateMenuItem));