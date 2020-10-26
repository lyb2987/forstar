<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 총요금</title>
</head>
<body>
<table>
		<tr>
				<td>결제 총금액</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${rplist[0].reserCharge }" />원</td>
				<input type="hidden" name="roomCharge" id="roomCharge" value="${rplist[0].reserCharge }">
			</tr>
			
</table>
</body>
</html>