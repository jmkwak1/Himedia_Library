<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.care.library.common.PageService" %>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/" />
<link href="css/cultural.css" rel="stylesheet" type="text/css">

<script>
  	document.addEventListener('DOMContentLoaded', function() {	
  		//JavaScript 코드가 DOM이 로드되기 전에 실행되면 해당 요소를 찾을 수 없기 때문에 오류가 발생할 수 있음
  		//DOMContentLoaded 이벤트가 발생할 때까지 스크립트가 실행되지 않고, DOM이 완전히 로드된 이후에 실행
    var id = "${sessionScope.id}"; // 세션에 저장된 id 값을 가져와서 id 변수에 할당
    if (id === 'admin') {
      document.getElementById('apply').style.display = 'block';
    } else {
      document.getElementById('apply').style.display = 'block';/* 
      document.getElementById('apply').style.display = 'none'; */
    }
  });
</script>
	
<style>
  	.paging{
  		display: flex;
    	justify-content: center;
    	margin-bottom: 50px;
  	}
</style>

<c:import url="/header" />

<div class="inner pageContent_mt">
	<div class="sub-menu">
		<c:import url="/subMenuCultural" />
	</div>

	<div class="culturalContainer">
		<div class="top-cultural">
			<div class="top-cbox">
				<h1>문화행사 목록</h1>
				<p>
					지역주민들의 평생학습을 지원하고 건전한 취미, 여가생활을<br> 
					영위할 수 있도록 학습 및 교양 프로그램을 운영하고 있습니다.
				</p>
				<ul class="Route">
					<li>HOME</li>
					<li>&gt;</li>
					<li>문화행사</li>
					<li>&gt;</li>
					<li>문화행사 목록</li>
				</ul>
			</div>
		</div>
		
 		<div class="top-menu">
			<ul>
				<li class="menu-item" id="menu1"><a href="#" keyvalue1="15" keyvalue2=""><span>접수중 / 예정행사</span></a></li>
				<!-- <li class="menu-item" id="menu2"><a href="#" keyvalue1="15" keyvalue2="9"><span>문화행사 신청</span></a></li> -->
				<li class="menu-item" id="menu3"><a href="#" keyvalue1="15" keyvalue2="10"><span>접수마감된 행사</span></a></li>
				<li class="menu-item" id="menu4"><a href="#" keyvalue1="15" keyvalue2="11"><span>나의신청내역보기</span></a></li>
			</ul>
		</div>
	
		<div class="apply" id="apply" style="display:none">
		    <ul>
		        <li><a href="${context}culSubmit">신청하기</a></li>
		    </ul>
		</div>
		
		<div class="cul-list">
			<ul class="teach_list">
			
				<li class="ever_one">
					<a href="" keyvalue1="12" keyvalue2="0" keyvalue3="" class="detail-btn">
						<div class="thumb">
							<img src="/image/cullist1.jpg"
								alt="[비대면] 사서와 함께하는 독서여행(어린이팀)" title="[비대면] 사서와 함께하는 독서여행(어린이팀)"
								class="teach_img" style="height: 386.4px;">
						</div>
						<div class="list_area">
							<div class="title_area">
								<b class="title">[비대면] 사서와 함께하는 독서여행(어린이팀)</b>
							</div>
							<ul class="con2">
								<li><span class="tit">강의기간</span>2023-08-10~2023-08-31 (총
									4회)</li>
								<li><span class="tit">접수기간</span>2023-07-31~2023-08-06</li>
								<li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span>초등
									5학년</li>
							</ul>
						</div>
					</a>
				</li>
				
				<li class="ever_one">
					<a href="" keyvalue1="12" keyvalue2="0" keyvalue3="" class="detail-btn">
						<div class="thumb">
							<img src="/image/cullist2.jpg"
								alt="(체험교실)상상을 표현하는 3D펜 작품 만들기" title="(체험교실)상상을 표현하는 3D펜 작품 만들기"
								class="teach_img" style="height: 386.4px;">
						</div>
						<div class="list_area">
							<div class="title_area">
								<b class="title">(체험교실)상상을 표현하는 3D펜 작품 만들기</b>
							</div>
							<ul class="con2">
								<li><span class="tit">강의기간</span>2023-08-03~2023-08-12 (총
									4회)</li>
								<li><span class="tit">접수기간</span>2023-07-26~2023-08-02</li>
								<li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span>초6~중학생</li>
							</ul>
						</div>
					</a>
				</li>
	
				<li class="ever_one">
					<a href="" keyvalue1="18" keyvalue2="1" keyvalue3="" class="detail-btn">
						<div class="thumb">
							<img src="/image/cullist3.jpg"
								alt="가족과 함께하는 우리 역사 책놀이" title="가족과 함께하는 우리 역사 책놀이"
								class="teach_img" style="height: 386.4px;">
						</div>
						<div class="list_area">
							<div class="title_area">
								<b class="title">가족과 함께하는 우리 역사 책놀이</b>
							</div>
							<ul class="con2">
								<li><span class="tit">강의기간</span>2023-08-05~2023-08-05 (총
									1회)</li>
								<li><span class="tit">접수기간</span>2023-07-19~2023-07-21</li>
								<li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span>초등
									1~3학년 자녀와 보호자 1인</li>
							</ul>
						</div>
					</a>
				</li>
	
				<li class="ever_one">
					<a href="" keyvalue1="12" keyvalue2="0" keyvalue3="7645" class="detail-btn">
						<div class="thumb">
							<img src="/image/cullist4.jpg"
								alt="[청소년 창의특화 프로그램]2023년「문화마루 창작소」: 라탄공예"
								title="[청소년 창의특화 프로그램]2023년「문화마루 창작소」: 라탄공예" class="teach_img"
								style="height: 386.4px;">
						</div>
						<div class="list_area">
							<div class="title_area">
								<b class="title">[청소년 창의특화 프로그램]2023년「문화마루 창작소」: 라탄공예</b>
							</div>
							<ul class="con2">
								<li><span class="tit">강의기간</span>2023-08-01~2023-08-04 (총
									4회)</li>
								<li><span class="tit">접수기간</span>2023-07-15~2023-07-31</li>
								<li><span class="tit">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</span></li>
							</ul>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div class="paging">
            ${result}
        </div>
	</div>
</div>

<c:import url="/footer" />

<script src="javaScript/subCulTop.js"></script>
