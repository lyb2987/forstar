<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크아웃 결제</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		
		<script>
		$(function(){
		$("#pay").click(function() {

			var IMP = window.IMP; // 생략가능
			IMP.init('imp29059775'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

			IMP.request_pay({
				pg: 'kakao', 
				pay_method: 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '룸서비스 추가 결제',
				amount : '${paylist[0].addpaymentCharge}',
				buyer_email : '${memberCommand.memberEmail}',
				buyer_name : '${memberCommand.memberName}',
				buyer_tel : '${memberCommand.memberTel}',
				buyer_addr : '${memberCommand.memberAddr}',
				buyer_postcode : '123-456',
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					document.getElementById('frm').submit();

				} else {
					
					
					
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
		});
		
		</script>

</head>
<body>
<c:if test="${!empty paylist}">
	<form action="roomtotalpaymentpro" method="post" name="frm" id="frm">
		<table align="center" border="1">
			<tr>
				<td>추가 결제 번호</td></tr>
				<tr><td>${paylist[0].addpaymentNum}</td></tr>
				<tr><td>주문 번호</td></tr>
				<tr><td>${paylist[0].orderNum}</td></tr>
				<tr><td>객실예약 번호</td></tr>
				<tr><td>${paylist[0].roomReserNum}</td></tr>
			<tr>	<td>결제수단</td></tr>
			<tr>	<td>${paylist[0].addpaymentMeans}</td></tr>
			<tr>	<td>결제금액 </td></tr>
			<tr>	<td>${paylist[0].addpaymentCharge}</td></tr>
			<tr>
			<input type="text" id="orderNum" name="orderNum" value="paylist[0].orderNum">
			<input type="text" id="addpaymentMeans" name="addpaymentMeans" value="결제완료">
				<td colspan=2><button type="button" id="pay" >결제 요청</button> <input
					type="button" value="취소" onclick="history.back();" /></td>
			</tr>
		</table>
	</form>
</c:if>
<c:if test="${empty paylist}">
<table align="center">
<tr><td>결제 요청 내역이 없습니다.</td></tr>
</table>
</c:if>
	<script>
		$("#cleaningClear").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					yearSuffix : '년',
					minDate : 0

				});
	</script>
	<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>