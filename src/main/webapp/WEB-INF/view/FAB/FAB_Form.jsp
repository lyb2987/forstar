<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식음료 요청</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<form:form action="../FAB/FABInsert" commandName="fabCommand" method="post" id="frm" name="frm">
	<form:hidden path="bHReservationNum"/>
	<form:hidden path="memberNum"/>
	<form:hidden path="counselingNum"/>
	<form:hidden path="restaurantNum"/>
	<form:hidden path="reservationType"/>
	<table border="1">
		<tr>
			<td colspan="2">
				식음료 요청
			</td>
		</tr>
		<tr>
			<td>
				메뉴
			</td>
			<td>
				<form:select path="menuName" id="menuName" name="menuName">
					<form:option value="">메뉴를 선택해주세요.</form:option>
					<c:forEach items="${menuList}" var="menu">
						<form:option value="${menu.menuName}, ${menu.restaurantNum}, ${menu.menuPrice}">${menu.menuName}</form:option>
					</c:forEach>
				</form:select>
			</td>
		</tr>
		<tr>
			<td>
				인원수
			</td>
			<td>
				<form:input path="fabNoP"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="priceCalculation();" value="가격 계산">
			</td>
		</tr>
		<tr>
			<td>
				가격
			</td>
			<td>
				<form:input path="fabCharge"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인">
			</td>
		</tr>	
	</table>
</form:form>
<script type="text/javascript">
	$(function(){
		
		$("#menuName").on("change", function(){
			var menuVal = $("#menuName").val();
			var menuSplit = menuVal.split(',');
			var restaurantNum = menuSplit[1];
			$("#restaurantNum").val(restaurantNum);
			console.log($("#restaurantNum").val());
		});
	});
	
	function priceCalculation(){
		var menuVal = $("#menuName").val();
		var menuSplit = menuVal.split(',');
		var menuPrice = menuSplit[2];
		var fapNoP = $("#fabNoP").val();
		$("#fabCharge").val(Number(menuPrice) * Number(fapNoP));
	}
</script>
</body>
</html>