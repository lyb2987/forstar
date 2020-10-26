<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실결제</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>	
	$(document).ready(function(){ 
		$("#submit").click(function(){
			/* if($("#addpaymentNum").val().length==0){ alert("추가결제번호를 입력하세요."); $("#addpaymentNum").focus(); return false; } */
			if($("#roomReserNum").val()==''){ alert("객실 예약 번호를 선택해 주세요."); $("#roomReserNum").focus(); return false; } 
			if($("#roomStatus").val()==''){ alert("결제상태를 선택해 주세요."); $("#roomStatus").focus(); return false; }
			});		
	});
	</script>
	<script type="text/javascript">
	$(function() {
		$("#roomReserNum").change(function() {
			$.ajax({
				type : "POST",
				url : "/room/roompaymentlist",
				data : "num=" + $("#roomReserNum").val(),
				datatype : "html",
				success : function(data) {
					$("#roomPay").html(data);
				}
			});
		});
	});
</script>
</head>
<body>
<c:if test="${!empty mrlist}">
	<form action="roompaymentPro" method="post" name="frm" id="frm" >
		<table align="center" border="1">
			<tr>
				<td>객실 예약 번호</td>
				<td><select name="roomReserNum" id="roomReserNum">
						<option value="">===List===</option>
						<c:forEach var="room" items="${mrlist }" varStatus="status">
							<c:forTokens items="${room.roomReserNum }" delims=""
								var="roomReserNum" varStatus="status">
								<option value="${roomReserNum}">${roomReserNum}</option>
							</c:forTokens>
						</c:forEach>
				</select></td>
			</tr>
			
			<tr>
				<td>고객 번호</td>
				<td><input type="text" name="memberNum" id="memberNum"  value="${mrlist[0].memberNum }" readonly="readonly"></td>
				
			</tr>
			<tr>
				<td>통합결제번호</td>
				<td><input type="text" name="tpNum" id="tpNum" value="131313" readonly="readonly" >//통합결제번호받아오기</td>
				
			</tr>
			<tr><td colspan="2"><div name="roomPay" id="roomPay"> </div></td></tr>
			<tr>
				<td>결제 수단</td>
				<td><select name='roomMeans' id='roomMeans'>
   				 <option value='card'>신용카드</option>
  				  <option value='bank'>계좌이체</option>
				</select>
			</td>	
				</tr>
			
			<tr>
				<td>결제 일자</td>
				<td><input type="datetime-local" name="roomDate" id="roomDate" readonly="readonly" ></td>
				
			</tr>
			<tr>
				<td>결제 상태</td>
				<td><select name="roomStatus" id="roomStatus">
						<option value="">===결제여부===</option>
								<option value="미결제">미결제</option>
								<option value="결제">결제</option>
				</select>
			</tr>
			
			<tr>
				<td colspan=2><input type="submit" id="submit" value="결제요청" /> <input
					type="button" value="취소" onclick="history.back();" /></td>
			</tr>
		</table>
	</form>
	</c:if>
		<c:if test="${!empty loginError}">
<table align="center">
<tr><td>회원으로 로그인해주세요.</td></tr>
</table>
</c:if>
		<%@ include file="../Frame/Footer.jsp" %>
</body>

<script>
 const offset = new Date().getTimezoneOffset() * 60000;
 document.getElementById('roomDate').value=new Date(Date.now() - offset).toISOString().slice(0,16);
</script> 

</html>