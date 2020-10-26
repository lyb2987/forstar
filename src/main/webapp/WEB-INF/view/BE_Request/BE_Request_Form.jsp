<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 인력 요청</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" type="text/css" href="/css/jquery.datetimepicker.css"/>
<script src="/js/jquery.js"></script>
<script src="/js/jquery.datetimepicker.full.js"/></script>
</head>
<body>

<div align="center">
	<form:form action="../BERequest/BERequestInsert" commandName="bERequestCommand" id="frm" name="frm">
		<form:hidden path="bHReservationNum"/>
		<form:hidden path="memberNum"/>
		<form:hidden path="counselingNum"/>
		이용 시작 날짜 및 시간 : <form:input path="bERequestDate" type="text" id="rentDate" name="rentDate"/>
		<br />
		이용 끝 날짜 및 시간 : <form:input path="bERequestTime" type="text" id="rentTime" name="rentTime"/>
		<br />
		<input type="button" value="연회 인력 조회" id="checkBE" name="checkBE">
		
		<div id="beListDiv">
		</div>
		
		연회인력 이용료 : <input type="text" id="bETotalCharge" name="bETotalCharge"/>
		<br/>
		<br/>
		<input type="submit" value="확인">
	</form:form>
</div>

<script type="text/javascript">
	jQuery.datetimepicker.setLocale('kr');
	
	$("#rentDate").datetimepicker({
		lang : 'ko',
		allowTimes:[
		'09:00', '09:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',      
		'14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', 
		'19:00', '19:30', '20:00', '20:30', '21:30', '22:00', '22:30']
	});
	
	$("#rentTime").datetimepicker({
		lang : 'ko',
		allowTimes:[
			'09:00', '09:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',      
			'14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', 
			'19:00', '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30']
	});
	
</script>

<%@ include file="../Frame/Footer.jsp" %>

<script type="text/javascript">
$(function(){
	var rentDate = "";
	var rentTime = "";
	var count = 0;
	var usePartTime = 0;
	
	
	// 렌트 시간 입력 (이용 가능한 연회장 select 박스에 추가)
	$("#checkBE").on("click", function(){
		rentDate = $("#rentDate").val();
		rentTime = $("#rentTime").val();
			
		console.log("rentDate : " + rentDate + " , rentTime : " + rentTime);
		$.ajax({
			url : "${pageContext.request.contextPath}/BERequest/BERequestDateChange",
			type : "post",
			dataType : "json",
			data : {"rentDate" : rentDate, "rentTime" : rentTime},
			success : function(data){
				var addBEList = "";
				$("#beListDiv").empty();
				console.log(data.length);
				for(var i=0; i<data.length; i++){
					addBEList += "<input type='checkbox' class='bENum' id='bENum" + i + "' onclick='changeChkBox(this)' name='bENum' value='" + data[i].employeeNum + "' />"; 
					addBEList += "<input type='hidden' value='" + data[i].becharge + "' id='bECharge" + i + "' name='bECharge" + i + "'>";
					addBEList += "<label for='bENum" + i + "'>";
					addBEList += "이름 : " + data[i].employee.employeeName;
					addBEList += "&nbsp;사원 번호 : " + data[i].employee.employeeNum;
					addBEList += "<c:if test='${" + data[i].employee.departmentNum + " eq \"1\"}'>";
					addBEList += "&nbsp;부서 : 마스터";
					addBEList += "</c:if>";
					addBEList += "<c:if test='${" + data[i].employee.positionNum + " eq \"1\"}'>";
					addBEList += "&nbsp;부서 : 마스터";
					addBEList += "</c:if>";
					addBEList += "&nbsp;직무 : " + data[i].beduties;
					addBEList += "<br />";
					addBEList += "</label>";
				}

				$("#beListDiv").append(addBEList);
			}
		});
			
	});
	
	
});

// 연회인력 선택 시 연회 비용 추가 및 
function changeChkBox(chkBox){
	var checkValues = $(chkBox).val();
	var bEChargeNum = $(chkBox).attr("id");
	bEChargeNum = "bECharge" + bEChargeNum.replace("bENum", "");
	bECharge = $("#"+bEChargeNum).val();
	var totalCharge = Number($("#bETotalCharge").val());
	if($(chkBox).prop('checked')){
		totalCharge = Number(totalCharge) + Number(bECharge);
		$("#bETotalCharge").val(totalCharge);
	}
	else{
		totalCharge =  Number(totalCharge) - Number(bECharge);
		$("#bETotalCharge").val(totalCharge);
	}
}
</script>

</body>
</html>