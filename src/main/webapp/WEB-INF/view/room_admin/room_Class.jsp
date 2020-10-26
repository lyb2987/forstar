<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실등급</title>
<%@ include file="../Frame/Header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/Admin.css" />
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<div class="container">
	<div class="adminCtn">
		<div class="adminBox contents" id="contents">
			<div class="location rgt">
				<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>객실 등급 등록</strong></p>
			</div>
			<div class="headTit">
				<h4 class="tit">관리자 페이지</h4>
			</div>
			<div class="adminContent">
			<c:if test="${!empty authInfo.employeeNum}">
			<br/>
<form:form action="roomClassPro" name = "frm" id="frm" 
	method = "post" commandName="roomClassCommand">
 <table width = 400 align = "center" border = 1 >
 	<tr>
 		<td  width = "200">등급번호</td>
 		<td  width = "400">
 			<form:input path="ratingNum" id = "ratingNum"
 			size = "12" maxlength="10" />
 			<form:errors path="ratingNum"/>
 		</td>
 	</tr>
 	<tr>
 		<td width = "200">등급명</td>
 		<td width = "400">
 		<form:select path="ratingName" id="ratingName">
 			<form:option value="Deluxe">Deluxe</form:option>
 			<form:option value="BusinessDeluxe">Business Deluxe</form:option>
 			<form:option value="GrandCornerDeluxe">Grand Corner Deluxe</form:option>
 		</form:select>
 		</td>
 	</tr>
 	<tr>
 		<td  width = "200">침대 수</td>
 		<td  width = "400">
 			<form:select path="ratingBad" id="ratingBad">
 			<form:option value="1">싱글</form:option>
 			<form:option value="2">더블</form:option>
 			<form:option value="2">트윈</form:option>
 			<form:option value="3">패밀리 트윈</form:option>
 			<form:option value="4">디럭스 트윈</form:option>
 		</form:select>
 		</td>
 	</tr>
 	<tr>
 		<td  width = "200">평수</td>
 		<td  width = "400">
 			<form:select path="ratingAcreage" id="ratingAcreage">
 			<form:option value="16">싱글룸</form:option>
 			<form:option value="18">더블룸</form:option>
 			<form:option value="26">스튜디오룸</form:option>
 			<form:option value="26">트윈룸</form:option>
 		</form:select>
 	</td>
 	</tr>
 	
 	<tr><td width = 200 >뷰</td>
		<td width = 400 >
		<form:select path="ratingView" id="ratingView">
 			<form:option value="오션뷰">오션뷰</form:option>
 			<form:option value="마운틴뷰">마운틴뷰</form:option>
 			<form:option value="시티뷰">시티뷰</form:option>
 		</form:select>
		</td>
	</tr>
	<tr><td width = 200 >인원수</td>
		<td width = 400 >
		<form:select path="ratingPeople" id="ratingPeople">
 			<form:option value="1">1명</form:option>
 			<form:option value="2">2명</form:option>
 			<form:option value="3">3명</form:option>
 			<form:option value="4">4명</form:option>
 		</form:select>
	</td>
	</tr>
	<tr>
		<td colspan = 2>
			<input type= "submit" value="등록" />
			<input type= "reset" value="다시 입력" />
			<input type="button" value="취소" onclick="history.back();"/>
 		</td>
	</tr>
 </table>
 </form:form>
 	</div>
		</div>
	</div>
</div>
	</c:if>
		
<c:if test="${empty authInfo.employeeNum}">
<table align="center">
<tr><td>관리자권한이 필요한 서비스 입니다.</td></tr>
</table>
</c:if>
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>