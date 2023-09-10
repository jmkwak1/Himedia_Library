package com.care.library.search;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.care.library.common.NotifyDTO;
import com.care.library.common.NotifyService;
import com.care.library.common.PageService;
import com.care.library.info.NoticeDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

@EnableScheduling
@Service
public class SearchService {

	@Autowired
	SearchMapper mapper;
	@Autowired NotifyService notiService;
	// 주기적으로 받아오는 것은 나중에하쟈...
	// 초, 분, 시간, 일, 월, 요
//	@Scheduled(cron = "0/1 * * * * *", zone = "Asia/Seoul")
//	public void test() {
//		System.out.println("스케줄");
//	}
	// 요청 URL 만들

//	@Async
	public String checkTotalDB() {
		int numberOftotal = mapper.checkTotalDB();
		if (numberOftotal < 40) {
			ArrayList<BookDTO> popData = mapper.getTable("popularBook");
			ArrayList<BookDTO> recentData = mapper.getTable("recentBook");
			if (popData != null && recentData != null) {
				insertBooks(popData, "totalBook");
				insertBooks(recentData, "totalBook");
				return "전체 도서 db가 완료되었습니다.";
			}
		}
		return null;
	}

	public String reqUrlParam(String whichDataAPI, String restParam, int pageNo, int pageSize) {
		String url = "http://data4library.kr/api/" + whichDataAPI;

		String urlParam = "?authKey=8d6b32bd9b40ff27779c0cd9cd76329dd858b557eff8d78747d43e3845117641";
		urlParam += restParam;
		urlParam += "&pageNo=" + pageNo;
		urlParam += "&pageSize=" + pageSize;
		url = url + urlParam;

		return url;
	}

	public String reqUrlParam(String whichDataAPI, String restParam) {
		String url = "http://data4library.kr/api/" + whichDataAPI;

		String urlParam = "?authKey=8d6b32bd9b40ff27779c0cd9cd76329dd858b557eff8d78747d43e3845117641";
		urlParam += restParam;
		url = url + urlParam;

		return url;
	}

	// @Scheduled(cron = "0 0 0 1 * 0", zone = "Asia/Seoul") // 매월 1일 요일 00:00:00에
	public String connAPI(String url) {
		System.out.println("API요청");
		String xmlResponse = null;

		System.out.println(url);
		try {

			// 인기 대출 도서 조회하기 (loanItemSrch)

			URL requestUrl = new URL(url);

			HttpURLConnection conn = (HttpURLConnection) requestUrl.openConnection();
			conn.setRequestMethod("GET"); // GET 요청 설정
			conn.setRequestProperty("Accept", "application/xml"); // Accept 헤더 설정 (응답 형식 지정)

			int responseCode = conn.getResponseCode(); // 요청 보내고 응답 코드 받기
			if (responseCode == HttpURLConnection.HTTP_OK) { // 성공적인 응답
				BufferedReader in = new BufferedReader(
						new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
				String inputLine;
				StringBuilder response = new StringBuilder();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				// System.out.println("response : "+response);
				in.close();

				// xml을 문자열로 바꿈
				xmlResponse = response.toString();
			} else {
				System.out.println("GET request failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return xmlResponse;
	}

	public ArrayList<BookDTO> xmltoArrayList(String xmlResponse, String tagName) {
		ArrayList<BookDTO> books = null;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;

			dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(new InputSource(new StringReader(xmlResponse)));

			doc.getDocumentElement().normalize();

			Node loanBooksNode = doc.getElementsByTagName(tagName).item(0);
			NodeList docList = loanBooksNode.getChildNodes();
			books = new ArrayList<>(); // Book 객체들을 저장할 리스트 생성

			for (int i = 0; i < docList.getLength(); i++) {
				Node docNode = docList.item(i);
				if (docNode.getNodeType() == Node.ELEMENT_NODE) {
					Element docElement = (Element) docNode;
					BookDTO book = new BookDTO();

					NodeList rankingNodes = docElement.getElementsByTagName("ranking");
					if (rankingNodes != null && rankingNodes.getLength() > 0) {
						String ranking = rankingNodes.item(0).getTextContent();
						book.setRanking(ranking);
					}

					NodeList volNodes = docElement.getElementsByTagName("vol");
					if (volNodes != null && volNodes.getLength() > 0) {
						String vol = volNodes.item(0).getTextContent();
						if(vol == "") {
							book.setVol("10"); //null이 너무 많아서 10으로 임의로 두겠다.
						}else {
							book.setVol(vol);
						}
					}

					String publicationYear = docElement.getElementsByTagName("publication_year").item(0)
							.getTextContent();
					String bookName = docElement.getElementsByTagName("bookname").item(0).getTextContent();
					String authors = docElement.getElementsByTagName("authors").item(0).getTextContent();
					String publisher = docElement.getElementsByTagName("publisher").item(0).getTextContent();
					String bookImageURL = docElement.getElementsByTagName("bookImageURL").item(0).getTextContent();
					String isbn = docElement.getElementsByTagName("isbn13").item(0).getTextContent();

					book.setPublicationYear(publicationYear);
					book.setBookName(bookName);
					book.setAuthors(authors);
					book.setPublisher(publisher);
					book.setBookImageURL(bookImageURL);
					book.setIsbn(isbn);

					// 생성
					books.add(book); // 리스트에 추가
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// insertBooks(books, tableName);
		return books;
	}

	public ArrayList<BookDetailDTO> detailXmltoList(String xmlResponse, String tagName) {
		ArrayList<BookDetailDTO> books = null;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;

			dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(new InputSource(new StringReader(xmlResponse)));

			doc.getDocumentElement().normalize();

			Node loanBooksNode = doc.getElementsByTagName(tagName).item(0);
			NodeList docList = loanBooksNode.getChildNodes();
			books = new ArrayList<>(); // Book 객체들을 저장할 리스트 생성

			for (int i = 0; i < docList.getLength(); i++) {
				Node docNode = docList.item(i);
				if (docNode.getNodeType() == Node.ELEMENT_NODE) {
					Element docElement = (Element) docNode;
					BookDetailDTO book = new BookDetailDTO();

					String bookName = docElement.getElementsByTagName("bookname").item(0).getTextContent();
					String authors = docElement.getElementsByTagName("authors").item(0).getTextContent();
					String publisher = docElement.getElementsByTagName("publisher").item(0).getTextContent();
					String publicationYear = docElement.getElementsByTagName("publication_year").item(0)
							.getTextContent();
					String bookImageURL = docElement.getElementsByTagName("bookImageURL").item(0).getTextContent();
					String isbn = docElement.getElementsByTagName("isbn13").item(0).getTextContent();
					String className = docElement.getElementsByTagName("class_nm").item(0).getTextContent();
					String description = docElement.getElementsByTagName("description").item(0).getTextContent();

					book.setPublicationYear(publicationYear);
					book.setBookName(bookName);
					book.setAuthors(authors);
					book.setPublisher(publisher);
					book.setBookImageURL(bookImageURL);
					book.setIsbn(isbn);
					book.setClassName(className);
					book.setDescription(description);

					// 생성
					books.add(book); // 리스트에 추가
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// insertBooks(books, tableName);
		return books;
	}

	public String insertBooks(ArrayList<BookDTO> books, String tableName) {
		String resultMessage = "모든 데이터가 입력되었습니다.";

		try {
			if ("popularBook".equals(tableName) || "recentBook".equals(tableName)) {
				mapper.deleteData(tableName);
			}

			for (BookDTO book : books) {
				int result = 0;

				if ("popularBook".equals(tableName)) {
					result = mapper.popularInsert(book);

				}
				if ("recentBook".equals(tableName)) {
					result = mapper.recentInsert(book);
				}
				if ("totalBook".equals(tableName)) {
					result = mapper.insertTotal(book);
				}

				if (result == 0) {
					resultMessage = "데이터 입력 중 오류가 발생했습니다. 다시 시도하세요.";
					break; // Stop processing if an error occurs
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMessage = "데이터 입력 중 오류가 발생했습니다. 다시 시도하세요.";
		}
		return resultMessage;
	}

	public String getBookImages(Model model, String whichTable) {
		String modelName = whichTable;
		ArrayList<String> bookImages = mapper.getBookImages(whichTable);
		if (bookImages.isEmpty() || bookImages == null) { // null로 구분하면 안됨. 빈 거(isEmpty())랑 null은 다른것임.
			return "이미지 가져오기 실패";
		}
		
		model.addAttribute(modelName, bookImages);
		model.addAttribute(modelName+"Num", bookImages.size());
		return "이미지 가져오기 완료";
	}
	
	public String getBookInfo(Model model, String whichTable) {
		String modelName = whichTable;
		ArrayList<BookDTO> bookInfo = mapper.getBookInfo(whichTable);
		if (bookInfo.isEmpty() || bookInfo == null) { // null로 구분하면 안됨. 빈 거(isEmpty())랑 null은 다른것임.
			return "책 정보 가져오기 실패";
		}
		model.addAttribute(modelName, bookInfo);
		return "책 정보 가져오기 완료";
	}

	public String showMainImages(String whichTable, Model model, String url, String xmlTagName) {
		//String dbResult = getBookImages(model, whichTable);
		String dbResult = getBookInfo(model, whichTable);
		String Msg = "";
		if (dbResult.equals("이미지 가져오기 완료")) {
			return "데이터 베이스에 이미 저장 되어있습니다.";
		}
		if (dbResult.equals("이미지 가져오기 실패")) {
			String apiResult = connAPI(url);
			if (apiResult != null) {
				ArrayList<BookDTO> bookList = xmltoArrayList(apiResult, xmlTagName);
				if (bookList != null) {
					String insertResult = insertBooks(bookList, whichTable);
					if (insertResult.equals("모든 데이터가 입력되었습니다.")) {
						//getBookImages(model, whichTable);
						getBookInfo(model, whichTable);
						// 전체 테이블에 넣기(비동기적으로...는 언젠가 해보자)
						Msg = "모든 데이터가 입력되었습니다.";
					}
				} else {
					Msg = "xml파일을 리스트화 시키지 못했습니다.";
				}
			} else {
				Msg = "api 연결이 제대로 이루어 지지 않았습니다.";
			}
		}
		// 도서관 전체 정보(일단 50권만 넣을 예정)
		return Msg;
	}

	public ArrayList<BookDTO> totalSearch(String search, String cp, Model model) {

		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 5; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

		ArrayList<BookDTO> searchResult = mapper.totalSearch(search, begin, end);
		
		String url = "totalSearch?totalSearch=" + search + "&currentPage=";
		int totalCount = mapper.checkSearchCount(search);
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

		model.addAttribute("searchResult", searchResult);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);

		return null;
	}

	public void getAllTotal(String cp, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 5; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

		ArrayList<BookDTO> totalBook = mapper.getTotal(begin, end);
		
		String url = "totalSearch?currentPage=";
		int totalCount = mapper.checkTotalDB();
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

		model.addAttribute("searchResult", totalBook);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public String insertLoan(BookLoanDTO loanData) {
		String isbn = loanData.getIsbn();
		int rest = mapper.checkRestVol(isbn);
		System.out.println("rest : " + rest);
		if (rest < 1) {
			return "대출 가능한 도서가 남아있지 않습니다.";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String reserveDate = sdf.format(new Date());
	    
		loanData.setReserveDate(reserveDate);
		
		int loanResult = mapper.insertLoan(loanData);
		if (loanResult == 1) {
			NotifyDTO notification = new NotifyDTO();
			notification.setId(loanData.getUserId());
			notification.setCategory("도서");
			notification.setTitle("도서 대출 예약 신청이 완료되었습니다.");
			notification.setUrl("/myLibrary/myBookStatus");
			notiService.register(notification);
			
			NotifyDTO adminNotification = new NotifyDTO();
			adminNotification.setId(mapper.findAdmin().getId());
			adminNotification.setCategory("도서");
			adminNotification.setTitle("도서 대출 예약 신청이 있습니다.");
			adminNotification.setUrl("/admin/book");
			notiService.register(adminNotification);
			
			return "대출 예약이 정상적으로 이루어졌습니다.";
		}
		return "대출 예약 도중 오류가 발생했습니다.";
	}

}