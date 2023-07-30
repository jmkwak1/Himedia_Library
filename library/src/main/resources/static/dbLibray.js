/*회원가입 시 동의*/
function agreementCheck(){
    var chk1=document.form.chk1.checked;
    var chk2=document.form.chk2.checked;
    var chk3=document.form.chk3.checked;
	if(!chk1)
	{
		alert("이용약관에 동의 해주세요");
	} else if(!chk2)
	{
		alert("개인정보 수집ㆍ이용안내에 동의 해주세요");
	}else if(!chk3)
	{
		alert("제3자 정보 제공에 대한 안내에 동의 해주세요");
	} else {
		location.href = "/register2";
	}
}

/* 회원가입 - 이메일 인증 */
function sendEmail(){
	var email = document.getElementById('email');
	label = document.getElementById('label');
	if(email.value == ""){
		label.innerHTML = '이메일을 입력해주세요.';
	} else {
		label.innerHTML = '인증 메일이 발송되었습니다.';
		document.getElementById('authNum').style.display = 'block';
		document.getElementById('confirmEmail').style.display = 'block';
	}
}

function allCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('name');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function pwCheck(){
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	label = document.getElementById('label');
	 if(pw.value == confirm.value){
		 label.innerHTML = '일치'
	 }else{
		 label.innerHTML = '불일치'
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


