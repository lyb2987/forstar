<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 후기 작성</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form action="BHReviewInsert" method="post" id="frm" name="frm">
		<input type="hidden" id="bHReservationNum" name="bHReservationNum" value="${bHReservationNum}">
		<input type="hidden" id="memberNum" name="memberNum" value="${memberNum}">
		<table border="1">
			<tr>
				<td colspan="2">
					연회장 후기
				</td>
			</tr>
			<tr>
				<td>
					후기 제목
				</td>
				<td>
					<input id="bHReviewSubject" name="bHReviewSubject">
				</td>
			</tr>
			<tr>
				<td>
					이용 만족도
				</td>
				<td>
					<select id="bHReviewSatisfaction" name="bHReviewSatisfaction">
						<option value="0">0점</option>
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
						<option value="6">6점</option>
						<option value="7">7점</option>
						<option value="8">8점</option>
						<option value="9">9점</option>
						<option value="10">10점</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					내 용
				</td>
				<td>
					<textarea id="bHReviewContent" name="bHReviewContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					개선 요청 사항
				</td>
				<td>
					<textarea id="bHReviewImprovement" name="bHReviewImprovement"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>