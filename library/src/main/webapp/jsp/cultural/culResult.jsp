<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/" />
<link href="css/cultural.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">

<c:import url="/header" />

<div class="inner pageContent_mt">
	<div class="sub-menu">
		<c:import url="/subMenuCultural" />
	</div>

	<div class="culturalContainer">
		<div class="top-cultural">
			<div class="top-cbox">
				<h1>문화행사 결과</h1>
				<p>
					은평구립도서관은 다양한 문화행사를 통해 지역주민께<br>
					한걸음 한걸음 더 다가가려고 노력합니다.<br>
					문화교육, 전시, 독서관련 행사, 공모전, 독서캠페인 등을 진행하고 있습니다.<br>
				</p>
				<ul class="Route">
					<li>HOME</li>
					<li>&gt;</li>
					<li>문화행사</li>
					<li>&gt;</li>
					<li>문화행사 결과</li>
				</ul>
			</div>
		</div>

 		<div class="resultMenu">
			<ul>
				<li class="menu-item" id="menu1"><a href="#" keyvalue1="15" keyvalue2=""><span>독서교육</span></a></li>
				<li class="menu-item" id="menu2"><a href="#" keyvalue1="15" keyvalue2="9"><span>문화교육</span></a></li>
				<li class="menu-item" id="menu3"><a href="#" keyvalue1="15" keyvalue2="10"><span>평생교육</span></a></li>
			</ul>
		</div>
		
		<div class="flo_wrap">
            <p class="fL fontsA mt_15">총 <strong>917</strong>건</p>
			<!-- 검색 -->
			<div class="fR bod_srch">
				<form name="bod_srch" action="eventresult.asp" method="post">
                      <input type="hidden" name="gubun" value="1">
					<fieldset>
						<select id="key" name="key" title="검색 영역을 선택하세요">
							<option value="boardtitle">제목</option>
							<option value="body">내용</option>
							<option value="titlebody">제목+내용</option>
							<!--option value="writer_name" >글쓴이</option-->
						</select>
						<input type="text" class="putC" value="" name="val" maxlength="20" title="검색어를 입력하세요">
						<input type="image" src="/image/search.png" width="15" height="15" alt="검색" title="검색하기" value="" name="">
					</fieldset>
				</form>
			</div>
			<!-- //검색 -->
		</div>
		
		<div class="tableA">
			<table summary="번호, 구분, 제목, 작성자, 등록일, 조회수, 첨부">
				<caption>도서관소식 리스트 테이블</caption>
				<colgroup>
					<col width="12%">
					<col width="12%">
					<col width="*">
					<col width="15%">
					<col width="15%">							
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>								
					</tr>
				</thead>
				<tbody>
                              
					<tr>
						<td>1703</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1703&amp;gubun=1">[문홍] 김재원 작가와의 만남 결과</a></td>
						<td>2023.07.08</td>
						<td>77</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1702</td>
						<td>[체험]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1702&amp;gubun=1">[어린이] 7월 포룸VR토론 행사 결과</a></td>
						<td>2023.07.05</td>
						<td>68</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1700</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1700&amp;gubun=1">[문홍] 학부모 독서문화 특강 &lt;이렇게 책 읽는 아이가 되었습..</a></td>
						<td>2023.06.24</td>
						<td>56</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1697</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1697&amp;gubun=1">[문홍] 여행의 맛 &lt;노중훈 작가와의 만남&gt; 결과</a></td>
						<td>2023.06.13</td>
						<td>87</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1696</td>
						<td>[체험]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1696&amp;gubun=1">[어린이] 어린이 현장체험학습 운영 결과</a></td>
						<td>2023.06.11</td>
						<td>96</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1695</td>
						<td>[토론]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1695&amp;gubun=1">[어린이] 중국어독서토론동아리 쩐빵 결과</a></td>
						<td>2023.06.10</td>
						<td>91</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1694</td>
						<td>[체험]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1694&amp;gubun=1">[어린이] 포룸VR토론 행사 결과</a></td>
						<td>2023.06.09</td>
						<td>75</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1692</td>
						<td>[체험]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1692&amp;gubun=1">[사서팀] 작은도서관 순회사서 지원 사업 &lt;나만의 도서가방 만..</a></td>
						<td>2023.05.30</td>
						<td>65</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1691</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1691&amp;gubun=1">[어린이] 문해력 기르는 그림책 읽기 행사 결과</a></td>
						<td>2023.05.24</td>
						<td>98</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
					<tr>
						<td>1690</td>
						<td>[체험]</td>
						<td class="title"><a href="eventresult.asp?mode=view&amp;number=1690&amp;gubun=1">[어린이] 도서관으로 책소풍 가요 행사 결과</a></td>
						<td>2023.05.21</td>
						<td>132</td>
					</tr>
					<!--tr>
						<td>502</td>
						<td>[강연]</td>
						<td class="title"><a href="eventresult.asp?mode=C_view">예약도서 관련해서 문의드려요.</a></td> [D] 제목 글자수 줄임필요!
						<td>2013.05.01</td>
						<td>10</td>
					</tr-->
                          
				</tbody>
			</table>
		</div>
		
		<div class="paginate">
			<a href="javascript:;"><img src="../img/btn/btn_page_prev.gif" alt="이전"></a>
			<strong><span>1</span></strong>
			<a href="eventresult.asp?mode=list&amp;page=2&amp;gubun=1"><span>2</span></a>
			<a href="eventresult.asp?mode=list&amp;page=3&amp;gubun=1"><span>3</span></a>
			<a href="eventresult.asp?mode=list&amp;page=4&amp;gubun=1"><span>4</span></a>
			<a href="eventresult.asp?mode=list&amp;page=5&amp;gubun=1"><span>5</span></a>
			<a href="eventresult.asp?mode=list&amp;page=6&amp;gubun=1" class="next"><img src="../img/btn/btn_page_next.gif" alt="다음"></a>
			<a href="eventresult.asp?mode=list&amp;page=92&amp;gubun=1" class="next2"><img src="../img/btn/btn_page_next2.gif" alt="맨 뒤로"></a>
		</div>
		
	</div>
</div>
<c:import url="/footer" />

<script src="javaScript/subCulTop.js"></script>
