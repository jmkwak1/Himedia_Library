  // 파일 선택 시, 파일명을 버튼 텍스트로 업데이트하는 함수
  function showFileName() {
    const fileInput = document.getElementById("fileInput");
    const fileNameDisplay = document.getElementById("fileNameDisplay");
    const selectedFileName = fileInput.value.split("\\").pop(); // 파일명 추출 (IE11 대응)

    if (selectedFileName) {
      fileNameDisplay.textContent = selectedFileName; // 파일명을 버튼 텍스트로 표시
      console.log("File selected:", selectedFileName);
    } else {
      fileNameDisplay.textContent = "첨부된 파일이 없음";
      console.log("No file selected.");
    }
  }

/* 파일첨부 input 요소를 숨김 */
/*  
.file-upload-input {
    display: none;
  }

  /*파일첨부 버튼 스타일 
  .file-upload-btn {
    padding: 0px 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    color: #555;
    cursor: pointer;
  }

  /* 파일첨부 input 요소를 숨김
  .file-upload-input {
    display: none;
  }

  /* 파일명을 보여주는 요소 스타일 
  #fileNameDisplay {
    padding: 0px 20px;
/*     border: 1px solid #ccc;
    background-color: #f9f9f9;
    color: #555;
  }
*/
