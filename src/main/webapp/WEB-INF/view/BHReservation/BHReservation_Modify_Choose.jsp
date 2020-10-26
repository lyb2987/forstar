<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<title>예약 수정</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<input type="hidden" id="bHReservationNum" name="bHReservationNum" value="${bHReservationNum}"/>
	<table border="1">
		<tr>
			<td align="center">
				수정할 예약사항
			</td>
		</tr>
		<tr>
			<td align="center">
				<select name="modifyType" id="modifyType">
					<option value="">수정할 예약사항을 선택하세요.</option>
					<option value="1">연회</option>
					<option value="2">식음료</option>
					<option value="3">연회인력</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">
				<a onclick="modifySetting();">수정</a>
				<a href="Rebook?bHReservationNum=${bHReservationNum}">재예약</a>
				<a href="javascript:history.go(-1)">수정 취소</a>
			</td>
		</tr>
	</table>
	<p> 연회인력 요청에 대한 예약사항은 시간을 수정할 수 없으며 연회 인력 이용에 대한 취소 또는 추가 수정만 가능합니다, 대관 예약 사항은 수정할 수 없습니다.</p>
	<p> 연회인력 및 대관 일정에 대해 수정하기 위해서는 예약 취소 후 재예약을 진행해주세요.</p>
	
	<script type="text/javascript">
		var modifyTypeVal = "";
		var bHReservationNum = $("#bHReservationNum").val();
		function modifySetting(){
			var modifyType = $("#modifyType").val();
			console.log(modifyType);
			
			if(modifyType == ""){
				alert("수정할 예약사항을 선택해주세요!");
				return ;
			}
			if(modifyType == 1){
				console.log("연회");
				location.href="../Banquet/BanquetModifyForm?bHReservationNum="+bHReservationNum;
			}
			if(modifyType == 2){
				console.log("식음료");
				location.href="../FAB/FABModifyForm?bHReservationNum="+bHReservationNum;
			}
			if(modifyType == 3){
				console.log("연회인력");
				location.href="../BERequest/BERequestModifyForm?bHReservationNum="+bHReservationNum;
			}
		}
		$(function(){
			console.log("ready");
			
			$("#modifyType").change(function(){
				modifyTypeVal = $("#modifyType").val();
				console.log(modifyTypeVal);
			});
		});
		
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>