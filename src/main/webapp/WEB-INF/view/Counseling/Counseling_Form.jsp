<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 일정 등록</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" type="text/css" href="/css/jquery.datetimepicker.css"/>
<script src="/js/jquery.js"></script>
<script src="/js/jquery.datetimepicker.full.js"/></script>
</head>
<body>

<div align="center">
	<form:form action="CounselingInsert" id="frm" name="frm" method="post" commandName="counselingCommand">	
		<form:hidden path="memberNum"/>
		<table>
			<tr align="center" valign="middle">
				<td colspan="5"> 상담 일정 등록 </td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 제목</div>
				</td>
				<td>
					<form:input path="counselingSubject" size="50" maxlength="50"/>
					<form:errors  path="counselingSubject"/> 
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 시간</div>
				</td>
				<td>
					<form:input type="text" path="counselingDate" id="counselingDate" size="50"/>
					<form:errors  path="counselingDate"/> 
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 방식</div>
				</td>
				<td>
					<form:select path="counselingType">
						<form:option value="">상담 방식을 선택해주세요.</form:option>
						<form:option value="방문">방문 상담</form:option>
						<form:option value="전화">전화 상담</form:option>
					</form:select>
					<form:errors  path="counselingType"/> 
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 목적</div>
				</td>
				<td>
					<form:select path="counselingPurpose">
						<form:option value="">상담 목적을 선택해주세요.</form:option>
						<form:option value="객실">객실 관련 상담</form:option>
						<form:option value="레스토랑">레스토랑 관련 상담</form:option>
						<form:option value="연회장">연회 관련 상담</form:option>
						<form:option value="라이프스타일">라이프스타일 관련 상담</form:option>
						<form:option value="기타">기타 상담</form:option>
					</form:select>
					<form:errors  path="counselingPurpose"/> 
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">내 용 </div>
				</td>
				<td>
					<form:textarea path="counselingContent" cols="67" rows="15" />
					<br/>
					<form:errors  path="counselingContent"/> 
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:frm.submit();">[문의 등록]</a>&nbsp;&nbsp;
					<a href="InquiryList">[목록]</a>
				</td>
			</tr>
		</table>
	</form:form>
	
	<script type="text/javascript">
	
		jQuery.datetimepicker.setLocale('kr');
		
		$("#counselingDate").datetimepicker({
			lang : 'ko',
			allowTimes:[
			'09:00', '09:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',     
			'14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00']
		});
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>