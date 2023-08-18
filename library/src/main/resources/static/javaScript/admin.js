 // 현재 URL을 가져오는 JavaScript 함수
function getCurrentURL() {
  return window.location.href;
}

// URL에 따라 버튼 색상을 변경하는 JavaScript 함수
function setButtonColorByURL() {
  var currentURL = getCurrentURL();
  // 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
  if (currentURL.includes("member")) {
      document.getElementById("subMember").classList.add("active");
  } else if(currentURL.includes("inquiry")){
	  document.getElementById("subInquiry").classList.add("active");
  }

}

// 페이지 로드 시 버튼 색상을 설정합니다.
setButtonColorByURL();

// 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
window.onpopstate = function () {
  setButtonColorByURL();
}

// 회원관리 탭 클릭 시 화면 전환
function showMember(menu){
	var url = "/admin/"+ menu;
	const memberContainer = document.getElementById('memberContainer');
        const xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            memberContainer.innerHTML = xhr.responseText;
          }
        };
        xhr.send();
}


// 회원관리 - 조회조건

function condition(){
	var li = document.getElementById('activeLi').textContent;
	if(li == '인증 승인/반려'){
		document.getElementById('idLbl').style.display="none";
		document.getElementById('searchSelect').style.display="none";
		document.getElementById('memberSearch').style.display="none";
	}
}

// 회원인증 상세화면
function deputyApply(){
	var select = document.getElementById('userGroup');
	var value = select.options[select.selectedIndex].value; // select에서 선택된 option의 value
	if (value != 'child'){
		document.getElementById('deputy').style.display='none';
	} else {
		document.getElementById('deputy').style.display='inline-block';
	}
}

//회원인증 상세화면에서 보호자체크
function deChk() {
    var deputyChk1 = document.getElementById('deputyChk1');
    if(deputyChk1.checked == true){
    	document.getElementById('deputyGuardian').style.display='inline-block';
    } else{
    	document.getElementById('deputyGuardian').style.display='none';
    }

	var deputyChk3 = document.getElementById('deputyChk3');
	if(deputyChk3.checked == true){
    	document.getElementById('guardianPaper').style.display='inline-block';
	}else{
    	document.getElementById('guardianPaper').style.display='none';
	}
    console.log(deputyChk3.checked); // Use 'checked' to get the checkbox value
}

//회원인증 화면에서 인증
function certify(){
	var group = document.getElementById('userGroup');
	var groupValue = group.options[group.selectedIndex].value;
	
	if(groupValue == ""){
		alert('회원분류를 선택하세요.');
	} else {
		var paper = document.getElementById('paper');
		var paperValue = paper.options[paper.selectedIndex].value;
		if(paperValue == ""){
			alert('신청서류를 선택하세요.');
		} else {
			if(groupValue == 'child' && paperValue != 'resident'){
				alert('신청서류를 확인하세요.');
			} else if(groupValue == 'student' && (paperValue == 'driving') || paperValue == 'alien'){
				alert('신청서류를 확인하세요.')
			} else if(groupValue != 'foreign' && paperValue == 'alien'){
				alert('신청서류를 확인하세요.')
			} else {
				var f = document.getElementById('f');
				f.submit();
			}
		}
	}
}

//회원인증 화면에서 반려
function rejectProc(){
	var reject = document.getElementById('reject').value;
	if(reject == '' || reject.trim().lengh == 0){
		alert('반려 사유를 작성하세요.');
	} else {
		var f = document.getElementById('f');
		f.submit();
	}
}

// 1:1문의 작성시 답변 관련
function replyProc(){
	var content = document.getElementById('content').value;
	if(content == "" || content.trim().length == 0){
		alert('답변을 입력하세요.');
	} else {
		if(confirm('답변 등록 후 수정이 불가합니다. 답변을 등록하시겠습니까?') == true){
			alert('답변이 등록되었습니다.');
			var f = document.getElementById('f');
			f.submit();
		}
	}
}
