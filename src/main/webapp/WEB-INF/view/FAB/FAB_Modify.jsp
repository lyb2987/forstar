<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식음료 요청 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<form action="FABModify" method="post" id="frm" name="frm">
	<input type="hidden" id="bHReservationNum" name="bHReservationNum" value="${dto.BHReservationNum}"/>	
	<input type="hidden" id="fabNum" name="fabNum" value="${dto.fabNum}"/>	
	<input type="hidden" id="restaurantNum" name="restaurantNum" value="${dto.restaurantNum}"/>
	<input type="hidden" id="diffrentCharge" name="diffrentCharge" />
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
				<select  id="menuName" name="menuName">
					<option value="${dto.menuName}">${dto.menuName}</option>
					<c:forEach items="${menuList}" var="menu">
						<option value="${menu.menuName}, ${menu.restaurantNum}, ${menu.menuPrice}">${menu.menuName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				인원수
			</td>
			<td>
				<input type="text" name="fabNoP" id="fabNoP" value="${dto.fabNoP}"/>
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
				<input type="text" name="fabCharge" id="fabCharge" value="${dto.fabCharge}"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인">
			</td>
		</tr>	
	</table>
</form>
<script type="text/javascript">
	
	var previousCharge = $("#fabCharge").val();
	
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
		var fabCharge = $("#fabCharge").val();
		var diffrentCharge = Number(fabCharge) - Number(previousCharge);
		$("#diffrentCharge").val(diffrentCharge);
	}
</script>
</body>
</html>