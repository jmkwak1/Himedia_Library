package com.care.library.cultural;
import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import org.apache.catalina.mapper.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.care.library.cultural.CulturalDTO;
import com.care.library.cultural.CulturalMapper;
import com.care.library.info.NoticeDTO;
import com.care.library.member.MemberDTO;

import ch.qos.logback.core.net.SyslogOutputStream;
import jakarta.servlet.http.HttpSession;

import com.care.library.common.NotifyDTO;
import com.care.library.common.PageService;
@Service
public class CulturalService {
    @Autowired
    private CulturalMapper culturalMapper;
    
    @Autowired private HttpSession session;
    
    // 페이지 넘기기
    public void culturalForm(String cp, Model model, String type) {
    	// 현재 날짜를 LocalDate 객체로 가져오기
        LocalDate currentDate = LocalDate.now();
        // 현재 날짜에서 하루를 뺀 날짜
        LocalDate yesterday = currentDate.minusDays(1);
        // 날짜 포맷 설정
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 디버깅용 메시지 출력
        System.out.println("culturalForm 실행");

        int currentPage = 1;
        try {
            // 현재 페이지 파라미터 값 가져오기, 없을 경우 1페이지로 설정
            currentPage = Integer.parseInt(cp);
        } catch (Exception e) {
            currentPage = 1;
        }

        int pagePerBlock = 9; // 한 페이지에 보일 데이터의 수

        // 전체 데이터 개수를 데이터베이스에서 조회
        int totalCount = culturalMapper.count();
        // 현재 날짜 이후에 종료되는 문화 행사 데이터 개수 조회
        int upcomingCount = culturalMapper.countAfterDate(currentDate.format(dateFormatter));
        // 현재 날짜 이전에 종료되는 문화 행사 데이터 개수 계산
        int pastCount = totalCount - upcomingCount;
        
        // 현재 페이지의 시작과 끝 인덱스 계산
        int end = pagePerBlock * currentPage;
        int begin = end - pagePerBlock + 1;
        
        
        
        // 데이터베이스에서 현재 페이지에 해당하는 문화 행사 데이터 조회
//        ArrayList<CulturalDTO> culturalList;
        ArrayList<CulturalDTO> culturalList = new ArrayList<>();

        if (type.equals("upcoming")) {
            culturalList = culturalMapper.culturalForm(begin, end);
        } else {
            culturalList = culturalMapper.culturalFormEnd(begin, end);
        }
        
        // 조회한 문화 행사 데이터를 날짜를 기준으로 진행 중인 것과 종료된 것으로 분류
        ArrayList<CulturalDTO> upcomingCulturalList = new ArrayList<>();
        ArrayList<CulturalDTO> pastCulturalList = new ArrayList<>();

        for (CulturalDTO culturalItem : culturalList) {
            String registrationEndStr = culturalItem.getRegistrationEnd();
            // 날짜 문자열을 LocalDate 객체로 변환
            LocalDate registrationEnd = LocalDate.parse(registrationEndStr, dateFormatter);

           if (registrationEnd.isEqual(currentDate) || registrationEnd.isAfter(currentDate)) {
//            if (registrationEnd.isAfter(yesterday)) {
//            if (registrationEnd.isAfter(currentDate)) {
                // 종료 날짜가 현재 날짜 이후인 경우 진행 중인 리스트에 추가
                upcomingCulturalList.add(culturalItem);                
            } else if (registrationEnd.isBefore(currentDate)) {
                // 종료 날짜가 현재 날짜 이전인 경우 종료된 리스트에 추가
                pastCulturalList.add(culturalItem);
            }
        }
        
//        for (CulturalDTO culturalItem : culturalList) {
//            System.out.println("title: " + culturalItem.getTitle());
//            System.out.println("lecture_start: " + culturalItem.getLectureStart());
//            System.out.println("lecture_end: " + culturalItem.getLectureEnd());
//            System.out.println("registration_start: " + culturalItem.getRegistrationStart());
//            System.out.println("registration_end: " + culturalItem.getRegistrationEnd());
//            System.out.println("target: " + culturalItem.getTarget());
//            System.out.println("image_path: " + culturalItem.getImagePath());
//            System.out.println("count: " + culturalItem.getCount());
//            System.out.println("================================="); // 필요에 따라 개행을 추가하여 출력 포맷을 조절할 수 있습니다.
//        }
        
        // 페이지 블록 크기 설정
        int pageBlock = 9;

        // 페이징 처리 결과를 계산하여 변수에 할당
        String result;

        if (type.equals("upcoming")) {
            result = PageService.printPage("cullist?currentPage=", currentPage, upcomingCount, pageBlock);
        } else {
            result = PageService.printPage("culFormEnd?currentPage=", currentPage, pastCount, pageBlock);
        }

        // 진행 중인 문화 행사 목록과 종료된 문화 행사 목록을 뷰로 전달
        model.addAttribute("upcomingCulturalList", upcomingCulturalList); // 진행중
        model.addAttribute("pastCulturalList", pastCulturalList); // 종료

        // 페이징 처리 결과를 뷰로 전달
        model.addAttribute("result", result); // 페이징
        model.addAttribute("currentPage", currentPage); // 현재 페이지
        
        // 디버깅용 메시지 출력
        System.out.println("culturalForm 종료");
    }

	// 문화행사 신청 데이터를 DB에 저장하는 메서드 추가
    public String culFormWriteProc(MultipartHttpServletRequest multi) {
    	System.out.println("culFormWriteProc실행");
    	
    	CulturalDTO cultural = new CulturalDTO();
        String title = multi.getParameter("title");
        
        if (title == null || title.isEmpty()) {
            return "제목을 입력하세요.";
        }
    	// 서버로 전송할 데이터 생성
	    cultural.setTitle(multi.getParameter("title"));
	    cultural.setLectureStart(multi.getParameter("lectureStart"));
	    cultural.setLectureEnd(multi.getParameter("lectureEnd"));
	    cultural.setRegistrationStart(multi.getParameter("registrationStart"));
	    cultural.setRegistrationEnd(multi.getParameter("registrationEnd"));
	    cultural.setLectureTime(multi.getParameter("LectureTime"));
	    cultural.setLecturePlace(multi.getParameter("LecturePlace"));
	    cultural.setLectureDay(multi.getParameter("LectureDay"));
	    cultural.setLectureName(multi.getParameter("LectureName"));
	    cultural.setCost(multi.getParameter("Cost"));
	    cultural.setLectureText(multi.getParameter("LectureText"));
	    cultural.setImagePath(multi.getParameter("ImagePath"));
	    cultural.setTarget(multi.getParameter("target"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		cultural.setWriteDate(sdf.format(new Date()));
	    System.out.println("WriteDate : " + sdf.format(new Date()));
	    System.out.println("ImagePath : " + multi.getParameter("ImagePath"));
	    System.out.println("title : " + multi.getParameter("title"));
		
		/*
		 * if(multi.getParameter("title") == null ||
		 * multi.getParameter("title").isEmpty()) { return "제목을 입력하세요."; }
		 */
		
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
		    System.out.println("Save Image Path: " + cultural.getImagePath());
	        
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
		System.out.println("culFormWriteProc종료");
		return "게시글 작성 완료";
	}
	/*
	 * public void culFormWrite(String imagePath, int culId, String title, String
	 * lectureStart, String lectureEnd, String registrationStart, String
	 * registrationEnd ,String target, String writeDate) {
	 * culturalMapper.culFormWrite(imagePath, culId, title, lectureStart,
	 * lectureEnd, registrationStart, registrationEnd, target, writeDate); }
	 */
    public CulturalDTO culFormWrite(int culId) {
        System.out.println("culFormWrite 실행");
        CulturalDTO cultural = culturalMapper.culFormWrite(culId); // 해당 ID에 해당하는 데이터 가져오기
        System.out.println("culId : " + culId);
        System.out.println("culFormWrite 종료");
        return cultural;
    }
    
    //culModify 목록값 업데이트
    public void updateCulturalProc(@RequestParam("culId") int culId, MultipartHttpServletRequest multi) {
        CulturalDTO cultural = culturalMapper.culFormWrite(culId); // 기존 데이터 가져오기
        
        cultural.setTitle(multi.getParameter("title"));
        cultural.setLectureStart(multi.getParameter("lectureStart"));
        cultural.setLectureEnd(multi.getParameter("lectureEnd"));
        cultural.setRegistrationStart(multi.getParameter("registrationStart"));
        cultural.setRegistrationEnd(multi.getParameter("registrationEnd"));
        cultural.setTarget(multi.getParameter("target"));
        cultural.setLectureTime(multi.getParameter("LectureTime"));
        cultural.setLecturePlace(multi.getParameter("LecturePlace"));
        cultural.setLectureDay(multi.getParameter("LectureDay"));
        cultural.setLectureName(multi.getParameter("LectureName"));
        cultural.setCost(multi.getParameter("Cost"));
        cultural.setLectureText(multi.getParameter("LectureText"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		cultural.setWriteDate(sdf.format(new Date()));
        
        MultipartFile file = multi.getFile("upfile");
        String fileName = file.getOriginalFilename();
        
        if (file.getSize() != 0) {
            sdf = new SimpleDateFormat("yyyy-MM-dd_HH.mm.ss-");
            Calendar cal = Calendar.getInstance();
            fileName = sdf.format(cal.getTime()) + fileName;
            cultural.setImagePath(fileName);
            
            String fileLocation = "C:/javas/library/image/";
            File save = new File(fileLocation + fileName);
            
            cultural.setImagePath(fileLocation + fileName); // DB에 파일 경로 저장
            System.out.println("Save Image Path: " + cultural.getImagePath());

            File directory = new File(fileLocation);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            
            try {
                file.transferTo(save);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        culturalMapper.updateCulturalProc(cultural); // 업데이트
    }

	public void culturalDeleteProc(int culId) {
    // 여기에 데이터베이스에서 해당 culId에 해당하는 문화 행사 데이터를 삭제하는 코드를 작성합니다.
    // 삭제 작업을 구현하고, 필요한 경우 예외 처리 등을 추가하세요.
    culturalMapper.culturalDeleteProc(culId);
	}
    
}