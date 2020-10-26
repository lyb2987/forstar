<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대관 예약</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" type="text/css" href="/css/jquery.datetimepicker.css"/>
<script src="/js/jquery.js"></script>
<script src="/js/jquery.datetimepicker.full.js"/></script>
</head>
<body>

<div align="center">
	<form:form action="../Rent/RentInsert" method="post" id="frm" name="frm" commandName="rentCommand">
		<form:hidden path="counselingNum"/>
		<form:hidden path="reservationType"/>
		<form:hidden path="banquetNum"/>
		<table border="1">
				<tr align="center" valign="middle">
					<td colspan="2">
						상담 글
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 번호
						</div>
					</td>
					<td>
						<div align="left">
							${counselingDTO.counselingNum}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 제목
						</div>
					</td>
					<td>
						<div align="left"> 
							${counselingDTO.counselingSubject}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 목적
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.counselingPurpose}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 방식
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.counselingType}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 시간
						</div>
					</td>
					<td>
						<div align="center">
							<fmt:formatDate value="${counselingDTO.counselingDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/> 
						</div>
					</td>	
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 내용
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.counselingContent}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 특이사항
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.counselingUniqueness}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 직원
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.employeeNum}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담자
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.memberNum}
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							상담 상태
						</div>
					</td>
					<td>
						<div align="center">
							${counselingDTO.counselingStatus }
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						연회장 대관 예약
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							대관 요청 날짜 및 시간
						</div>
					</td>
					<td>
						<div align="center">
							<form:input path="rentDate" type="text" id="rentDate"/>
							<form:errors  path="rentDate"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							대관 이용 시간
						</div>
					</td>
					<td>
						<div align="center" id="bpDiv">
							<form:input path="rentTime" type="text" id="rentTime"/>
							<form:errors  path="rentTime"/>
							&nbsp; &nbsp;
							<input type="button" onclick="javascript:getBanquetHall();" value="대관 가능 연회장 가져오기">
							
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							대관 연회장
						</div>
					</td>
					<td>
						<div align="center">
							<form:select path="rentBanquetHall" id="rentBanquetHall" name="rentBanquetHall">
								<form:option value="">연회장을 선택해주세요.</form:option>
							</form:select>
							<form:errors  path="rentBanquetHall"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							대관 이용료
						</div>
					</td>
					<td>
						<div align="center">
							<form:input path="rentCharge"/>
							<form:errors  path="rentCharge"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<a href="javascript:frm.submit();">다음 (연회장 예약)</a>
							<a href="../Counseling/CounselingReserveStop?counselingNum=${counselingDTO.counselingNum}">예약 중단</a>
						</div>
					</td>
				</tr>
		</table>
	</form:form>
</div>

<script type="text/javascript">
	
	jQuery.datetimepicker.setLocale('kr');
	
	$("#rentDate").datetimepicker({
		lang : 'ko',
		allowTimes:[
		'09:00', '09:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',      
		'14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', 
		'19:00', '19:30', '20:00', '20:30']
	});
	
	$("#rentTime").datetimepicker({
		lang : 'ko',
		allowTimes:[
			'09:00', '09:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',      
			'14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', 
			'19:00', '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30']
	});
	
	var userPartTime2 = 0;
	
	function getBanquetHall(){
		var rentDate = "";
		var rentTime = "";
		var count = 0;
		var usePartTime = 0;
		
		rentDate = $("#rentDate").val();
		rentTime = $("#rentTime").val();
		console.log("rentDate : " + rentDate + " , rentTime : " + rentTime);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/Rent/RentDateChange",
			type : "post",
			dataType : "json",
			data : {"rentDate" : rentDate, "rentTime" : rentTime},
			success : function(data){
				console.log(data.length);
				count = 0;
				$("#rentBanquetHall").empty();

				var defaultOption = new Option("연회장을 선택해주세요.", "");
				$("#rentBanquetHall").append(defaultOption);
				
				for(var i=0; i<data.length; i++){
					var option = new Option(data[i], data[i]);
					$("#rentBanquetHall").append(option);
				}
				
				var rentS = rentDate.substring(11,16).replace(':', '');
				var rentE = rentTime.substring(11,16).replace(':', '');
				rentE = rentE.replace('3', '5');
				rentS = rentS.replace('3', '5');
				
				console.log("rentE : " + rentE);
				console.log("rentS : " + rentS);
				
				
				usePartTime =  (rentE-rentS)/50;
				usePartTime2 = usePartTime;
				console.log("usePartTime : " + usePartTime);

			}
		});
		
	}
	
	$(function(){
		var rentDate = "";
		var rentTime = "";
		var count = 0;
		var usePartTime = 0;
		
		// 렌트 날짜 입력
		$("#rentDate").change(function(){
			rentDate = $("#rentDate").val();
			console.log("rentDate : " + rentDate);
		});
		
		// 렌트 시간 입력 (이용 가능한 연회장 select 박스에 추가)
		
		$("#rentTime").change(function(){
			count += 1;
			
			// 렌트타임의 값이 변하였으며, 날짜, 시간 선택을 모두 마쳤는지 세는 카운트
			if(rentTime != $("#rentTime").val() && count == 2){
				rentTime = $("#rentTime").val();
				
				console.log("rentDate : " + rentDate + " , rentTime : " + rentTime);
				// 연회장 대관 시작시간과 끝시간이 입력되면 대관 가능한 연회장을 select에 추가해주는 ajax, 렌트하는 시간도 30분단위로 계산하여 저장
				$.ajax({
					url : "${pageContext.request.contextPath}/Rent/RentDateChange",
					type : "post",
					dataType : "json",
					data : {"rentDate" : rentDate, "rentTime" : rentTime},
					success : function(data){
						console.log(data.length);
						count = 0;
						$("#rentBanquetHall").empty();

						var defaultOption = new Option("연회장을 선택해주세요.", "");
						$("#rentBanquetHall").append(defaultOption);
						
						for(var i=0; i<data.length; i++){
							var option = new Option(data[i], data[i]);
							$("#rentBanquetHall").append(option);
						}
						
						var rentS = rentDate.substring(11,16).replace(':', '');
						var rentE = rentTime.substring(11,16).replace(':', '');
						rentE = rentE.replace('3', '5');
						rentS = rentS.replace('3', '5');
						usePartTime =  (rentE-rentS)/50;

					}
				});
				
			}
			else{
				console.log("rentDate 중복 처리");
			}
		});
		
		// 대관연회장과 대관 시간을 계산하여 대관 이용료 계산
		$("#rentBanquetHall").change(function(){
			console.log("usePartTime2 : " + usePartTime2);
			if($("#rentBanquetHall").val() == "다이너스티FULL"){
				$("#rentCharge").val(250000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "다이너스티A"){
				$("#rentCharge").val(215000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "다이너스티B"){
				$("#rentCharge").val(190000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "다이너스티1"){
				$("#rentCharge").val(140000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "다이너스티2"){
				$("#rentCharge").val(125000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "다이너스티3"){
				$("#rentCharge").val(100000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "루비"){
				$("#rentCharge").val(125000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "토파즈"){
				$("#rentCharge").val(100000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "에메랄드"){
				$("#rentCharge").val(100000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "내정"){
				$("#rentCharge").val(250000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "후정"){
				$("#rentCharge").val(225000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "라일락"){
				$("#rentCharge").val(75000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "마로니에"){
				$("#rentCharge").val(50000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "메이플"){
				$("#rentCharge").val(40000*usePartTime2);
			}
			else if($("#rentBanquetHall").val() == "오키드"){
				$("#rentCharge").val(65000*usePartTime2);
			}
		});
	});
	
</script>

<%@ include file="../Frame/Footer.jsp" %>


</body>
</html>