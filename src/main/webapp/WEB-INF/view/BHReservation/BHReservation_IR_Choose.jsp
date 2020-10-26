<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 통합 예약</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form action="../Banquet/BanquetInsertForm" id="frm" name="frm" method="post">
		<input type="hidden" name="counselingNum" id="counselingNum" value="${counselingNum}">
		<table border="1">
			<tr>
				<td colspan="2" align="center">
					연회 통합 예약
				</td>
			</tr>
			<tr>
				<td>
					예약 종류 선택
				</td>
				<td>
					<select name="reservationType" id="reservationType">
						<option value="1">연회, 대관</option>
						<option value="2">연회, 대관, 식음료</option>
						<option value="3">연회, 대관, 연회인력</option>
						<option value="4">연회, 대관, 식음료, 연회인력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>