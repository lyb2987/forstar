<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회장 예약 목록</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<table border="1">
		<c:if test="${count > 0 }">
			<tr align="center" valign="middle">
				<td colspan="5">
					문의 게시판
				</td>
				<td align=right>
					<font size=2>글 개수 : ${count }</font>
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<div align="center">
						연회장 예약 번호
					</div>
				</td>
				<td>
					<div align="center">
						연회 번호
					</div>
				</td>
				<td>
					<div align="center">
						대관 번호
					</div>
				</td>
				<td>
					<div align="center">
						고객 번호
					</div>
				</td>
				<td>
					<div align="center">
						예약 상태
					</div>
				</td>
				<td>
					<div align="center">
						예약 날짜
					</div>
				</td>
			</tr>
			
			<c:forEach items="${list}" var="bHReservation" varStatus="status">
				<tr align="center" valign="middle" >
					<td>
						<div align="left"> 
							<a href="TotalReservationDetail?bHReservationNum=${bHReservation.BHReservationNum}">
								${bHReservation.BHReservationNum}
							</a>
						</div>
					</td>
					<td>
						<div align="center">
							${bHReservation.banquetNum}
						</div>
					</td>
					<td>
						<div align="center">
							${bHReservation.rentNum}
						</div>
					</td>
					<td>
						<div align="center">
							${bHReservation.memberNum}
						</div>
					</td>
					<td>
						<div align="center">
							${bHReservation.reservationStatus}
						</div>
					</td>
					<td>
						<div align="center">
							<fmt:formatDate value="${bHReservation.reservationDate}" pattern="yyyy년 MM월 dd일 hh:mm:ss"/> 
						</div>
					</td>
				</tr>
			</c:forEach>
		
			<tr align=center height=20>
				<td colspan=6 style=font-family:Tahoma;font-size:10pt;>
					<%@ include file="../include/includePage.jsp" %>
				</td>
			</tr>
		</c:if>
		<c:if test="${ empty list }">
			<tr align="center" valign="middle">
				<td colspan="6">연회장 예약 목록</td>
			</tr>
			<tr align="center" valign="middle">
				 <td align=right>
					<font size=2>등록된 글이 없습니다.</font>
				</td>
			</tr>
		</c:if>
	</table>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>