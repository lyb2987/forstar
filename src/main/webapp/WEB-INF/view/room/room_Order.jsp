<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룸서비스 주문</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#restaurantNum").change(function() {
			$.ajax({
				type : "POST",
				url : "/room/roomrestaurantlist",
				data : "num=" + $('#restaurantNum').val(),
				datatype : "html",
				success : function(data) {
					$("#menuList").html(data);
				}
			
			});
		});
	});
</script>
</head>
<body>
<c:if test="${!empty mrlist}">
	<form action="roomOrderPro" method="post" name="frm" id="frm">
		<table align="center" border="1">
			<tr>
				<td>주문 번호</td>
				<td><input type="text" name="orderNum" id="orderNum" /></td>
			</tr>
			<tr>
				<td>객실예약 번호</td>
				<td><select name="roomReserNum" id="roomReserNum">
						<option>===List===</option>
						<c:forEach var="room" items="${mrlist }" varStatus="status">
							<c:forTokens items="${room.roomReserNum }" delims=""
								var="roomReserNum" varStatus="status">
								<option value="${roomReserNum}">${roomReserNum}</option>
							</c:forTokens>
						</c:forEach>
				</select></td>
			</tr>
			<input type="hidden" name ="memberNum" id="memberNum" value="${authInfo.memberNum}"/>
			<tr>
				<td>레스토랑</td>
				<td><select name="restaurantNum" id="restaurantNum">
						<option value="">---식당---</option>
						<c:forEach items="${rnlist }" var="restaurantNum">
							<option value="${restaurantNum.restaurantNum}">${restaurantNum.restaurantNum }</option>
						</c:forEach>
				</select>
				
				<div id="menuList">
						<select>
							<option value="">---메뉴---</option>
						</select>
					</div></td>
			</tr>

			<tr>
				<td>수량</td>
				<td><input type="number" name="orderCount" id="orderCount" /></td>
			</tr>
			<tr>
				<td>기타 요청사항</td>
				<td><textarea rows="13" cols="30" name="orderEtc" id="orderEtc">테스트</textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="주문요청" /> <input
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