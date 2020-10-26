<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<table border="1" align="center" width="80%" cellpadding="0" cellspacing="0">
	<tr >
		<td colspan="4">예약 가능 객실정보</td>
	</tr>
	<tr><td>객실 번호</td><td>등급번호</td><td>객실 이미지</td><td>객실설명</td></tr>
	<c:forEach var="room" items="${rclist }" varStatus="status">
	<tr align="center">
		<td>${room.roomNum }호</td>
		<td>${room.ratingNum }</td>
		<td>
		<c:forTokens items="${room.roomPic }" delims="`" var="roomPic" 
															varStatus="status">
			<c:if test="${status.count == 1}">
			<img src="../room_admin/upload/${roomPic }" width="50" height="50">
			</c:if>
		</c:forTokens>
		</td>
		<td>${room.roomContent  }</td>
		<tr>
 	
 		<td>총예약금</td>
 		<td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${room.roomPay  }" />원
 			<input type="hidden" name="reserCharge" id = "reserCharge" value="${room.roomPay  }"/></td>
 		
 	</tr>
	
	
	</c:forEach>	
</table>
