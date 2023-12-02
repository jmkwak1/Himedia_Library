<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>하이디미어 도서관 - 문화행사</title>
<c:url var="context" value="/"/>
<link href="${context }css/cultural.css" rel="stylesheet" type="text/css">

<c:import url = "/header"/>
<style>
.Route li:last-child {
	  font-weight: bold; /* 마지막 li에 굵은 글꼴 적용 */
	}
</style>
<div class="inner pageContent_mt">
	<div class="sub-menu">
        <c:import url="/subMenuCultural" />
    </div>

    <div class="culturalContainer">
	    <div class="top-cultural">
	    	<div class="top-cbox">
	    		<h1>문화행사 안내</h1>
	    		<p>
	    			지역주민들의 평생학습을 지원하고 건전한 취미, 여가생활을<br>
					영위할 수 있도록 학습 및 교양 프로그램을 운영하고 있습니다.
				</p>
	    		<ul class="Route">
	    			<li><a href="${context}main">HOME</a></li>
					<li>&gt;</li>
					<li><a href="${context}cultural">문화행사</a></li>
					<li>&gt;</li>
					<li><a href="${context}cultural">문화행사 안내</a></li>
		        </ul>
	    	</div>
	    </div>
    
	    <div class="bottom-cultural">
	    	<b><h3>문화행사 안내</h3></b>
	    	<span><p>지역주민들의 평생학습을 지원하고 건전한 취미, 여가생활을 영위할 수 있도록 학습 및 교양 프로그램을 운영하고 있습니다.</p></span>
	    	<br>
	    	    	
	    	<span><p>대상</p></span>
	    	<p>지역주민 (유아, 아동, 청소년, 성인)</p>
	    	<br>
	    	
	    	<span><p>장소</p></span>
	    	<p>하이미디어도서관 신촌점</p>
	    	<br>
	    	
	    	<span><p>비용</p></span>
	    	<p>무료</p>
	    	<br>
	    	
	    	<span><p>안내</p></span>
	    	<p>
	    		프로그램에 따라 온라인 접수, 방문 접수, 선착순 입장이 있습니다.<br>
				참석자 본인의 아이디로 로그인 하셔서 접수하시기 바랍니다. (부모님 이름으로 자녀 프로그램 등록 시 접수 취소)
			</p>
	    	<br>
	    	
	    	<b><h3>신청방법</h3></b>
	    	<span>
	    		<p>
	    			접수 공지 후 접수기간 내 해당 게시물의 신청 방법에 따라 접수 해주세요.<br>
					불참 시, 최소 이틀 전까지 인터넷 혹은 도서관 유선으로 취소 신청 해주세요.
				</p>
			</span>
	    	<br>
	    	
	    	<b><h3>문의사항</h3></b>
	    	<span><p>개별 행사 안내문에 따라 담당자 전화번호를 확인하시고 문의하여 주시기 바랍니다.</p></span>
	    	<br>
	    </div>
    
	    <div class="cul-list">
	    	<a href="${context}culForm"><button>문화행사 목록보기</button></a>
	    </div>
	</div>	    
</div>
<c:import url = "/footer"/>

<script src="${context }javaScript/subCulTop.js"></script>
