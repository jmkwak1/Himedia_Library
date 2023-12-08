    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            if(data.userSelectedType === 'R'){
               document.getElementById('address').value= data.roadAddress;
               console.log(typeof data.roadAddress)
            }else{
               document.getElementById('address').value= data.jibunAddress;
            }
            postCode = document.getElementById('postCode').value= data.zonecode;
            }
        }).open();
    }
    
   //생년월일 달력      
   $(function() {
     var placeholderDate = $('input[name="birth"]').attr('value');
     var defaultStartDate = moment(placeholderDate, 'YYYY-MM-DD');
   
     $('input[name="birth"]').daterangepicker({
       singleDatePicker: true,
       autoApply: true,
       showDropdowns: true,
       startDate: defaultStartDate, // 시작 날짜를 placeholderDate로 설정합니다.
       minYear: 1940,
       maxYear: parseInt(moment().format('YYYY'), 10),
       locale: {
         format: 'YYYY-MM-DD'
       }
     }, function(start, end, label) {
       $('input[name="birth"]').val(start.format('YYYY-MM-DD'));
     });
   });
   
   //const menuItems = document.getElementById('myInfo_menu');
   const menuItems = document.querySelectorAll('.myInfo_menu');
   console.log(menuItems);
   
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

function showInfo(menu) {
      var url = "/myLibrary/"+ menu;
        const myInfoContainer = document.getElementById('myInfoContainer');
        const xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            myInfoContainer.innerHTML = xhr.responseText;
          }
        };
        xhr.send();
   }
   
// 비밀번호 수정


	let currentPW = null;
	let newPW = null;
	let newConfirmPW = null;
	let newPwMsg = null;
	
function newPWCheck(){
	 currentPW = document.getElementById('currentPW');
	 newPW = document.getElementById('newPW');
	 newConfirmPW = document.getElementById('newConfirmPW');
	 newPwMsg = document.getElementById('newPwMsg');
	  if (newPW.value == newConfirmPW.value) {
	    newPwMsg.style.color = 'blue';
	    newPwMsg.innerHTML = '일치';
	  } else {
	   newPwMsg.style.color = 'red';
	    newPwMsg.innerHTML = '불일치';
	  }
}
function changePw(){
	 currentPW = document.getElementById('currentPW');
	 newPW = document.getElementById('newPW');
	 newConfirmPW = document.getElementById('newConfirmPW');
	if(currentPW.value == ""){
		alert('기존 비밀번호를 입력해주세요.');
	}else if(newPW.value == ""){
		alert('신규 비밀번호를 입력해주세요.');
	}else if(newConfirmPW.value == ""){
		alert('신규 비밀번호 확인을 입력해주세요.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}
  
// 회원 인증신청 시 인증 재신청
function reapply(){
	document.getElementById('reapply').style.display="block";
	document.getElementById('reapplyButton').style.display="none";
}
       