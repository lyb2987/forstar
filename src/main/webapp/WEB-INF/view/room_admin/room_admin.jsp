<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>room 관리자 페이지</title>
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
			<div class="adminContent">
				<c:if test="${!empty authInfo.employeeNum}">
					
					
					<br/>
					<ul>
<li><a href="/roomadmin/roomList">객실 리스트</a></li>
<li><a href="/roomadmin/roomclass">객실 등급</a></li>
</ul>

<ul>
<li><a href="/roomadmin/laundry">청소 목록</a></li>
<li><a href="/roomadmin/cleaning">청소 요청</a>//room_Cleaning.jsp //청소 요청-이부분 수정해야됨. </li>
</ul>
<br/>
-객실 페이지- <br/>
<ul>
<li><a href="/room/roomorder">룸서비스 주문</a>//room_Order.jsp //룸서비스 주문</li>
<li><a href="/room/roomaddpayment">추가결제</a>//room_AddPayment.jsp// 추가결제</li>
<li><a href="/room/roompayment">객실결제</a>//room_Payment.jsp 객실결제</li>
</ul>
					<br/>
					</c:if>
			</div>
		</div>
	</div>
</div>



<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>