<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" type="text/css" href="../css/Init.css" />
<link rel="stylesheet" type="text/css" href="../css/Header.css" />

</head>
<body>
<div class="mainWrap headSeoul mainWrapSeoul">
	<div class="head">
		<div class="header">
			<h1 class="logo"><a href="../main.do">For Star</a></h1>
			<!-- 로그인 -->
			<span class="loginArea" id="loginAreaSpan">
				<c:if test="${empty authInfo}">
					<a href="../login/loginForm">로그인</a>
				</c:if>
				<c:if test="${!empty authInfo.memberNum}">
					<a href="javascript:void(0);">회원 : ${authInfo.name} 님</a>
					<a href="../logout">로그아웃</a>
					<a href="javascript:void(0);">상담 & 문의</a>
					<a href="../mypage/MyHome">마이 페이지</a>
					<a href="/room/roomaddpayment">추가결제</a>
					<a href="/room/roomtotalpayment">결제요청</a>
				</c:if>
				<c:if test="${!empty authInfo.employeeNum}">
					<a href="javascript:void(0);">관리자 : ${authInfo.name} 님</a>
					<a href="../logout">로그아웃</a>
					<a href="../admin/AdminHome">관리자 페이지</a>
				</c:if>
			</span>
		</div>
		<div id="gnbMain" class="gnbMain">
			<div id="gnbMenu" class="gnbMenu">
				<ul class="menu">
					<li class="m2"><a href='javascript:void(0);' class="over"><span>객실</span></a>
						<ul class="sm" style="display: none;">
							<li class="s1 first"><a href="/room/roomreser"><span>스탠다드</span></a></li>
							<li class="s5 last"><a href="/roomadmin/roomList"><span>전체 객실 보기</span></a></li>
						</ul>
					</li>
					<li class="m3">
						<a href="javascript:void(0);" class=""><span>다이닝</span></a>
						<ul class="sm" style="display: none;">
							<li class="s1 first"><a href="javascript:void(0);"><span>파인 다이닝</span></a></li>
							<li class="s2"><a href="javascript:void(0);"><span>라운지 &amp; 바</span></a></li>
							<li class="s3 last"><a href="javascript:void(0);"><span>베이커리</span></a></li>
						</ul>
					</li>
		
					<li class="m4">
						<a href="javascript:void(0);" class=""><span>휴식시설</span></a>
						<ul class="sm" style="display: none;">
							<li class="s1 first"><a href="javascript:void(0);"><span>야외 수영장</span></a></li>
							<li class="s2"><a href="javascript:void(0);"><span>스파</span></a></li>
							<li class="s3"><a href="javascript:void(0);"><span>피트니스</span></a></li>
							<li class="s4"><a href="javascript:void(0);"><span>조각공원</span></a></li>
							<li class="s5 last"><a href="javascript:void(0);"><span>아케이드</span></a></li>
						</ul>
					</li>
					<li class="m5">
						<a href="javascript:void(0);" class=""><span>웨딩 &amp; 연회</span></a>
						<ul class="sm" style="display: none;">
							<li class="s1 first"><a href="javascript:void(0);"><span>웨딩</span></a></li>
							<li class="s2"><a href="javascript:void(0);"><span>기업연회</span></a></li>
							<li class="s3 last"><a href="javascript:void(0);"><span>가족연회</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	var previousMenu = "";

	$(".menu li").click(function(){
		var inputMenu = $(this).attr("class");

		if(inputMenu == "m2"){
			$(".m3 ul").hide();
			$(".m4 ul").hide();
			$(".m5 ul").hide();
			$(".m2 ul").toggle();
			previousMenu = $(this).attr("class");
		}
		else if(inputMenu == "m3"){
			$(".m2 ul").hide();
			$(".m4 ul").hide();
			$(".m5 ul").hide();
			$(".m3 ul").toggle();
			previousMenu = $(this).attr("class");
		}
		else if(inputMenu == "m4"){
			$(".m2 ul").hide();
			$(".m3 ul").hide();
			$(".m5 ul").hide();
			$(".m4 ul").toggle();
			previousMenu = $(this).attr("class");
		}
		else if(inputMenu == "m5"){
			$(".m2 ul").hide();
			$(".m3 ul").hide();
			$(".m4 ul").hide();
			$(".m5 ul").toggle();
			previousMenu = $(this).attr("class");
		}	
	});

</script>
</body>
</html>