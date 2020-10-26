<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청소요청</title>
<%@ include file="../Frame/Header.jsp" %>
  <link rel="stylesheet" type="text/css" href="../css/Admin.css" />
  
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <style>
img{ vertical-align: bottom;}
</style>
</head>
<body>


<div class="container">
	<div class="adminCtn">
		<div class="adminBox contents" id="contents">
			<div class="location rgt">
				<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>청소 요청</strong></p>
			</div>
			<div class="headTit">
				<h4 class="tit">관리자 페이지</h4>
			</div>
			<div class="adminContent">
				<c:if test="${!empty authInfo.employeeNum}">
				<br/>
<form action="cleaningPro" method="post" name = "frm" id="frm" >
	<table align="center" border="1">
		<tr><td>요청 번호</td>
			<td><input type="text" name="cleaningNum" id="cleaningNum" />
			</td>
		</tr>
		<tr><td>객실예약 번호</td>
		<td><select name="roomReserNum" id="roomReserNum">
		<option>===List===</option>
	<c:forEach var="room" items="${rrlist }" varStatus="status">
		<c:forTokens items="${room.roomReserNum }" delims="" var="roomReserNum" varStatus="status">
			<option value="${roomReserNum}">${roomReserNum}
		</option>
		</c:forTokens>
	</c:forEach>
			 </select>
			</td>
		</tr>
		<tr><td>청소목록 번호</td>
			<td><select name="laundryNum" id="laundryNum">
		<option>===List===</option>
	<c:forEach var="room" items="${ldlist }" varStatus="status">
		<c:forTokens items="${room.laundryNum }" delims="" var="laundryNum" varStatus="status">
			<option value="${laundryNum}">${laundryNum}
		</option>
		</c:forTokens>
	</c:forEach>
			 </select></td>
		</tr>
			<tr><td>직원 번호</td>
			<td><input type="text" name="employeeNum" id="employeeNum" value="1111"/>
			</td>
		</tr>
			<tr><td>고객 번호</td>
			<td><input type="text" name="memberNum" id="memberNum" value="1234"/>
			</td>
		</tr>
		<tr><td>완료일자</td>
			<td><input type="text" name="cleaningClear" id="cleaningClear" readonly="true" placeholder="YYYY-MM-DD"/><img src="../room/image/calendar.png" width="25" height="25">
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="청소요청" />
				<input type="button" value="취소" onclick="history.back();"/>
			</td>
		</tr>
	</table>				
</form>


				</c:if>
			</div>
		</div>
	</div>
</div>




<script>
$("#cleaningClear").datepicker({
	dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년',
    minDate: 0
    
});
</script>
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>