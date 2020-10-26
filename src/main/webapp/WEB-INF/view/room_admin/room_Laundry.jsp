<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청소목록</title>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" type="text/css" href="../css/Admin.css" />
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div class="container">
	<div class="adminCtn">
		<div class="adminBox contents" id="contents">
			<div class="location rgt">
				<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>청소 목록</strong></p>
			</div>
			<div class="headTit">
				<h4 class="tit">관리자 페이지</h4>
			</div>
			<div class="adminContent">
				<c:if test="${!empty authInfo.employeeNum}">
				<br/>
<form:form action="laundryPro" name = "frm" id="frm" 
	method = "post" commandName="laundryCommand">
<table width = 400 align = "center" border = 1 >
 	<tr>
 		<td  width = "300">청소목록번호</td>
 		<td  width = "400">
 			<form:input path="laundryNum" id = "laundryNum"
 			size = "12" maxlength="10" />
 		</td>
 	</tr>
 	<tr>
 		<td width = "300">침구류세탁</td>
 		<td width = "400">
 		<form:input type="datetime-local" path="laundryBad" id="laundryBad"/>
 		</td>
 	</tr>
 	<tr>
 		<td  width = "300">교체</td>
 		<td  width = "400">
 		<form:input type="datetime-local" path="laundryChange" id="laundryChange"/>
 		</td>
 	</tr>
 	<tr>
 		<td  width = "300">방역</td>
 		<td  width = "400">
 		<form:input type="datetime-local" path="laundryPrevention" id="laundryPrevention"/>
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

				</c:if>
			</div>
		</div>
	</div>
</div>



<%@ include file="../Frame/Footer.jsp" %>

<script>
 const offset = new Date().getTimezoneOffset() * 60000;
 document.getElementById('laundryBad').value=new Date(Date.now() - offset).toISOString().slice(0,16);
 document.getElementById('laundryChange').value=new Date(Date.now() - offset).toISOString().slice(0,16);
 document.getElementById('laundryPrevention').value=new Date(Date.now() - offset).toISOString().slice(0,16);
</script> 
</body>
</html>