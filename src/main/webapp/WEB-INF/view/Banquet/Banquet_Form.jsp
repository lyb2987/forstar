<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 예약</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form:form action="BanquetInsert" method="post" id="frm" name="frm" commandName="banquetCommand">
		<form:hidden path="counselingNum"/>
		<form:hidden path="reservationType"/>
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
					연회 예약
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						연회 종류
					</div>
				</td>
				<td>
					<div align="center">
						<form:select path="banquetType" id="banquetType" name="banquetType">
							<form:option value="">연회 종류를 선택해주세요.</form:option>
							<form:option value="웨딩">웨딩</form:option>
							<form:option value="가족연회">가족 연회</form:option>
							<form:option value="기업연회">기업 연회</form:option>
						</form:select>
						<form:errors  path="banquetType"/>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						연회 종류
					</div>
				</td>
				<td>
					<div align="center" id="bpDiv">
						<form:select path="banquetPurpose">
							<form:option value="">연회 목적을 선택해주세요.</form:option>
						</form:select>
						<form:errors  path="banquetPurpose"/>
					</div>
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
						<form:textarea path="banquetRequest" cols="67" rows="15"/>
						<form:errors  path="banquetRequest"/>
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
						<form:input path="banquetCharge"/>
						<form:errors  path="banquetCharge"/>
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
		
	<script type="text/javascript">
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