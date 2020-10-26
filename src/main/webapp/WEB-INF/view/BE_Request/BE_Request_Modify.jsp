<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 인력 요청 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form action="/BERequestInsert" id="frm" name="frm">
		<input type="hidden" id="memberNum" name="memberNum" value="${list[0].memberNum}"/>
		<input type="hidden" id="bERequestDate" name="bERequestDate" value="${list[0].BERequestDate}"/>
		<input type="hidden" id="bERequestTime" name="bERequestTime" value="${list[0].BERequestTime}"/>
		<input type="hidden" id="bHReservationNum" name="bHReservationNum" value="${list[0].BHReservationNum}"/>
		<table border="1">
			<tr>
				<td colspan="2">
					예약한 연회 인력
				</td>
			</tr>
			
			<tr>
				<td>
					연회 인력
				</td>
				<td id="useBE">	
					<c:forEach items="${list}" varStatus="i" var="bed">
						<input type="checkbox" class="useBEchk" value="${bed.BERequestNum},${bed.be.BECharge}"> 이름 : ${bed.employee.employeeName} &nbsp; 직무 : ${bed.be.BEDuties} &nbsp; 이용료 : ${bed.be.BECharge}
						<br />
					</c:forEach>
					<input type="button" onclick="javascript:bERequestCancel();" value="연회 인력 예약 취소">
				</td>
			</tr>
			<tr>
				<td>
					이용 시간
				</td>
				<td>	
					${list[0].BERequestDate} ~ ${list[0].BERequestTime}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					예약가능한 연회 인력
				</td>
			</tr>
			<tr>
				<td>
					연회 인력
				</td>
				<td id="nuseBE">	
					<c:if test="${!empty beList }">
						<c:forEach items="${beList}" varStatus="i" var="nuseBed">
							<input type="checkbox" class="nuseBEchk" value="${nuseBed.BENum},${nuseBed.BECharge}"> 이름 : ${nuseBed.employee.employeeName} &nbsp; 직무 : ${nuseBed.BEDuties} &nbsp; 이용료 : ${nuseBed.BECharge}
							<br />
						</c:forEach>
						<input type="button" onclick="javascript:bERequestAdd();" value="연회 인력 추가">				
					</c:if>
					<c:if test="${empty beList }">
						예약 가능한 연회 인력이 없습니다.
					</c:if>
				</td>
			</tr>
		</table>
		<br/>
		<a href="../BHReservation/TotalReservationDetail?bHReservationNum=${list[0].BHReservationNum}">수정 완료</a>
	</form>
	<script type="text/javascript">
	
		// 연회인력 추가
		function bERequestAdd(){
			var selectnuseBEchk = "";
			var memberNum = $("#memberNum").val();
			var bERequestDate = $("#bERequestDate").val();
			var bERequestTime = $("#bERequestTime").val();
			var bHReservationNum = $("#bHReservationNum").val();
		
			$('input[class="nuseBEchk"]:checked').each(function(index){
				if(index != 0){
					selectnuseBEchk += '/';
				}
				selectnuseBEchk += $(this).val();
			});
			
			console.log(selectnuseBEchk);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/BERequest/BERequestAdd",
				type : "post",
				dataType : "json",
				data : {"selectnuseBE" : selectnuseBEchk, "memberNum" : memberNum, 
						"bERequestDate" : bERequestDate, "bERequestTime" : bERequestTime, "bHReservationNum" : bHReservationNum},
				success : function(data){
					$("#useBE").empty();
					$("#nuseBE").empty();
					var dataTest = data;
					var useBEHTML = "";
					var nuseBEHTML = "";
					console.log(data);
					for(var i=0; i<data.list.length; i++){
						useBEHTML += "<input type='checkbox' class='useBEchk' value='"+ data.list[i].berequestNum + "," + data.list[i].be.becharge;
						useBEHTML += "'> 이름 : "+ data.list[i].employee.employeeName + " &nbsp; 직무 : " + data.list[i].be.beduties + " &nbsp; 이용료 : " + data.list[i].be.becharge;					
						useBEHTML += "<br />";
					}
					useBEHTML += "<input type='button' onclick='javascript:bERequestCancel();' value='연회 인력 예약 취소'>";
					
					for(var j=0; j<data.beList.length; j++){
						nuseBEHTML += "<input type='checkbox' class='nuseBEchk' value='" + data.beList[j].benum + "," + data.beList[j].becharge + "'> 이름 : ";
						nuseBEHTML += data.beList[j].employee.employeeName + " &nbsp; 직무 : " + data.beList[j].beduties + " &nbsp; 이용료 : " + data.beList[j].becharge;
						nuseBEHTML += "<br />";
					}
					nuseBEHTML += "<input type='button' onclick='javascript:bERequestAdd();' value='연회 인력 추가'>";
					$("#useBE").append(useBEHTML);
					$("#nuseBE").append(nuseBEHTML);
				}
			});
		}
		
		// 연회 인력 취소
		function bERequestCancel(){
			var selectBEChk = "";
			var bHReservationNum = $("#bHReservationNum").val();
			var bERequestDate = $("#bERequestDate").val();
			var bERequestTime = $("#bERequestTime").val();
			
			$('input[class="useBEchk"]:checked').each(function(index){
				if(index != 0){
					selectBEChk += '/';
				}
				selectBEChk += $(this).val();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/BERequest/BERequestCancel",
					type : "post",
					dataType : "json",
					data : {"selectBE" : selectBEChk, "bHReservationNum" : bHReservationNum, "bERequestDate" : bERequestDate, "bERequestTime" : bERequestTime},
					success : function(data){
						$("#useBE").empty();
						$("#nuseBE").empty();
						var dataTest = data;
						var useBEHTML = "";
						var nuseBEHTML = "";
						console.log(data);
						for(var i=0; i<data.list.length; i++){
							useBEHTML += "<input type='checkbox' class='useBEchk' value='"+ data.list[i].berequestNum + "," + data.list[i].be.becharge;
							useBEHTML += "'> 이름 : "+ data.list[i].employee.employeeName + " &nbsp; 직무 : " + data.list[i].be.beduties + " &nbsp; 이용료 : " + data.list[i].be.becharge;					
							useBEHTML += "<br />";
						}
						useBEHTML += "<input type='button' onclick='javascript:bERequestCancel();' value='연회 인력 예약 취소'>";
						
						for(var j=0; j<data.beList.length; j++){
							nuseBEHTML += "<input type='checkbox' class='nuseBEchk' value='" + data.beList[j].benum + "," + data.beList[j].becharge + "'> 이름 : ";
							nuseBEHTML += data.beList[j].employee.employeeName + " &nbsp; 직무 : " + data.beList[j].beduties + " &nbsp; 이용료 : " + data.beList[j].becharge;
							nuseBEHTML += "<br />";
						}
						nuseBEHTML += "<input type='button' onclick='javascript:bERequestAdd();' value='연회 인력 추가'>";
						$("#useBE").append(useBEHTML);
						$("#nuseBE").append(nuseBEHTML);
					}
				});
			});
			
			
			
		}
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>