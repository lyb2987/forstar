<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실예약</title>
<%@ include file="../Frame/Header.jsp" %>

<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script type="text/javascript">
$(function(){
	$("#search").click(function() {
		if($("#reserStart").val().length==0){ alert("대여시작날짜를 입력하세요."); $("#reserStart").focus(); return false; }
		if($("#reserEnd").val().length==0){ alert("대여끝날짜를 입력하세요."); $("#reserEnd").focus(); return false; }
		$.ajax({
			type:"POST",
			url : "/room/openroomlist",
			cache : false,
			data : "date=" + $("#reserEnd").val(),
			datatype : "html",
			success : function(data){
				$("#roomlist").html(data);
			},
			error : function( jqXHR, textStatus, errorThrown  ) {
				alert( jqXHR.status );
						}
		
		});
	});
});
</script>
<link rel="stylesheet" type="text/css" href="../css/Regist.css" />
</head>




<style>
img{ vertical-align: bottom;}
</style>
<body>

<c:if test="${!empty authInfo.name}">
<div class="container">
	<div class="ctnJoin ctnJoinStep1">
		<div class="agreeBox contents" id="contents">
		</div>
								
		<div class="joinFormDiv">
<form:form action="roomReserPro" name = "frm" id="frm" 
	method = "post" commandName="roomReserCommand">
<table width = 600 align = "center" border = 1 >
<input type="hidden" name ="memberNum" id="memberNum" value="${authInfo.memberNum}"/>
 	<tr>
 		<td  width = "400">객실예약번호</td>
 		<td  width = "400">
 			<form:input type="text" path="roomReserNum" id = "roomReserNum"
 			size = "20" maxlength="20"   readonly="true"/>
 		</td>
 	</tr>
 		 	
 	<tr>
 		<td width = "400">예약 날짜</td>
 		<td width = "400">
 		<form:input type="datetime-local" path="reserDate" id="reserDate"   readonly="true"/>
 		</td>
 	</tr>
 	
 	<tr>
 		<td  width = "400">대여 시작 날짜</td>
 		<td  width = "400">
 		<form:input size = "10" path="reserStart" id="reserStart" readonly="true" placeholder="YYYY-MM-DD"/><img src="../room/image/calendar.png" width="25" height="25">
 		</td>
 	</tr>
<tr>
 		<td  width = "400">대여 끝 날짜</td>
 		<td  width = "400">
 		<form:input size = "10"  path="reserEnd" id="reserEnd"  readonly="true" placeholder="YYYY-MM-DD"/><img src="../room/image/calendar.png" width="25" height="25">
 		<input type="button" name="search" id="search" value="조회"/>
 		</td>
 		
 	</tr> 	
 	
 	<tr><td colspan="2" align="center"><div id="roomlist"></div>
 	<div id="openroom"></div></td></tr>
 	 	
 	 	
 	<tr><td  width = "400">커스텀</td>
 			<td><textarea rows="13" cols="56" 
					name="reserCustom" id="reserCustom" >요청사항을 입력하세요.</textarea>
			</td>
		</tr>
		
 	<tr>
		<td colspan = 2>
			<a class="buttonstyleA" style="color:#fff; text-decoration: none" onclick="javascript:frm.submit();">예약</a>
			<a class="buttonstyleA" style="color:#fff; text-decoration: none" onclick="history.back();">취소</a>
 		</td>
	</tr>
	<input type="hidden" name="rStatus" id="rStatus" value="미결제"/>
 </table>
</form:form>
</div>
</div>
</div>
</c:if>
<c:if test="${empty authInfo.name}">
<table align="center">
<tr><td>로그인이 필요한 서비스 입니다.</td></tr>
</table>
</c:if>
<script>
 const offset = new Date().getTimezoneOffset() * 60000;
 document.getElementById('roomReserNum').value=new Date(Date.now() - offset).toISOString().slice(0,19);
 document.getElementById('reserDate').value=new Date(Date.now() - offset).toISOString().slice(0,16);
</script> 
<script>
$("#reserStart").datepicker({
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
$("#reserEnd").datepicker({
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