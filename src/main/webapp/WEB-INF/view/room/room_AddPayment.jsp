<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가결제</title>
<%@ include file="../Frame/Header.jsp" %>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#orderNum").change(function() {
			$.ajax({
				type : "POST",
				url : "/room/roomorderlist",
				data : "list=" + $("#orderNum").val(),
				datatype : "html",
				success : function(data) {
					$("#roList").html(data);
				}
			});
		});
	});
</script>
  <script>	
	$(document).ready(function(){ 
		$("#submit").click(function(){
			if($("#addpaymentNum").val().length==0){ alert("추가결제번호를 입력하세요."); $("#addpaymentNum").focus(); return false; }
			if($("#orderNum").val()==''){ alert("주문번호를 선택해 주세요."); $("#orderNum").focus(); return false; } 
			if($("#addpaymentStatus").val()==''){ alert("추가결제 여부를 선택해 주세요."); $("#addpaymentStatus").focus(); return false; }
			});		
	});
	</script>
</head>
<body>
<c:if test="${!empty rolist }">
	<form action="addpaymentPro" method="post" name="frm" id="frm" >
		<table align="center" border="1">
			<tr>
				<td>추가결제 번호</td>
				<td><input type="text" name="addpaymentNum" id="addpaymentNum" /></td>
			</tr>
			<tr>
				<td>주문번호</td>
				<td><select name="orderNum" id="orderNum">
						<option value="">===List===</option>
						<c:forEach var="room" items="${rolist }" varStatus="status">
							<c:forTokens items="${room.orderNum }" delims=""
								var="orderNum" varStatus="status">
								<option value="${orderNum}">${orderNum}</option>
							</c:forTokens>
						</c:forEach>
				</select></td>
			</tr>
			<td colspan="2"><div id="roList"></div></td>
			<tr>
				<td>추가결제 여부</td>
				<td><select name="addpaymentStatus" id="addpaymentStatus">
						<option value="">===결제여부===</option>
								<option value="미결제">미결제</option>
								<option value="결제">결제</option>
				</select>
			</tr>
			<input type="hidden" name ="memberNum" id="memberNum" value="${authInfo.memberNum}"/>
			<tr>
				<td>결제수단</td>
				<td><select name='addpaymentMeans' id='addpaymentMeans'>
    <option value='card'>신용카드</option>
    <option value='bank'>계좌이체</option>
</select>
			</td>	
				</tr>
				

			<tr>
				<td colspan=2><input type="submit" id="submit" value="결제요청" /> <input
					type="button" value="취소" onclick="history.back();" /></td>
			</tr>
		</table>
	</form>
	</c:if>
		<c:if test="${empty rolist}">
<table align="center">
<tr><td>추가결제 정보가 없습니다.</td></tr>
</table>
</c:if>
	<c:if test="${!empty loginError}">
<table align="center">
<tr><td>회원으로 로그인해주세요.</td></tr>
</table>
</c:if>

	<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>