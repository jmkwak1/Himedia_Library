const header_nav = document.querySelector(".header_nav");
const toggle_box = document.querySelectorAll(".toggleBox");
	
header_nav.addEventListener("mouseover", () => {
	header_nav.classList.add("show");
    toggle_box.forEach(item => {
        item.classList.add("show"); // 전환을 위한 클래스 추가
    });
});

header_nav.addEventListener("mouseout", () => 
{	header_nav.classList.remove("show");
    toggle_box.forEach(item => {
        item.classList.remove("show"); // 전환을 위한 클래스 제거
    });
});


function toggleMenu(){
	var notification = document.getElementById('notification');
	var expanded = notification.getAttribute('aria-hidden') === 'false';
	
	if (expanded) {
        notification.setAttribute('aria-hidden', 'true');
        notification.classList.remove('show'); // 알림 메뉴를 감추기 위해 클래스 제거
    } else {
        notification.setAttribute('aria-hidden', 'false');
        notification.classList.add('show'); // 알림 메뉴를 표시하기 위해 클래스 추가
    }
}
// 헤더 스크롤에 따라 네비게이션 맨 위로 이동시키기
const mainController = document.querySelector('.mainController');

window.addEventListener('scroll', function () {
    if (window.scrollY > 40) {
        header_nav.classList.add('fix');
    } else {
        header_nav.classList.remove('fix');
    }
});
