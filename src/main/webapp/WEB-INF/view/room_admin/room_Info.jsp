<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실등록</title>

<link rel="stylesheet" type="text/css" href="../css/Regist.css" />
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
	<%@ include file="../Frame/Header.jsp" %>
</head>
<body>
<c:if test="${!empty authInfo.employeeNum}">
<form action="roomInfoPro" method="post" enctype="multipart/form-data" >
	<table align="center" border="1">
		<tr><td>객실번호</td>
			<td><input type="text" maxlength="4" size = "3" name="roomNum" id="roomNum" />호
			</td>
		</tr>
		<tr><td>등급번호</td>
		<td><select name="ratingNum" id="ratingNum">
		<option >===List===</option>
	<c:forEach var="room" items="${list }" varStatus="status">
		<c:forTokens items="${room.ratingNum }" delims="" var="ratingNum" varStatus="status">
			<option value="${ratingNum}">${ratingNum}
		</option>
		</c:forTokens>
	</c:forEach>
			 </select>
				
			</td>
		</tr>
		<tr><td>객실 사진</td>
			<td><input type="file" name="roomPic" id="roomPic" multiple="multiple">
			</td>
		</tr>
		<tr><td>객실 설명</td>
			<td><textarea rows="13" cols="56" 
					name="roomContent" id="roomContent"></textarea>
			</td>
		</tr>
		<tr><td>가격</td>
			<td><input type="text" name="roomPay" id="roomPay" />원
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="객실등록" />
				<input type="button" value="취소" onclick="history.back();"/>
			</td>
		</tr>
	</table>				
</form>
</c:if>
<c:if test="${empty authInfo.employeeNum}">
<table align="center">
<tr><td>관리자권한이 필요한 서비스 입니다.</td></tr>
</table>
</c:if>
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>