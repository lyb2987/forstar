<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 Home</title>
<link rel="stylesheet" type="text/css" href="../css/Admin.css" />
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div class="container">
	<div class="adminCtn">
		<div class="adminBox contents" id="contents">
			<div class="location rgt">
				<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>관리자 페이지</strong></p>
			</div>
			<div class="headTit">
				<h4 class="tit">관리자 페이지</h4>
			</div>
			<div class="lnbArea lnbAreaAcmd">
				<div class="lnbMenu">
					<h2 class="tit">관리자 메뉴</h2>
					<ul class="menu">
						<li class="m1 first"><a><span>상담 & 문의</span></a>
							<ul class="sMenu sMenu1">
								<li class="s1 first"><a href="../Inquiry/InquiryList"><span>문의 목록</span></a></li>
								<li class="s2 last"><a href="../Counseling/CounselingList"><span>상담 목록</span></a></li>
							</ul>
						</li>
						<li class="m2"><a><span>객실</span></a>
							<ul class="sMenu sMenu2">
								<li class="s1 first"><a href=""><span>객실 예약 목록</span></a></li>
								<li class="s2"><a href="../roomadmin/roomList"><span>객실 목록</span></a></li>
								<li class="s3"><a href="../roomadmin/cleaning" class="on"><span>청소 요청</span></a></li>
								<li class="s4"><a href="../roomadmin/laundry" class="on"><span>청소 목록</span></a></li>
								<li class="s5 last"><a href="../roomadmin/roomclass" class="on"><span>객실 등급</span></a></li>
							</ul>
						</li>
						<li class="m3"><a><span>다이닝</span></a>
							<ul class="sMenu sMenu3">
								<li class="s1 first"><a href=""><span>1</span></a></li>
								<li class="s2"><a href=""><span>2</span></a></li>
								<li class="s3"><a href=""><span>3</span></a></li>
								<li class="s4"><a href=""><span>4</span></a></li>
								<li class="s5 last"><a href=""><span>5</span></a></li>
							</ul>
						</li>
						<li class="m4"><a><span>라이프스타일</span></a>
							<ul class="sMenu sMenu4">
								<li class="s1 first"><a href=""><span>1</span></a></li>
								<li class="s2"><a href=""><span>2</span></a></li>
								<li class="s3"><a href=""><span>3</span></a></li>
								<li class="s4"><a href=""><span>4</span></a></li>
								<li class="s5 last"><a href=""><span>5</span></a></li>
						
							</ul>
						</li>
						<li class="m5"><a href="viewAccLng.do?contId=ACCMO_LOUNGE"><span>연회장</span></a>
							<ul class="sMenu sMenu5">
								<li class="s1 first"><a href="../BHReservation/BHReservationList"><span>연회장 예약 조회</span></a></li>
								<li class="s2"><a href="../BHReview/BHReviewList"><span>연회장 후기 목록</span></a></li>
							</ul>
						</li>
						<li class="m6 last"><a href=""><span>직원</span></a>
							<ul class="sMenu sMenu6">
								<li class="s1 first"><a href=""><span>1</span></a></li>
								<li class="s2"><a href=""><span>2</span></a></li>
								<li class="s3"><a href=""><span>3</span></a></li>
								<li class="s4"><a href=""><span>4</span></a></li>
								<li class="s5 last"><a href=""><span>5</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="adminContent">
					
			</div>
		</div>
	</div>
</div>

<!-- 
	<c:if test="${!empty authInfo}">
		<a href="/Inquiry/InquiryList">문의 리스트</a>
		<a href="/Counseling/CounselingList">상담 리스트</a>
		<a href="/BE/BEmployeeList">연회 인력 목록</a>
		<a href="/BHReservation/BHReservationList">연회장 예약 목록</a>
		<a href="/BHReview/BHReviewList">연회장 후기 목록</a>
		<br/>
		<a href="/roomadmin" >객실관리자 & 객실</a>
		<br/>
		<a href ="member/list">회원리스트</a>
	</c:if>
 -->

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>