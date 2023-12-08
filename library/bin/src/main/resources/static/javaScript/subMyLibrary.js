/*	const submyLibraryItems = document.querySelectorAll('.submyLibrary_menu');
	console.log(submyLibraryItems);
	
	function activateMenuItem() {
		// 모든 메뉴 항목에서 '활성' 클래스 제거
		submyLibraryItems.forEach(item => item.classList.remove('active'));
	
		// 클릭한 메뉴 항목에 '활성' 클래스 추가
		this.classList.add('active');
	}
	
	//기본설정으로 첫번째 li는 활성화
	submyLibraryItems[0].classList.add('active');
	
	// 클릭한 메뉴 항목에 '활성' 클래스 추가
	submyLibraryItems.forEach(item => item.addEventListener('click', activateMenuItem));
	*/
	function showMyLibSub(menu) {
	
		  var url = "/myLibrary/"+  menu;
		  console.log(url);
		  const myLibraryContent = document.querySelector('.myLibraryContent');
		  const xhr = new XMLHttpRequest();
		  xhr.open('GET', url, true);
		  xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      myLibraryContent.innerHTML = xhr.responseText;
			/*  if(menu === "myInfo"){
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
			  }
			  if(menu == "myInquiry"){
						var inqSelect = document.getElementById('inqSelect');
				  	function searchChange(){
						var select = document.getElementById('inqSelect').options.selectedIndex;
						var option = inqSelect.options[select].value;
						if(option == "reply"){
							document.getElementById('search').style.display='none';
							document.getElementById('replySelect').style.display='inline-block';
						} else {
							document.getElementById('search').style.display='inline-block';
							document.getElementById('replySelect').style.display='none';
						}
					}
					inqSelect.addEventListener('change', searchChange);
					
				  	const myInquirySearchBtn = document.getElementById('myInquirySearchBtn');
					submit 시 parameter 안 넘어가게 조절함(disabled)
					function inquirySearch(){ 
						var inqSelect = document.getElementById('inqSelect');
						var select = document.getElementById('inqSelect').options.selectedIndex;
						var option = inqSelect.options[select].value;
						
						var replySelect = document.getElementById('replySelect');
						console.log(option)
						if(option == 'title'){
							document.getElementById('replySelect').disabled = true;
						} else {
							document.getElementById('search').disabled=true;
						}
							f.submit();
					}
					myInquirySearchBtn.addEventListener('click', inquirySearch);
			  }*/
		    }
				
			  };
		  xhr.send();
	}
 // 현재 URL을 가져오는 JavaScript 함수
   function getCurrentURL() {
      return window.location.href;
    }

    // URL에 따라 버튼 색상을 변경하는 JavaScript 함수
   function setButtonColorByURL() {
      var currentURL = getCurrentURL();
      document.getElementById("subMyBookStatus").classList.add("active");
      // 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
      if (currentURL.includes("myInfo")) {
        document.getElementById("subMyInfo").classList.add("active");
        document.getElementById("subMyBookStatus").classList.remove("active");
        document.getElementById("subMyInquiry").classList.remove("active");
      } else if(currentURL.includes("myBookStatus")){
	      document.getElementById("subMyBookStatus").classList.add("active");
	      document.getElementById("subMyInquiry").classList.remove("active");
	      document.getElementById("subMyInfo").classList.remove("active");
	  }else if(currentURL.includes("myInquiry")){
	      document.getElementById("subMyInquiry").classList.add("active");
	      document.getElementById("subMyBookStatus").classList.remove("active");
	      document.getElementById("subMyInfo").classList.remove("active");
    }else if(currentURL.includes("myProgram")){
	      document.getElementById("subMyProgram").classList.add("active");
	      document.getElementById("subMyBookStatus").classList.remove("active");
	      document.getElementById("subMyInfo").classList.remove("active");
	      document.getElementById("subMyInquiry").classList.remove("active");
	}else if(currentURL.includes("myPay")){
	      document.getElementById("subMyPay").classList.add("active");
	      document.getElementById("subMyBookStatus").classList.remove("active");
	      document.getElementById("subMyInfo").classList.remove("active");
	      document.getElementById("subMyInquiry").classList.remove("active");
	}
    else if(currentURL.includes("LoanHistory")){
		 document.getElementById("subMyLoanHistory").classList.add("active");
		  document.getElementById("subMyInfo").classList.remove("active");
		   document.getElementById("subMyBookStatus").classList.remove("active");
		    document.getElementById("subMyInquiry").classList.remove("active");
	}
    }

    // 페이지 로드 시 버튼 색상을 설정합니다.
    setButtonColorByURL();

    // 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
   window.onpopstate = function () {
      setButtonColorByURL();
    };
    
