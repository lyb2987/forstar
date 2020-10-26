<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form action="BanquetModify" name="frm" id="frm" method="post">
		<input type="hidden" id="banquetNum" name="banquetNum" value="${dto.banquetNum}">
		<input type="hidden" id="bHReservationNum" name="bHReservationNum" value="${bHReservationNum}">
		<input type="hidden" id="diffrentCharge" name="diffrentCharge">
		<table border="1">
				<tr>
					<td>
						<div align="center">
							연회 번호
						</div>
					</td>
					<td>
						${dto.banquetNum}
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							연회 종류
						</div>
					</td>
					<td>
						<select id="banquetType" name="banquetType">
							<option value="${dto.banquetType}">${dto.banquetType}</option>
							<option value="웨딩">웨딩</option>
							<option value="가족연회">가족 연회</option>
							<option value="기업연회">기업 연회</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							연회 목적
						</div>
					</td>
					<td>
						<select id="banquetPurpose" name="banquetPurpose">
							<option value="${dto.banquetPurpose}">${dto.banquetPurpose}</option>
						</select>
						
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							연회 요청 사항
						</div>
					</td>
					<td>
						<div align="center">
							<textarea id="banquetRequest" name="banquetRequest" cols="67" rows="15">${dto.banquetRequest}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							연회 이용료
						</div>
					</td>
					<td>
						<div align="center">
							<input id="banquetCharge" name="banquetCharge" value="${dto.banquetCharge}"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<a href="javascript:submitForm();">수정</a>
							&nbsp;
							<a href="javascript:history.go(-1)">돌아가기</a>
						</div>
					</td>
				</tr>
		</table>
	</form>
	<script type="text/javascript">
	
		var previousCharge = $("#banquetCharge").val();
		
		function submitForm(){
			var banquetCharge = $("#banquetCharge").val();
			var diffrentCharge = Number(banquetCharge) - Number(previousCharge);
			$("#diffrentCharge").val(diffrentCharge);
			
			$("#frm").submit();
		}
		
		$(function(){
			console.log("ready");
			$("#banquetType").change(function(){
				var bt = $("#banquetType").val();
				if(bt=="웨딩"){
					$("#banquetPurpose").empty();
					var o0 = new Option("연회 목적을 선택해주세요.", "");
					var o1 = new Option("서양식 웨딩", "서양식");
					var o2 = new Option("전통 혼례", "전통");
	
					$("#banquetPurpose").append(o0);
					$("#banquetPurpose").append(o1);
					$("#banquetPurpose").append(o2);
				}
				else if(bt=="가족연회"){
					$("#banquetPurpose").empty();
					var o0 = new Option("연회 목적을 선택해주세요.", "");
					var o1 = new Option("약혼식", "약혼식");
					var o2 = new Option("돌잔치", "돌잔치");
					var o3 = new Option("육순잔치", "육순잔치");
					var o4 = new Option("칠순잔치", "칠순잔치");
					var o5 = new Option("팔순잔치", "팔순잔치");
					var o6 = new Option("구순잔치", "구순잔치");
					var o7 = new Option("백세잔치", "백세잔치");
					
					$("#banquetPurpose").append(o0);
					$("#banquetPurpose").append(o1);
					$("#banquetPurpose").append(o2);
					$("#banquetPurpose").append(o3);
					$("#banquetPurpose").append(o4);
					$("#banquetPurpose").append(o5);
					$("#banquetPurpose").append(o6);
					$("#banquetPurpose").append(o7);
				}
				else if(bt=="기업연회"){
					$("#banquetPurpose").empty();
					var o0 = new Option("연회 목적을 선택해주세요.", "");
					var o1 = new Option("세미나", "세미나");
					var o2 = new Option("컨퍼런스", "컨퍼런스");
					var o3 = new Option("심포지움", "심포지움");
					var o4 = new Option("워크샵", "워크샵");
					var o5 = new Option("창립기념식", "창립기념식");
					var o6 = new Option("취임식", "취임식");
					var o7 = new Option("신년회", "신년회");
					var o8 = new Option("망년회", "망년회");
					
					$("#banquetPurpose").append(o0);
					$("#banquetPurpose").append(o1);
					$("#banquetPurpose").append(o2);
					$("#banquetPurpose").append(o3);
					$("#banquetPurpose").append(o4);
					$("#banquetPurpose").append(o5);
					$("#banquetPurpose").append(o6);
					$("#banquetPurpose").append(o7);
					$("#banquetPurpose").append(o8);
				}
			})
		});
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>