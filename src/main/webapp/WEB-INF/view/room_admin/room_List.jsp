<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 리스트</title>
<%@ include file="../Frame/Header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/Regist.css" />
</head>
<body>
<table align ="center" border="1" cellpadding="0" cellspacing="0" >
	<tr align="center" valign="middle">
		<td colspan="4">객실 리스트</td>
		<td align=right>
			<font size=2>객실 개수 : ${roomCount }</font>
		</td>
	</tr>
	<tr><td>객실 번호</td><td>등급번호</td><td>객실 이미지</td><td>객실설명</td><td>가격</td></tr>
	<c:forEach var="room" items="${list }" varStatus="status">
	<tr>
	<c:if test="${!empty authInfo.employeeNum}">
		<td><a href="roomModify?num=${room.roomNum }">${room.roomNum }호</a></td>
		</c:if>
		<c:if test="${empty authInfo.employeeNum}">
		<td>${room.roomNum }호</td>
		</c:if>
		<td>${room.ratingNum }</td>
		<td>
		<c:forTokens items="${room.roomPic }" delims="`" var="roomPic" 
															varStatus="status">
			<c:if test="${status.count == 1}">
			<img src="../room_admin/upload/${roomPic }" width="77" height="77">
			</c:if>
		</c:forTokens>
		</td>
		<td>${room.roomContent  }</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${room.roomPay  }" />원</td>
	</tr>
	</c:forEach>	
	<c:if test="${!empty authInfo.employeeNum}">
<tr><td colspan="5"><a class="buttonstyleA" style="color:#fff; text-decoration: none"href="/roomadmin/roominfo"> 객실등록</a></td></tr>
</c:if>
</table>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>