<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 조회</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form action="InquiryModify" id="frm" name="frm" method="post">
		<input type="hidden" id="inquiryNum" name="inquiryNum" value="${inquiryDTO.inquiryNum}">
		<table border="1">
			<tr align="center" valign="middle">
				<td colspan="2">문의글 조회</td>
			</tr>
			<tr align="left" valign="middle">
				<td >
					글번호
				</td>
				<td>
					${inquiryDTO.inquiryNum}
				</td>
			</tr>
			<tr align="left" valign="middle">
				<td>
					글쓴이
				</td>
				<td>
					${inquiryDTO.memberNum}
				</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">
						제 목
					</div>
				</td>
				<td>
					${inquiryDTO.inquirySubject}
				</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">
						문의 종류
					</div>
				</td>
				<td>
					${inquiryDTO.inquiryType}
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						내용
					</div>
				</td>
				<td>
					<textarea id="inquiryContent" name="inquiryContent" cols="67" rows="15">${inquiryDTO.inquiryContent}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						문의 시간
					</div>
				</td>
				<td>
					${inquiryDTO.inquiryDate}
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						문의 상태
					</div>
				</td>
				<td>
					${inquiryDTO.inquiryStatus}
				</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="8">
					<font size=2>
						<a href="javascript:frm.submit();">
							[수정하기]
						</a>
						&nbsp;&nbsp;
						<a href="javascript:history.back();">
							[돌아가기]
						</a>
					</font>
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../Frame/Footer.jsp" %>


</body>
</html>