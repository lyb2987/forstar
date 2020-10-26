<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 상담 목록 </title>
</head>
<body>

<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<table border="1">
	<c:if test="${count > 0 }">
		<tr align="center" valign="middle">
			<td colspan="8">
				상담 목록
			</td>
			<td align=right>
				<font size=2>글 개수 : ${count }</font>
			</td>
		</tr>
		
		<tr align="center" valign="middle" bordercolor="#333333">
			<td>
				<div align="center">
					상담 글 순서
				</div>
			</td>
			<td>
				<div align="center">
					상담 번호
				</div>
			</td>
			<td>
				<div align="center">
					상담 제목
				</div>
			</td>
			<td>
				<div align="center">
					상담 목적
				</div>
			</td>
			<td>
				<div align="center">
					상담 방식
				</div>
			</td>
			<td>
				<div align="center">
					상담 시간
				</div>
			</td>
			<td>
				<div align="center">
					상담 직원
				</div>
			</td>
			<td>
				<div align="center">
					상담자
				</div>
			</td>
			<td>
				<div align="center">
					상담 상태
				</div>
			</td>
		</tr>
		
		<c:forEach items="${list}" var="counseling" varStatus="status">
			<tr align="center" valign="middle" >
				<td height="23">
					${status.count }
				</td>
				<td>
					<div align="left">
						${counseling.counselingNum}
					</div>
				</td>
				<td>
					<div align="left"> 
						<a href="CounselingDetail?counselingNum=${counseling.counselingNum}">
							${counseling.counselingSubject}
						</a>
					</div>
				</td>
				<td>
					<div align="center">
						${counseling.counselingPurpose}
					</div>
				</td>
				<td>
					<div align="center">
						${counseling.counselingType}
					</div>
				</td>
				<td>
					<div align="center">
						<fmt:formatDate value="${counseling.counselingDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/> 
					</div>
				</td>	
				<td>
					<div align="center">
						${counseling.employeeNum}
					</div>
				</td>
				<td>
					<div align="center">
						${counseling.memberNum}
					</div>
				</td>
				<td>
					<div align="center">
						${counseling.counselingStatus }
					</div>
				</td>
			</tr>
		</c:forEach>
	
		<tr align=center height=20>
			<td colspan=9 style=font-family:Tahoma;font-size:10pt;>
				<%@ include file="../include/includePage.jsp" %>
			</td>
		</tr>
	</c:if>
	<c:if test="${ empty list }">
		<tr align="center" valign="middle">
			<td colspan="9">상담 목록</td>
		</tr>
		<tr align="center" valign="middle">
			 <td align=right>
				<font size=2>등록된 상담이 없습니다.</font>
			</td>
		</tr>
	</c:if>
</table>
<br />
</div>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>