<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룸서비스 오더</title>
</head>
<body>
<table>
		<tr>
				<td>객실예약번호</td>
		<td><input type=text name=roomReserNum id=roomReserNum value="${romlist[0].roomReserNum }" readonly="readonly"></td>
		</tr>
		<tr>
				<td>고객번호</td>
		<td><input type=text name=memberNum id=memberNum value="${romlist[0].memberNum }" readonly="readonly"></td></tr>
		<tr>
				<td>결제금액</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${apmlist[0].totalSum }" />원</td>
				<input type="hidden" name="addpaymentCharge" id="addpaymentCharge" value="${apmlist[0].totalSum }">
			</tr>
			
</table>
</body>
</html>