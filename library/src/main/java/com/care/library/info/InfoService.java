package com.care.library.info;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.library.common.NotifyDTO;
import com.care.library.common.NotifyService;
import com.care.library.common.PageService;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class InfoService {
	
	@Autowired InfoMapper mapper;
	@Autowired NotifyService notiService;
	
	@Value("${upload.path}")
	private String uploadPath;

	public void noticeWrite(String id, String title, String content, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		
		if(file.getSize() != 0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			
			//업로드 파일 저장 경로
			String fileLocation = uploadPath;
			File save = new File(fileLocation, fileName);
			
			//폴더 존재 여부 확인
			if(!save.getParentFile().exists()) {
				save.getParentFile().mkdir();
			}
			
			//서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
			try {
				file.transferTo(save);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			fileName = "첨부파일 없음";
		}
		
		NoticeDTO notice = new NoticeDTO();
		
		int no;
		try {
			no = mapper.findMaxNum();
		} catch (Exception e) {
			no = 0;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String writeDate = sdf.format(new Date());
		
		notice.setNo(no+1);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setFileName(fileName);
		notice.setWriter(id);
		notice.setWriteDate(writeDate);
		notice.setHits(0);
		notice.setImageName("");
		
		mapper.writeNotice(notice);
	}

	public void selectAllNotice(String cp, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<NoticeDTO> notices = mapper.selectAllNotice(begin, end);
		
		String url = "notice?currentPage=";
		int totalCount = mapper.count();
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("notices", notices);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public void selectNotice(String cp, String select, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<NoticeDTO> notices = mapper.selectNotice(select, search, begin, end);
		
		String url = "notice?select="+select+"&search="+search+"&currentPage=";
		int totalCount = mapper.count();
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("notices", notices);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public void noticeContent(int no, Model model) {
		NoticeDTO notice = mapper.selectNoticeContent(no);
		mapper.updateNoticeHit(no);
		model.addAttribute("notice", notice);
	}
	
	public void fileDownload(int no, HttpServletResponse response) {
		NoticeDTO notice = mapper.selectNoticeContent(no);
		String fileName = notice.getFileName();
		String filePath = "C:\\javas\\upload\\" + fileName;
		
		try (FileInputStream fis = new FileInputStream(filePath);
				OutputStream os = response.getOutputStream()) {
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			
			byte[] buffer = new byte[1024];
			int bytesRead;
			
			while ((bytesRead = fis.read(buffer)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void noticeUpdate(int no, Model model) {
		NoticeDTO notice = mapper.selectNoticeContent(no);
		model.addAttribute("notice", notice);
	}

	public void noticeUpdateProc(int no, MultipartHttpServletRequest multi, MultipartFile file) {
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		String fileName = file.getOriginalFilename(); //새로운 파일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar cal = Calendar.getInstance();
		fileName = sdf.format(cal.getTime()) + fileName;
		
		NoticeDTO notice = mapper.selectNoticeContent(no);
		String oldFile = notice.getFileName();
		
		if(oldFile.equals("첨부파일 없음")) {
			mapper.updateNotice(no, title, content);
		} else {
			if(oldFile.equals(fileName) == false) {
				// 예전 파일 삭제
				String saveDir = "C:\\javas\\upload\\"+ oldFile;
				
				File f = new File(saveDir); 
				if(f.exists() == true){
					f.delete();
				}
				
				//업로드 파일 저장 경로
				String fileLocation = uploadPath;
				File save = new File(fileLocation, fileName);
				
				//폴더 존재 여부 확인
				if(!save.getParentFile().exists()) {
					save.getParentFile().mkdir();
				}
				
				//서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				try {
					file.transferTo(save);
				} catch(Exception e) {
					e.printStackTrace();
				}
				notice.setFileName(fileName);
			}
			notice.setTitle(title);
			notice.setContent(content);
			mapper.updateNoticeFile(notice);
		}
	}

	public void noticeDelete(int no) {
		NoticeDTO notice = mapper.selectNoticeContent(no);
		String fileName = notice.getFileName();
		String saveDir = "C:\\javas\\upload\\"+fileName;
		
		File f = new File(saveDir);
		if(f.exists() == true){
			f.delete();
		}
		mapper.deleteNotice(no);
	}

	public void faqWrite(String category, String title, String content) {
		FaqDTO faq = new FaqDTO();
		int no;
		
		try {
			no = mapper.findMaxNumFaq();
		} catch (Exception e) {
			no = 0;
		}
		
		faq.setNo(no+1);
		faq.setCategory(category);
		faq.setTitle(title);
		faq.setContent(content);
		mapper.writeFaq(faq);
	}

	public void selectFaq(String category, Model model) {
		ArrayList<FaqDTO> faqs = mapper.selectFaq(category);
		model.addAttribute("faqs", faqs);
	}

	public void faqContent(int no, Model model) {
		FaqDTO faq = mapper.selectFaqContent(no);
		
		model.addAttribute("faq", faq);
	}

	public void faqUpdate(int no, String category, String title, String content) {
		FaqDTO faq = mapper.selectFaqContent(no);
		faq.setCategory(category);
		faq.setTitle(title);
		faq.setContent(content);
		mapper.updateFaq(faq);
	}

	public void faqDelete(int no) {
		FaqDTO faq = mapper.selectFaqContent(no);
		mapper.deleteFaq(no);
	}

	public void freeWrite(String title, String content, String id) {
		FreeDTO free = new FreeDTO();
		
		int no;
		try {
			no = mapper.findMaxNumFree();
		} catch (Exception e) {
			no = 0;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String writeDate = sdf.format(new Date());
		
		free.setNo(no+1);
		free.setTitle(title);
		free.setContent(content);
		free.setWriter(id);
		free.setWriteDate(writeDate);
		free.setHits(0);
		free.setReplies(0);
		mapper.writeFree(free);
	}

	public void selectAllFree(String cp, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<FreeDTO> frees = mapper.selectAllFree(begin, end);
		
		String url = "free?currentPage=";
		int totalCount = mapper.countFreeAll();
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("frees", frees);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public void selectFree(String cp, String select, String search, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<FreeDTO> frees = mapper.selectFree(select, search, begin, end);
		
		String url = "free?currentPage=";
		int totalCount = mapper.countFreeAll();
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("frees", frees);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	public void freeContent(int no, Model model) {
		FreeDTO free = mapper.selectFreeContent(no);
		mapper.updateFreeHits(no);
		
		ArrayList<ReplyDTO> replies = mapper.selectNoticeReply(no);
		
		model.addAttribute("free", free);
		model.addAttribute("replies", replies);
	}

	public void freeUpdateProc(int no, String title, String content) {
		FreeDTO free = mapper.selectFreeContent(no);
		free.setTitle(title);
		free.setContent(content);
		mapper.updateFree(free);
	}

	public void freeDelete(int no) {
		mapper.deleteFree(no);
	}

	public void freeReplyWrite(String id, String content, int freeNo) {
		ReplyDTO reply = new ReplyDTO();
		
		int no;
		try {
			no = mapper.findMaxNumFreeReply();
		} catch (Exception e) {
			no = 0;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String writeDate = sdf.format(new Date());
		
		reply.setNo(no+1);
		reply.setContent(content);
		reply.setWriteDate(writeDate);
		reply.setWriter(id);
		reply.setFreeNo(freeNo);
		
		mapper.writeFreeReply(reply);
		
		FreeDTO free = mapper.selectFreeContent(freeNo);
		String freeWriter = free.getWriter();
		int replies = mapper.countReply(freeNo);
		mapper.updateFreeReply(freeNo, replies);

		NotifyDTO notification = new NotifyDTO();
		notification.setId(freeWriter);
		notification.setCategory("게시판");
		notification.setTitle("댓글이 등록되었습니다.");
		notification.setUrl("/info/free");
		notiService.register(notification);
	}

	public void freeReplyDelete(int no) {
		mapper.deleteReply(no);
	}

	public void freeReplyAllDelete(int no) {
		mapper.deleteAllReply(no);
	}



}
