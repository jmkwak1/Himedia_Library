package com.care.library.cultural;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpSession;

@Controller
public class CulturalController {
    @Autowired
    private CulturalService service;
    @Autowired 
    private HttpSession session;

    @RequestMapping("cullist")
    public String cullist(
            @RequestParam(value = "currentPage", required = false) String cp,
            Model model) {
        System.out.println("cullist 호출");
        service.culturalForm(cp, model, "upcoming");
        return "cultural/cullist"; // 뷰 이름 설정
    }

    @RequestMapping("culFormEnd")
    public String culFormEnd(
            @RequestParam(value = "currentPage", required = false) String cp,
            Model model) {
        System.out.println("culFormEnd 호출");
        service.culturalForm(cp, model, "past");
        return "cultural/culFormEnd"; // 뷰 이름 설정
    }
	
	/*
	 * @RequestMapping("culWrite") public String culWrite() { return
	 * "cultural/culWrite"; }
	 */
    
	/*
	 * @RequestMapping("culWrite") public String culWrite(String imagePath, int
	 * culId, String title, String lectureStart, String lectureEnd, String
	 * registrationStart, String registrationEnd ,String target, String writeDate) {
	 * service.culFormWrite(imagePath, culId, title, lectureStart, lectureEnd,
	 * registrationStart, registrationEnd, target, writeDate); return
	 * "cultural/culWrite"; // 뷰 페이지로 이동 }
	 */
	/*
	 * @RequestMapping("culWrite") public String culWrite(CulturalDTO cultural) {
	 * service.culFormWrite(cultural);
	 * System.out.println("CulturalController_culWrite 확인"); return
	 * "cultural/culWrite"; // 뷰 페이지로 이동 }
	 */
    @RequestMapping("culWrite")
    public String getCultural(@RequestParam("culId") int culId, Model model) {
    	CulturalDTO cultural = service.culFormWrite(culId); // 데이터 가져오기
        model.addAttribute("cultural", cultural); // JSP로 데이터 전달
        return "cultural/culWrite"; // 뷰 페이지로 이동
    }
	/*
	 * @RequestMapping("culModify") public String culModify(String id) {
	 * service.culModify(id); System.out.println("CulturalController_culWrite 확인");
	 * return "cultural/culModify"; // 뷰 페이지로 이동 }
	 */
    
    @GetMapping("culModify")
	public String culModify(@RequestParam("culId") int culId, Model model) {
        System.out.println("culModify호출");
    	CulturalDTO cultural = service.culFormWrite(culId); 
    	model.addAttribute("cultural", cultural); // 해당 CulturalDTO를 모델에 추가
    	System.out.println("culModify종료");
		return "cultural/culModify";
	}
    
    //업데이트
    @PostMapping("updateCulturalProc")
    public String updateCulturalProc(@RequestParam("culId") int culId, MultipartHttpServletRequest multi) {
    	System.out.println("updateCulturalProc호출");
        // 파일 업로드 및 DB 업데이트 수행
//        service.updateCulturalProc(culId, multi);
        
        System.out.println("updateCulturalProc종료");
        // 업데이트가 완료되면 목록 화면으로 리다이렉트합니다.
        return "cultural/cullist"; 
    }

	
	/*
	 * @PostMapping("/admin/memberConfirmProc") public String
	 * memberConfirmProc(String id, String userGroup, String paper, String reject) {
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); String authDate =
	 * sdf.format(new Date()); service.memberConfirm(id, userGroup, paper, authDate,
	 * reject); return "redirect:/admin/member"; }
	 */
    
    //첫화면
    @RequestMapping("cultural")
	public String cultural() {
		return "cultural/cultural";
	}
	
	@RequestMapping("culResult")
	public String culResult() {
		return "cultural/culResult";
	}
	
	//입력
    @RequestMapping("culSubmit")
	public String culSubmit() {
		return "cultural/culSubmit";
	}
    
    //처리
    @PostMapping("culFormWriteProc")
    public String culFormWriteProc(Model model, MultipartHttpServletRequest multi){
        String msg = service.culFormWriteProc(multi);
		System.out.println("culFormWriteProc_Controller_Start");
		System.out.println("multi : " + multi);
	
		if(msg.equals("게시글 작성 완료")) {
			System.out.println("게시글 작성 완료");
			return "redirect:cullist";
		}
		
		model.addAttribute("msg", msg);
		System.out.println("culFormWriteProc_Controller_End");
		return "cultural/culSubmit";
	}
    
    //삭제
    @RequestMapping("culturalDeleteProc")
    public String culturalDeleteProc(@RequestParam("culId") int culId) {
        service.culturalDeleteProc(culId);
        return "cultural/cullist"; 
    }
}
