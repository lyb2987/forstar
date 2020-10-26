<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담글 조회</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
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
			<td colspan="2">
				<a href="../BHReservation/BHReservationIRChoose?counselingNum=${counselingDTO.counselingNum}"> 예약 처리 </a>
				<a href="CounselingModifyForm?counselingNum=${counselingDTO.counselingNum}">상담 진행</a>
				<a href="CounselingDelete?counselingNum=${counselingDTO.counselingNum}">삭제</a>
			</td>
		</tr>
	</table>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>