<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회장 예약 조회</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<c:if test="${dto ne null}">
		<table border="1">
			<tr>
				<td colspan="2">
					연회장 및 연회 예약 정보
				</td>
			</tr>
			<tr>
				<td>
					연회장 예약 번호
				</td>
				<td>
					${dto.BHReservationNum}
				</td>
			</tr>
			<tr>
				<td>
					회원 번호
				</td>
				<td>
					${dto.memberNum}
				</td>
			</tr>
			
			<tr>
				<td>
					연회 번호
				</td>
				<td>
					${dto.banquet.banquetNum}
				</td>
			</tr>
			<tr>
				<td>
					연회 종류
				</td>
				<td>
					${dto.banquet.banquetType}
				</td>
			</tr>
			<tr>
				<td>
					연회 목적
				</td>
				<td>
					${dto.banquet.banquetPurpose}
				</td>
			</tr>
			<tr>
				<td>
					연회 요청 내용
				</td>
				<td>
					${dto.banquet.banquetRequest}
				</td>
			</tr>
			<tr>
				<td>
					대관 번호
				</td>
				<td>
					${dto.rent.rentNum}
				</td>
			</tr>
			<tr>
				<td>
					대관 연회장
				</td>
				<td>
					${dto.rent.rentBanquetHall}
				</td>
			</tr>
			<tr>
				<td>
					대관 시작 날짜 및 시간
				</td>
				<td>
					${dto.rent.rentDate}
				</td>
			</tr>
			<tr>
				<td>
					대관 종료 시간
				</td>
				<td>
					${dto.rent.rentTime}
				</td>
			</tr>
			<tr>
				<td>
					예약 날짜
				</td>
				<td>
					${dto.reservationDate}
				</td>
			</tr>
			<tr>
				<td>
					예약 상태
				</td>
				<td>
					${dto.reservationStatus}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					요청 식음료
				</td>
			</tr>
			<c:if test="${!empty dto.fab.fabNum}">
				<tr>
					<td>
						식음료 요청 번호
					</td>
					<td>
						${dto.fab.fabNum}
					</td>
				</tr>
				<tr>
					<td>
						메뉴 이름
					</td>
					<td>
						${dto.fab.menuName}
					</td>
				</tr>
				<tr>
					<td>
						레스토랑 이름
					</td>
					<td>
						<c:if test="${dto.fab.restaurantNum eq 1}">
							양식
						</c:if>
						<c:if test="${dto.fab.restaurantNum eq 2}">
							한식
						</c:if>
						<c:if test="${dto.fab.restaurantNum eq 3}">
							중식
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						식음료 요청 시간
					</td>
					<td>
						${dto.fab.fabDate}
					</td>
				</tr>
				<tr>
					<td>
						식음료 요청 인원수
					</td>
					<td>
						${dto.fab.fabNoP}
					</td>
				</tr>
			</c:if>
			
			<c:if test="${empty dto.fab.fabNum}">
				<tr>
					<td colspan="2" align="center">
						요청한 식음료가 없습니다.
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2">
					요청 연회 인력
				</td>
			</tr>
			<c:if test="${!empty dto.BERequestDetail[0].BERequestNum}">
				<tr>
					<td>
						연회 인력 요청 시간
					</td>
					<td>
						${dto.BERequestDetail[0].BERequestDate} ~ ${dto.BERequestDetail[0].BERequestTime}
					</td>
				</tr>
				<tr>
					<td>
						요청 연회 인력
					</td>
					<td>
						<c:forEach items="${dto.BERequestDetail}" var="bed" varStatus="i">
							연회인력 요청 번호 : ${bed.BERequestNum}, 연회 인력 : ${bed.employee.employeeName}, 연회 인력 직무 : ${bed.be.BEDuties}
							<br />
						</c:forEach>
					</td>
				</tr>
			</c:if>
			<c:if test="${empty dto.BERequestDetail[0].BERequestNum}">
				<tr>
					<td colspan="2" align="center">
						요청한 연회인력이 없습니다.
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2">
					총 예약금
				</td>
			</tr>
			<tr>
				<td>
					예약금 
					[연회, 대관, 식음료, 연회인력 비용이 모두 포함되어 있습니다.]
				</td>
				<td>
					${dto.reservationCharge}
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="../TotalPayment/TotalPaymentCreate?bHReservationNum=${dto.BHReservationNum}&bHReservationCharge=${dto.reservationCharge}"> 결제 </a>
					&nbsp;&nbsp;
					<a href="../BHReservation/BHReservationModifyChoose?bHReservationNum=${dto.BHReservationNum}" onclick=""> 예약 수정 </a>
					&nbsp;&nbsp;
					<a href="../BHReview/BHReviewForm?bHReservationNum=${dto.BHReservationNum}&memberNum=${dto.memberNum}" onclick=""> 후기 </a>
					&nbsp;&nbsp;
					<a href="../BHReservation/BHReservationDelete"> 예약 취소 </a>
				</td>
			</tr>
		</table>
	</c:if>
	<script type="text/javascript">
		$(function(){
			console.log("ready");
			//var objectDTO = ${dto};
		});
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>
	
</body>
</html>