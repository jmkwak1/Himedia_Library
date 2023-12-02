 // 현재 URL을 가져오는 JavaScript 함수
function getCurrentURL() {
  return window.location.href;
}

// URL에 따라 버튼 색상을 변경하는 JavaScript 함수
function setButtonColorByURL() {
  var currentURL = getCurrentURL();
  var subNoticeElement = document.getElementById("subNotice");
  var subQnaElement = document.getElementById("subQna");
  var subFreeElement = document.getElementById("subFree");
  var subVolunteerElement = document.getElementById("subVolunteer");
  
  // 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
  if (currentURL.includes("notice") && subNoticeElement) {
      subNoticeElement.classList.add("active");
  } else if(currentURL.includes("faq") && subQnaElement){
	  subQnaElement.classList.add("active");
  } else if(currentURL.includes("free") && subFreeElement){
	  subFreeElement.classList.add("active");
  }
}

// 페이지 로드 시 버튼 색상을 설정합니다.
setButtonColorByURL();


function selectFile(inputElement){
	const selectedFile = inputElement.files[0];
	
	// 파일 크기가 10MB를 초과하는 경우
	if(selectedFile){
		const fileSize = Math.floor(selectedFile.size / 1024 / 1024);
		if(fileSize > 10){
			alert('파일 크기는 최대 10MB까지 가능합니다.');
			inputElement.value='';
			return;
		}
	}
}

// 공지사항 수정
function updateFileName(input){
	var fileNamePlaceholder = document.getElementById("fileNamePlaceholder");
    if (input.files.length > 0) {
        fileNamePlaceholder.textContent = input.files[0].name;
    } else {
        fileNamePlaceholder.textContent = "파일 선택";
    }
}


//공지사항 검색 시 search가 null값이면 parameter 안 넘어가도록
function noticeSearch(){
	var search = document.getElementById('search').value;
	
	if(search == ""){
		document.getElementById('noticeSelect').disabled = true;
		document.getElementById('search').disabled = true;
	}
	f.submit();
}

//faq 목록
function submitMenuItem(value) {
    // Set the value of the hidden input field
    document.getElementById('menuItemValue').value = value;
    
    // Submit the form
    document.getElementById('f').submit();
}


//faq 등록
function faqWriteChk(){
	var category = document.getElementById('category');
	var categoryValue = category.options[category.selectedIndex].value;
	
	var title = document.getElementById('title').value;
	var content = document.getElementById('content').value;
	
	if(categoryValue == ""){
		alert('구분을 선택하세요.');
	} else if(title == "" || title.trim().length == 0){
		alert('제목을 입력하세요.');
	} else if(content == "" || content.trim().length == 0){
		alert('내용을 입력하세요.');
	} else {
		alert('자주하는 질문이 등록되었습니다.');
		var f = document.getElementById('f');
		f.submit();
	}
}

//faq 수정
function faqUpdateChk(){
	var category = document.getElementById('category');
	var categoryValue = category.options[category.selectedIndex].value;
	
	var title = document.getElementById('title').value;
	var content = document.getElementById('content').value;
	
	if(categoryValue == ""){
		alert('구분을 선택하세요.');
	} else if(title == "" || title.trim().length == 0){
		alert('제목을 입력하세요.');
	} else if(content == "" || content.trim().length == 0){
		alert('내용을 입력하세요.');
	} else {
		alert('자주하는 질문이 수정되었습니다.');
		var f = document.getElementById('f');
		f.submit();
	}
}

//자유게시판 검색 시 search가 null값이면 parameter 안 넘어가도록
function freeSearch(){
	var freeSelect = document.getElementById('freeSelect');
	var frSelect = document.getElementById('freeSelect').options.selectedIndex;
	var freeOption = freeSelect.options[frSelect].value;

	var search = document.getElementById('search').value;
	
	if(search == ""){
		document.getElementById('freeSelect').disabled = true;
		document.getElementById('search').disabled = true;
	}
	var f = document.getElementById('f');
	f.submit();
}

//자유게시판 댓글 등록
function replyChk(){
		var reply = document.getElementById('reply').value;
		
		if(reply == "" || reply.trim().length == 0){
			alert('내용을 입력하세요.');
		} else {
			alert('댓글이 등록되었습니다.');
			var f = document.getElementById('replyContentForm');
			f.submit();
	}
}