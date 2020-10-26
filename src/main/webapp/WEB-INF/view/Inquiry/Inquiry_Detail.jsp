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
				${inquiryDTO.inquiryContent}
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
					문의 답변
				</div>
			</td>
			<td>
				<c:if test="${inquiryDTO.inquiryAnswer eq null}">
					아직 답변이 등록되지 않았습니다.
				</c:if>
				<c:if test="${inquiryDTO.inquiryAnswer ne null}">
					${inquiryDTO.inquiryAnswer}
				</c:if>
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
				<c:if test="${inquiryDTO.inquiryType eq '상담'}">
					<a href="../Counseling/CounselingForm?inquiryNum=${inquiryDTO.inquiryNum}&memberNum=${inquiryDTO.memberNum}">
						[상담 일정 등록]
					</a>
					&nbsp;&nbsp;
				</c:if>
					<a href="InquiryModifyForm?inquiryNum=${inquiryDTO.inquiryNum }">
						[수정]
					</a>
					&nbsp;&nbsp;
					<a href="InquiryDelete?inquiryNum=${inquiryDTO.inquiryNum }">
						[삭제]
					</a>
					&nbsp;&nbsp;
					<a href="InquiryList">
						[목록]
					</a>
				</font>
			</td>
		</tr>
	</table>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>