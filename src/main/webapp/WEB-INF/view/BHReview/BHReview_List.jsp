<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<table border="1">
		<c:if test="${count > 0 }">
			<tr align="center" valign="middle">
				<td colspan="4">
					후기 게시판
				</td>
				<td align=right>
					<font size=2>글 개수 : ${count }</font>
				</td>
			</tr>
			
			<tr align="center" valign="middle" bordercolor="#333333">
				<td>
					<div align="center">
						후기 번호
					</div>
				</td>
				<td>
					<div align="center">
						후기 제목
					</div>
				</td>
				<td>
					<div align="center">
						후기 작성자
					</div>
				</td>
				<td>
					<div align="center">
						연회장 예약 번호
					</div>
				</td>
				<td>
					<div align="center">
						후기 작성일
					</div>
				</td>
			</tr>
			<c:forEach items="${list}" var="bHReview" varStatus="status">
				<tr align="center" valign="middle" >
				<td>
						<div align="left"> 
							${bHReview.BHReviewNum}
						</div>
					</td>
					<td>
						<div align="center"> 
							<a href="BHReviewDetail?bHReviewNum=${bHReview.BHReviewNum }">
								${bHReview.BHReviewSubject }
							</a>
						</div>
					</td>
					<td>
						<div align="center">
							${bHReview.memberNum }
						</div>
					</td>
					<td>
						<div align="center">
							${bHReview.BHReservationNum}
						</div>
					</td>
					<td>
						<div align="center">
							<fmt:formatDate value="${bHReview.BHReviewRegister}" pattern="yyyy년 MM월 dd일 hh:mm:ss"/> 
						</div>
					</td>
				</tr>
			</c:forEach>
			<tr align=center height=20>
				<td colspan=5 style=font-family:Tahoma;font-size:10pt;>
					<%@ include file="../include/includePage.jsp" %>
				</td>
			</tr>
		</c:if>
		<c:if test="${ empty list }">
			<tr align="center" valign="middle">
				<td colspan="5">후기 게시판</td>
			</tr>
			<tr align="center" valign="middle">
				 <td align=right>
					<font size=2>등록된 글이 없습니다.</font>
				</td>
			</tr>
		</c:if>
	</table>
	<script type="text/javascript">
		var test = ${list}
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>