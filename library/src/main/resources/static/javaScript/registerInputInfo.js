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
    
	var xhr;
	var idCheckBtnClicked = false;
	function idCheckSend() {
		// Ajax 요청을 초기화합니다
		
		xhr = new XMLHttpRequest();
		xhr.open('post', 'exist');
		var idCheck = document.getElementById('id');
		var button = document.getElementById('idCheckBtn');
		console.dir(button);
		xhr.send(idCheck.value); 
		
 		xhr.onreadystatechange = idCheckResProc;
	}
	function idCheckResProc(){
		
		// readyState 4: 완료(성공 여부 상관X)
		if(xhr.readyState !== 4)  
			return; 
		
		if(xhr.status === 200) { //응답의 성공 여부를 알 수 있음.
		 // status 200: 성공
		console.log(xhr.responseText); // '반환된 텍스트'
		//var idCheckLabel = document.getElementById('idCheckLabel');
		var idMessage = document.getElementById("idCondition");
		
		//idMessage.style.diplay = "none";
			if(xhr.responseText === "사용 가능한 아이디 입니다."){
				idCheckBtnClicked = true;
				idMessage.style.color = "blue";
			}else{
				idMessage.style.color = "red";
			}
			idMessage.innerHTML = xhr.responseText;
		} else {
			console.log('에러: ' + xhr.status); // 요청 도중 에러 발생
		} 
	}
	
	function allCheck(){
		const id = document.getElementById('id');
		const pw = document.getElementById('pw');
		const confirm = document.getElementById('confirm');
		const userName = document.getElementById('name');
		const email = document.getElementById('email');
		
		if(userName.value == ""){
			alert('이름 필수 항목입니다.');
		}else if(id.value == ""){
			alert('아이디 필수 항목입니다.');
		}else if(idCheckBtnClicked === false){
			alert('아이디 중복 체크가 필요합니다.');
		}else if(pw.value == ""){
			alert('비밀번호는 필수 항목입니다.');
		}else if(confirm.value == ""){
			alert('비밀번호 확인은 필수 항목입니다.');
		}else if(email !== null && email.value == ""){
			alert('이메일은 필수 항목입니다.');
		}else if(postCode.value == ""){
			alert('주소는 필수 항목입니다.');
		}else if(mobile.value == ""){
			alert('연락처는 필수 항목입니다.');
		}else{
			// 등록일자 입력란에 현재 시간을 설정
		    const regDateInput = document.getElementById('regDate');
		    const currentDate = new Date();
		   	console.log(currentDate);
		    const formattedDate = currentDate.toISOString().slice(0, 10);
		   	console.log(currentDate);
		    regDateInput.value = formattedDate;
		    
		    console.log("formattedDate : ", formattedDate);
			var f = document.getElementById('f');
			f.submit();
		}
	}

	function nameCheck(){
		let name = document.getElementById('name');
		nameLabel = document.getElementById('nameLabel');
		 if(!name.value){
			 nameLabel.innerHTML = '*이름은 필수 항목입니다.';
			 nameLabel.style.fontWeight = '400'; 
		 }else{
			 nameLabel.innerHTML = '';
		 }
	}

	function emailCheck(){
		let email = document.getElementById('email');
		emailLabel = document.getElementById('emailLabel');
		 if(!email.value){
			 emailLabel.innerHTML = '*이메일은 필수 항목입니다.'
		 }else{
			 emailLabel.innerHTML = ''
		 }
	}
		
	function idRegCheck() {
		  const idInput = document.getElementById("id");
		  const id = idInput.value;
		  const idMessage = document.getElementById("idCondition");

		  // 6~12자리의 영문 또는 숫자 혼용, 특수 문자 제외 정규식
		  const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
		  if (regex.test(id)) {
			  idMessage.textContent = "유효한 아이디 입니다.";
			  idMessage.style.color = "green";
		  } else {
		    idMessage.textContent = "6~12자리의 영문 또는 숫자 혼용, 특수 문자 제외로 입력하세요.";
		    idMessage.style.color = "red";
		  }
	}
		
	function pwRegCheck() {
		  const passwordInput = document.getElementById("pw");
		  const password = passwordInput.value;
		  const confirmInput = document.getElementById("confirm");
		  const passwordMessage = document.getElementById("passwordCondition");
		  
		  if(passwordInput.value == ""){
			  confirmInput.disabled = true;
		  }
		  // 비밀번호는 8 ~ 12자리이며, 반드시 영문자와 숫자를 혼합하여 입력하시기 바랍니다. (특수문자 제외)
		  const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/;
			if (regex.test(password)) {
			  	confirmInput.disabled = false;
			  	passwordMessage.textContent = "유효한 비밀번호 입니다.";
			  	passwordMessage.style.color = "green";
		  } else {
				passwordMessage.textContent = "비밀번호는 8 ~ 12자리이며, 반드시 영문자와 숫자를 혼합하여 입력하세요. (특수문자 제외)";
		    	passwordMessage.style.color = "red";
		  }
	}
		
	function pwConfirmCheck(){
		const pw = document.getElementById('pw');
		const confirmInput = document.getElementById("confirm");
		const pwConfirmCaution = document.getElementById("pwConfirmCaution");
		const pwConfirmMatch = document.getElementById('pwConfirmMatch');
		
		
		if (confirmInput.value === "") {
			pwConfirmCaution.style.display = "block";
		} else {
			pwConfirmCaution.style.display = "none";
		}
		 
		if (pw.value == confirmInput.value) {
		 pwConfirmMatch.style.color = 'blue';
		 pwConfirmMatch.innerHTML = '일치';
		} else {
		 pwConfirmMatch.style.color = 'red';
		 pwConfirmMatch.innerHTML = '불일치';
		}
		// window.alert('pwCheck 호출')
	}

	function loginCheck(){
		let id = document.getElementById('id');
		let pw = document.getElementById('pw');
		
		if(id.value == ""){
			alert('아이디는 필수 항목입니다.');
		}else if(pw.value == ""){
			alert('비밀번호는 필수 항목입니다.');
		}else{
			var f = document.getElementById('f');
			f.submit();
		}
	}
				
	$(function() {
	  $('input[name="birth"]').daterangepicker({
	    singleDatePicker: true,
	    autoApply: true,
	    showDropdowns: true,
	    startDate: '1993-12-10',
	    minYear: 1940,
	    maxYear: parseInt(moment().format('YYYY'), 10),
	    locale: {
	      format: 'YYYY-MM-DD'
	    }
	  }, function(start, end, label) {
	    $('input[name="birth"]').val(start.format('YYYY-MM-DD'));
	  });
	});