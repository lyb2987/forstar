<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실</title>

<link rel="stylesheet" type="text/css" href="../css/Regist.css" />
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
	<%@ include file="../Frame/Header.jsp" %>
</head>
<body>
<script type="text/javascript" 
 	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		if($("#btn").attr("value") == "삭제"){
			$("#btn").attr("value","삭제취소") ;
			$("#fileDel").val("${list.roomPic}");
			$("#imageView").html(
					"<input type='file' name='roomPic' />");
		}else{
			$("#btn").attr("value","삭제") ;
			$("#fileDel").val("");
			$("#imageView").html("");
		}
	});
});
</script> 
</head>
<body>
<c:if test="${!empty authInfo.employeeNum}">
<form action="roomModifyPro" method="post" enctype="multipart/form-data" >
	<table align="center" border="1">
		<tr><td>객실번호</td>
			<td>${list.roomNum }</td>
		</tr>
		<tr><td>등급번호</td>
			<td><select name="ratingNum" id="ratingNum">
			<option >===List===</option>
	<c:forEach var="room" items="${rclist }" varStatus="status">
		<c:forTokens items="${room.ratingNum }" delims="" var="ratingNum" varStatus="status">
			<option value="${ratingNum}">${ratingNum}
		</option>
		</c:forTokens>
	</c:forEach>
			 </select>
			</td>
		</tr>
		<tr><td>가격</td>
			<td><input type="text" name="roomPay" id="roomPay" 
				value="${list.roomPay }"/>원
			</td>
		</tr>
		<tr><td>상품 설명</td>
			<td><textarea rows="13" cols="56"
					name="roomContent" id="roomContent">${list.roomContent }</textarea>
			</td>
		</tr>
		<tr>
		
			<td>객실 사진</td>
			<td >${list.roomPic }
				<input type="button" id="btn" value="삭제"/>
				<c:forTokens items="${list.roomPic }" delims="`" var="roomPic" 
															varStatus="status">
															<br/>
				<img src="../room_admin/upload/${roomPic }" width="30" height="30"/>

			</c:forTokens>
			
			</td>
		</tr>
		<tr><td>대체 사진</td>
			<td><div id="imageView">*파일 삭제 안되고 파일만 추가됨.</div>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="객실수정" />
				<input type="button" value="취소" onclick="history.back();"/>
			</td>
		</tr>
	</table>	
	<input type="text" name="fileDel" id = "fileDel" />		
	<input type="text" name="roomNum" id = "roomNum" 
		value="${list.roomNum }"/>	
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