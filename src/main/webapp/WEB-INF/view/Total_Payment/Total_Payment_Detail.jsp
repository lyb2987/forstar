<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 상세</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<table border="1">
		<tr align="center" valign="middle">
			<td colspan="2">결제 정보 조회</td>
		</tr>
		<tr align="left" valign="middle">
			<td colspan="2">${bhp.memberNum}님의 결제 정보입니다.</td>
		</tr>
		<tr align="left" valign="middle">
			<td >
				통합 결제 번호
			</td>
			<td>
				${tp.tpNum}
			</td>
		</tr>
		<tr align="left" valign="middle">
			<td>
				총 결제 금액
			</td>
			<td>
				${tp.tpTotalPrice}
			</td>
		</tr>
		<tr>
			<td height="16">
				<div align="center">
					연회장 예약 번호
				</div>
			</td>
			<td>
				${bhp.BHReservationNum}
			</td>
		
		</tr>
		<tr>
			<td height="16">
				<div align="center">
					결제 수단
				</div>
			</td>
			<td>
				${bhp.BHMeans}
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					연회장 금액
				</div>
			</td>
			<td>
				${bhp.BHCharge}
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					결제 날짜 및 시간
				</div>
			</td>
			<td>
				<c:if test="${bhp.BHDate eq null}">
					아직 결제되지 않았습니다.
				</c:if>
				<c:if test="${bhp.BHDate ne null}">
					${bhp.bHDate}
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					결제 상태
				</div>
			</td>
			<td>
				${bhp.BHStatus}
			</td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="8">
				<font size=2>
					<a href="TotalPayment?tpNum=${tp.tpNum}">
						[결제 진행]
					</a>
					&nbsp;&nbsp;
					<a href="TotalPaymentCancel?tpNum=${tp.tpNum}">
						[결제 취소]
					</a>
					&nbsp;&nbsp;
					<a href="myPage/MyReservation">
						[내 예약]
					</a>
				</font>
			</td>
		</tr>
	</table>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>