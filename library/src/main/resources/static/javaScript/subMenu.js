 // 현재 URL을 가져오는 JavaScript 함수
    function getCurrentURL() {
      return window.location.href;
    }

    // URL에 따라 버튼 색상을 변경하는 JavaScript 함수
    function setButtonColorByURL() {
      var currentURL = getCurrentURL();
      console.log(document.getElementById("subLogin"))
      
      // 원하는 URL 패턴에 따라 버튼 색상을 변경합니다.
      if (currentURL.includes("login")) {
        document.getElementById("subLogin").classList.add("active");
        document.getElementById("subRegister").classList.remove("active");
        document.getElementById("subFindMemberId").classList.remove("active");
        document.getElementById("subDeleteMember").classList.remove("active");
      } else if (currentURL.includes("register")) {
        document.getElementById("subRegister").classList.add("active");
        document.getElementById("subLogin").classList.remove("active");
        document.getElementById("subFindMemberId").classList.remove("active");
        document.getElementById("subDeleteMember").classList.remove("active");
      } else if (currentURL.includes("findMemberId")) {
        document.getElementById("subFindMemberId").classList.add("active");
        document.getElementById("subLogin").classList.remove("active");
        document.getElementById("subRegister").classList.remove("active");
        document.getElementById("subDeleteMember").classList.remove("active");
      } else if (currentURL.includes("deleteMember")){
		document.getElementById("subDeleteMember").classList.add("active");
        document.getElementById("subLogin").classList.remove("active");
        document.getElementById("subRegister").classList.remove("active");
        document.getElementById("subFindMemberId").classList.remove("active");
	  }
        else if (currentURL.includes("cultural")) {
        document.getElementById("cultural").classList.add("active");
        document.getElementById("cullist").classList.remove("active");
      } else if (currentURL.includes("cullist")) {
        document.getElementById("cullist").classList.add("active");
        document.getElementById("cultural").classList.remove("active");
      }
    }

    // 페이지 로드 시 버튼 색상을 설정합니다.
    setButtonColorByURL();

    // 페이지 URL이 변경될 때마다 버튼 색상을 업데이트합니다.
    window.onpopstate = function () {
      setButtonColorByURL();
    };