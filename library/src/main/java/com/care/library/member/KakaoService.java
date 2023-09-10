package com.care.library.member;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class KakaoService {
	private String accessToken;
	private String scope;
	private String RESTAPIKEY = "3f70e9cb27d96ef5a414516587c2cb5c";
	private String redirectURI = "http://localhost/kakaoLogin";

	@Autowired
	MemberMapper memberMapper;
	@Autowired
	private HttpSession session;

	public void getAccessToken(String code) {
		/*
		 * # 액세스 토큰 가져오기 #
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-token
		 * -sample
		 */
		String reqUrl = "https://kauth.kakao.com/oauth/token";
		String reqParam = "grant_type=authorization_code";
		reqParam += "&client_id=" + RESTAPIKEY;
		reqParam += "&redirect_uri=" + redirectURI;
		reqParam += "&code=" + code;

		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST"); // POST 요청을 위해 기본값 false에서 setDoOutput을 true로 변경
			conn.setDoOutput(true); // POST 메소드를 이용해서 데이터를 전달하기 위한 설정

			// 기본 outputStream을 통해 문자열로 처리할 수 있는 OutPutStreamWriter 변환 후 처리속도를 빠르게 하기위한
			// BufferedWriter로 변환해서 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(reqParam);
			bw.flush();

			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
//			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			ObjectMapper om = new ObjectMapper();
			Map<String, String> map = null;
			map = om.readValue(isr, new TypeReference<Map<String, String>>() {
			});
			accessToken = map.get("access_token");
			scope = map.get("scope"); // client의 정보 공개 선택 사항.

			// setNeedsAgreement();
//			System.out.println("access_token : " + map.get("access_token"));
//			System.out.println("scope : " + map.get("scope"));

			/*
			 * response body : {
			 * "access_token":"W-_xD-t7fIv78Lzz06tCZyrlGDlYcR3kVWmxo_t0Cj11nAAAAYlm52VZ",
			 * "token_type":"bearer",
			 * "refresh_token":"3Llflzbp_vCUMMFss78twrO3G05MmHikDxZ6c8GbCj11nAAAAYlm52VY",
			 * "expires_in":21599,
			 * "scope":"age_range account_email profile_image gender profile_nickname",
			 * "refresh_token_expires_in":5183999 }
			 */

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void setNeedsAgreement() {
		/*
		 * # 추가 항목 동의 받기 #
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-code-
		 * additional-consent
		 */
		// https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code&scope=account_email,gender

		String reqUrl = "https://kauth.kakao.com/oauth/authorize";
		String reqParam = "?client_id=" + RESTAPIKEY;
		reqParam += "&redirect_uri=" + redirectURI;
		reqParam += "&response_type=code&scope=" + scope;

		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(reqParam);
			bw.flush();

			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MemberDTO getUserInfo() {
		/*
		 * 사용자 정보 가져오기
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#req-user-info
		 */

		String reqUrl = "https://kapi.kakao.com/v2/user/me";

		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); // Authorization: Bearer ${ACCESS_TOKEN}

			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonTree = om.readTree(conn.getInputStream());

			JsonNode kakaoAccount = jsonTree.get("kakao_account");

			String kakaoEmail = kakaoAccount.get("email").toString().replace("\"", "");
			// System.out.println("email : " + kakaoAccount.get("email"));

			// 카카오 회원가입시 정보를 추가 입력하도록하여 일반 도서관 회원으로 가입시킬 예정.
			// String kakaoID = email.replace("\"", "").split("@")[0];
			String kakaoID = jsonTree.get("id").toString();
			System.out.println("kakaoID : " + kakaoID);

			MemberDTO kakaoUserInfo = new MemberDTO(); // 사실상 이메일과, 카카오아이디만 받을 수 있음.
			kakaoUserInfo.setEmail(kakaoEmail);
			kakaoUserInfo.setKakaoid(kakaoID);
			return kakaoUserInfo;

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public MemberDTO kakaoExist() {
		//카카오에서 주는 회원 정보.
		MemberDTO kakaoUserInfo = getUserInfo();
		session.setAttribute("kakaoEmail", kakaoUserInfo.getEmail()); // 일반회원 여부 알기위해서 필요함
		session.setAttribute("kakaoID", kakaoUserInfo.getKakaoid()); 

		// 카카오 회원 연동 여부 확인하기.(카카오에서 주는 kakaoID로 중복 확인)
		MemberDTO kakaoMember = memberMapper.kakaoIDCheck(kakaoUserInfo.getKakaoid());
		// 카카오 회원 O => 로그인 진행
		if (kakaoMember != null) {
			return kakaoMember;
		}
		// 카카오 회원 X (= 카카오 회원가입 X),
		return null;
	}

	public String kakaoRegisterProc(MemberDTO member, String confirm) {
		MemberDTO kakaoUserInfo = getUserInfo();
		System.out.println(kakaoUserInfo.getKakaoid());
		// MemberDTO kakaoIDCheck =
		// memberMapper.kakaoIDCheck(kakaoUserInfo.getKakaoid());
//		// 카카오 회원 X (= 카카오 회원가입 X), 
//		if(kakaoUserExist.equals("카카오 회원이 아닙니다.")) {
//			// 일반 회원 여부 확인(이메일 중복 여부로 확인 - 명확한 것은 아님. 이메일 수정 가능하니까)
//			MemberDTO emailCheck = memberMapper.emailCheck(kakaoEmail);
//			
//			// 이메일 중복 X => 회원가입 진행(회원 db에 넣기)
//			if(emailCheck == null) {
//				//카카오 연동 회원가입 페이지로 이동.(이름, 생년월일, 주소, 전화번호)
//				session.setAttribute("kakaoID", kakaoID);
//				session.setAttribute("kakaoEmail", kakaoEmail);
//				return "카카오 연동 회원가입";
//			}
//			// 이메일 중복 O => 
//			else {
//				// 이미 '하이미디어 라이브러리'회원입니다. 연동할까요? 물어보기.
//				// 연동 동의 O => 연동 진행
//				// 연동 페이지로 넘어가게함 => 도서관 아이디, 비밀번호 받아서 로그인 하듯이
//				
//				// 연동 동의 X => 
//				// 기존 db에 있는 아이디로 로그인하기 버튼 누르게하기.
//				return "기존 아이디로 로그인하기";
//			}
//		}
//		// 카카오 회원 O => 로그인 진행
//		else {
//			memberMapper.loginProc(kakaoID);
//			
//			System.out.println("카카오 로그인 성공");
//			return "로그인 성공";
//		}
//		
//		
//		

		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		String cryptPassword = bpe.encode(member.getPw());
		member.setPw(cryptPassword);
		member.setEmail(kakaoUserInfo.getEmail());
		member.setKakaoid(kakaoUserInfo.getKakaoid());
		member.setStatus("D");
		int registerResult = memberMapper.kakaoRegisterProc(member);
		if(registerResult == 1)
			return "회원 등록 완료";

		return "이미 가입된 아이디 입니다.";
	}
	
	public void integrateMember(String kakaoEmail, String kakaoID) {
		memberMapper.updateKakaoId(kakaoEmail, kakaoID);
	}
	
	public void unLink() {
		/*
		 * # 연결 끊기 #
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#unlink
		 */
		String reqUrl = "https://kapi.kakao.com/v1/user/unlink";
		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl);
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); // Authorization: Bearer ${ACCESS_TOKEN}

			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());
			System.out.println("id : " + jsonNode.get("id"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
