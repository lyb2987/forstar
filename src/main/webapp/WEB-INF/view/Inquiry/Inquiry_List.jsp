<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 문의 목록 </title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<table border="1">
		<c:if test="${count > 0 }">
			<tr align="center" valign="middle">
				<td colspan="4">
					문의 게시판
				</td>
				<td align=right>
					<font size=2>글 개수 : ${count }</font>
				</td>
			</tr>
			
			<tr align="center" valign="middle" bordercolor="#333333">
				<td width="8%" height="26">
					<div align="center">
						문의 번호
					</div>
				</td>
				<td width="50%">
					<div align="center">
						문의 제목
					</div>
				</td>
				<td  width="14%">
					<div align="center">
						문의자
					</div>
				</td>
				<td width="14%">
					<div align="center">
						문의 시간
					</div>
				</td>
				<td width="17%">
					<div align="center">
						문의 상태
					</div>
				</td>
			</tr>
			
			<c:forEach items="${list}" var="inquiry" varStatus="status">
				<tr align="center" valign="middle" >
					<td height="23">
						${status.count }
					</td>
					<td>
						<div align="left"> 
							<a href="InquiryDetail?inquiryNum=${inquiry.inquiryNum }">
								${inquiry.inquirySubject }
							</a>
						</div>
					</td>
					<td>
						<div align="center">
							${inquiry.memberNum }
						</div>
					</td>
					<td>
						<div align="center">
							<fmt:formatDate value="${inquiry.inquiryDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/> 
						</div>
					</td>	
					<td>
						<div align="center">
							${inquiry.inquiryStatus }
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
				<td colspan="5">문의 게시판</td>
			</tr>
			<tr align="center" valign="middle">
				 <td align=right>
					<font size=2>등록된 글이 없습니다.</font>
				</td>
			</tr>
		</c:if>
	</table>
	<br />
	<a href="InquiryForm"> 문의 작성</a>
</div>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>