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
var xhr;
function sendEmail(){
	var email = document.getElementById('authEmail');
	label = document.getElementById('label');
	if(email.value == ""){
		label.innerHTML = '이메일을 입력해주세요.';
		document.getElementById('authNum').style.display = 'none';
		document.getElementById('confirmEmail').style.display = 'none';
	} else {
		label.innerHTML = '인증 메일이 발송되었습니다.';
		document.getElementById('authNum').style.display = 'block';
		document.getElementById('confirmEmail').style.display = 'block';
		xhr = new XMLHttpRequest();
    	xhr.open('post', 'sendEmail')
    	xhr.send(document.getElementById('authEmail').value)
	}
}

function resAuth(){
	var authNum = document.getElementById('authNum');
	label = document.getElementById('label2');
	if(authNum.value == ""){
		label.innerHTML = '인증번호를 입력해주세요.';
	} else{
		xhr.open('post', 'sendAuth');
    	xhr.send(document.getElementById('authNum').value);
    	xhr.onreadystatechange = resProc
	}
}
    
function resProc(){
	if(xhr.readyState === 4 && xhr.status === 200){
		document.getElementById('label2').innerHTML = xhr.responseText;
		if(document.getElementById('label2').innerHTML === "인증 성공"){
			xhr.open('post', 'auth');
			location.href='/register3';
		}
	}
}

/* 도서관 일반 회원 가입 */
/*function allCheck(){
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

function nameCheck(){
	let name = document.getElementById('name');
	nameLabel = document.getElementById('nameLabel');
	 if(!name.value){
		 nameLabel.innerHTML = '*이름은 필수 항목입니다.'
	 }else{
		 nameLabel.innerHTML = ''
	 }
	// window.alert('pwCheck 호출')
}

function emailCheck(){
	let email = document.getElementById('email');
	emailLabel = document.getElementById('emailLabel');
	 if(!email.value){
		 emailLabel.innerHTML = '*이메일은 필수 항목입니다.'
	 }else{
		 emailLabel.innerHTML = ''
	 }
	// window.alert('pwCheck 호출')
}

function pwCheck(){
	let pw = document.getElementById('pw');
 	let confirm = document.getElementById('confirm');
  	let label = document.getElementById('label');
  
  if (pw.value == confirm.value) {
    label.style.color = 'blue';
    label.innerHTML = '일치';
  } else {
    label.style.color = 'red';
    label.innerHTML = '불일치';
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
}*/

/*아이디/비밀번호 찾기 이메일 인증*/
function auth(){
	var authNum = document.getElementById('authNum');
	label = document.getElementById('label2');
	if(authNum.value == ""){
		label.innerHTML = '인증번호를 입력해주세요.';
	} else{
		xhr.open('post', 'sendAuth');
    	xhr.send(document.getElementById('authNum').value);
    	xhr.onreadystatechange = resProcId
	}
}
    
function resProcId(){
	if(xhr.readyState === 4 && xhr.status === 200){
		document.getElementById('label2').innerHTML = xhr.responseText;
		if(document.getElementById('label2').innerHTML === "인증 성공"){
			xhr.open('post', 'findMemberIdMailResult');
			var f = document.getElementById('emailForm');
			f.submit();
		}
	}
}

function findPwIdChk(){
	var authId = document.getElementById('authId').value;
	label = document.getElementById('label3');
	if(authId == ""){
		label.innerHTML = '아이디를 입력해주세요.';
	} else {
		xhr = new XMLHttpRequest();
		xhr.open('post', 'findPw');
		xhr.send(document.getElementById('authId').value);
		xhr.onreadystatechange = resProcIdChk;
	}
}

function resProcIdChk(){
	if(xhr.readyState === 4 && xhr.status === 200){
		var label3 = document.getElementById('label3');
		label3.innerHTML = xhr.responseText;
		if(document.getElementById('label3').innerHTML === "아이디가 확인되었습니다."){
			findId = document.getElementById('authId').value;
			document.getElementById('authEmailBtn').style.display = 'block';
			document.getElementById('authEmail').style.display = 'block';
		}
	}
}

function changePwCheck(){
	let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/;
	var changePw = document.getElementById('changePw');
 	var confirmChangePw = document.getElementById('confirmChangePw');
  	label = document.getElementById('confirmResult');
  	if(regExp.test(changePw.value)==false){
		label.innerHTML = '5~20자의&nbsp;영문&nbsp;소문자,&nbsp;숫자와&nbsp;특수기호(_),(-)만&nbsp;사용&nbsp;가능합니다.';
	  } else {
			if (changePw.value == confirmChangePw.value) {
				label.innerHTML = '두 비밀번호가 일치합니다.';
			} else {
				label.innerHTML = '두 비밀번호를 같게 입력하세요.';
	  }
  }
}

