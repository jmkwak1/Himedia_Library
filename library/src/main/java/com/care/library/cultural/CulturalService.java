package com.care.library.cultural;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.library.cultural.CulturalDTO;
import com.care.library.cultural.CulturalMapper;

import jakarta.servlet.http.HttpSession;

import com.care.library.common.PageService;

@Service
public class CulturalService {
    @Autowired
    private CulturalMapper culturalMapper;
    @Autowired private HttpSession session;
    
    CulturalDTO cultural = new CulturalDTO();
    
    // 페이지 넘기기
    public void culturalForm(String cp, Model model) {
    	System.out.println("Image Path: " + cultural.getImagePath());
        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(cp);
        } catch (Exception e) {
            currentPage = 1;
        }

        int pagePerBlock = 3; // 한 페이지에 보일 데이터의 수
        int pageBlock = 3; // 한 번에 보여줄 페이지 번호들의 그룹 개수
        int end = pagePerBlock * currentPage; // 테이블에서 가져올 마지막 행번호
        int begin = end - pagePerBlock + 1; // 테이블에서 가져올 시작 행번호

        ArrayList<CulturalDTO> culturalList = culturalMapper.culturalForm(begin, end);
        int totalCount = culturalMapper.count();
        String url = "culForm?currentPage=";
        String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

        model.addAttribute("culturalList", culturalList);
        model.addAttribute("result", result);
        model.addAttribute("currentPage", currentPage);
    }

//    public void culForm(String cp, Model model) {
//        int currentPage = 1;
//        try {
//            currentPage = Integer.parseInt(cp);
//        } catch (Exception e) {
//            currentPage = 1;
//        }
//
//        int pagePerBlock = 3; // 한 페이지에 보일 데이터의 수
//        int pageBlock = 3; // 한 번에 보여줄 페이지 번호들의 그룹 개수
//        int end = pagePerBlock * currentPage; // 테이블에서 가져올 마지막 행번호
//        int begin = end - pagePerBlock + 1; // 테이블에서 가져올 시작 행번호
//
//        ArrayList<CulturalDTO> culturalList = culturalMapper.culForm(begin, end);
//        int totalCount = culturalMapper.count();
//        String url = "culForm?currentPage=";
//        String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
//
//        model.addAttribute("culturalList", culturalList);
//        model.addAttribute("result", result);
//        model.addAttribute("currentPage", currentPage);
//        System.out.println("Image Path: " + cultural.getImagePath());
//    }


	// 문화행사 신청 데이터를 DB에 저장하는 메서드 추가
    public String culFormWriteProc(MultipartHttpServletRequest multi, String lectureStart, String lectureEnd, String registrationStart, String registrationEnd) {
    	System.out.println("3");

    	// 서버로 전송할 데이터 생성
	    CulturalDTO cultural = new CulturalDTO();
	    cultural.setTitle(multi.getParameter("title"));
	    cultural.setLectureStart(lectureStart);
	    cultural.setLectureEnd(lectureEnd);
	    cultural.setRegistrationStart(registrationStart);
	    cultural.setRegistrationEnd(registrationEnd);
	    cultural.setTarget(multi.getParameter("target"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		cultural.setImagePath("");
		cultural.setWriteDate(sdf.format(new Date()));
	    System.out.println("WriteDate" + sdf.format(new Date()));
		
		if(cultural.getTitle() == null || cultural.getTitle().isEmpty()) {
			return "제목을 입력하세요.";
		}
		
		MultipartFile file = multi.getFile("upfile");
		String fileName = file.getOriginalFilename();
		
		if (file.getSize() != 0) {
		    // 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
		    sdf = new SimpleDateFormat("yyyy-MM-dd_HH.mm.ss-");
		    Calendar cal = Calendar.getInstance();
		    fileName = sdf.format(cal.getTime()) + fileName;
		    cultural.setImagePath(fileName);
		    
		    // 업로드 파일 저장 경로
		    String fileLocation = "C:/javas/library/image/";
		    File save = new File(fileLocation + fileName);
		    
		    //사진경로전체 DB에 넣기
		    cultural.setImagePath(fileLocation + fileName);
		    System.out.println("Image Path: " + cultural.getImagePath());
	        
		    // 디렉토리가 없는 경우 생성
		    File directory = new File(fileLocation);
		    if (!directory.exists()) {
		        directory.mkdirs();
		    }
		    
		    try {
		        // 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
		        file.transferTo(save);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		
		culturalMapper.culFormWriteProc(cultural);
		return "게시글 작성 완료";
	}

}
