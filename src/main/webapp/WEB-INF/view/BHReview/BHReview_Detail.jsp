<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 후기 조회</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<table border="1">
		<tr align="center" valign="middle">
			<td colspan="2">후기 조회</td>
		</tr>
		<tr align="left" valign="middle">
			<td >
				후기 번호
			</td>
			<td>
				${dto.BHReviewNum}
			</td>
		</tr>
		<tr align="left" valign="middle">
			<td>
				고객 번호 / 연회장 예약 번호
			</td>
			<td>
				${dto.memberNum} &nbsp; / &nbsp; ${dto.BHReservationNum}
			</td>
		</tr>
		<tr>
			<td height="16">
				<div align="center">
					제 목
				</div>
			</td>
			<td>
				${dto.BHReviewSubject}
			</td>
		</tr>
		<tr>
			<td height="16">
				<div align="center">
					평 점
				</div>
			</td>
			<td>
				${dto.BHReviewSatisfaction} / 10점
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					내용
				</div>
			</td>
			<td>
				${dto.BHReviewContent}
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					개선 요청 사항
				</div>
			</td>
			<td>
				${dto.BHReviewImprovement}
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					문의 시간
				</div>
			</td>
			<td>
				${dto.BHReviewRegister}
			</td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="8">
				<font size=2>
					<a href="BHReviewModifyForm?bHReviewNum=${dto.BHReviewNum}">
						[수정]
					</a>
					&nbsp;&nbsp;
					<a href="BHReviewDelete?bHReviewNum=${dto.BHReviewNum}">
						[삭제]
					</a>
					&nbsp;&nbsp;
					<a href="BHReviewList">
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