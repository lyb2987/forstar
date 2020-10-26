<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 진행</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form action="CounselingModify" id="frm" name="frm" method="post">	
		<input type="hidden" id="counselingNum" name="counselingNum" value="${counselingDTO.counselingNum}"/>
		<table>
			<tr align="center" valign="middle">
				<td colspan="5"> 상담 진행 </td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 제목</div>
				</td>
				<td>
					${counselingDTO.counselingSubject}
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 시간</div>
				</td>
				<td>
					${counselingDTO.counselingDate}
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 방식</div>
				</td>
				<td>
					${counselingDTO.counselingType}
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 목적</div>
				</td>
				<td>
					${counselingDTO.counselingPurpose}
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">상담 내용 </div>
				</td>
				<td>
					<textarea id="counselingContent" name="counselingContent" cols="67" rows="15" >${counselingDTO.counselingContent}</textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">상담 특이사항 </div>
				</td>
				<td>
					<textarea id="counselingUniqueness" name="counselingUniqueness" cols="67" rows="15" >${counselingDTO.counselingUniqueness}</textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">상담 상태</div>
				</td>
				<td>
					${counselingDTO.counselingStatus}
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:frm.submit();">[상담 완료]</a>&nbsp;&nbsp;
					<a href="CounselingModifyCancle?counselingNum=${counselingDTO.counselingNum}">[상담 취소]</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>