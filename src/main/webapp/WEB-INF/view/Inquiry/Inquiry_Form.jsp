<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form:form action="InquiryInsert" id="frm" name="frm" method="post" 
				commandName="inquiryCommand">
	<table>
		<tr align="center" valign="middle">
			<td colspan="5"> 문의 작성 </td>
		</tr>
		<tr>
			<td style="font-family:돋음; font-size:12" height="16">
				<div align="center">문의 제목</div>
			</td>
			<td>
				<form:input path="inquirySubject" size="50" maxlength="50" />
				<form:errors  path="inquirySubject"/> 
			</td>
		</tr>
		<tr>
			<td style="font-family:돋음; font-size:12" height="16">
				<div align="center">문의 종류</div>
			</td>
			<td>
				<form:select path="inquiryType">
					<form:option value="">문의종류를 선택해주세요.</form:option>
					<form:option value="상담">상담 문의</form:option>
					<form:option value="객실">객실 문의</form:option>
					<form:option value="레스토랑">레스토랑 문의</form:option>
					<form:option value="연회장">연회 문의</form:option>
					<form:option value="라이프스타일">라이프스타일 문의</form:option>
				</form:select>
				<form:errors  path="inquiryType"/> 
			</td>
		</tr>
		<tr>
			<td style="font-family:돋음; font-size:12">
				<div align="center">내 용 </div>
			</td>
			<td>
				<form:textarea path="inquiryContent" cols="67" rows="15"></form:textarea>
				<br/>
				<form:errors  path="inquiryContent"/> 
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
</div>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>