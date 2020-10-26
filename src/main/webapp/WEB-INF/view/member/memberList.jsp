<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>
<table align="center" width=50% border="1" cellpadding="0" cellspacing="0" >
<tr align="center" valign="middle">
	<td colspan =4 >회원리스트</td>
	<td align=right >회원수 : ${count } </td>
</tr>
<tr align="center" valign="middle">
	<td align="center">회원아이디</td>
	<td align="center">회원이름</td>
	<td align="center">회원연락처</td>
	<td align="center">이메일</td>
	<td align="center">등록일</td>
</tr>
<c:forEach items="${memberList }" var="member" >
<tr align="center" valign="middle">
	<td align="center">
		<a href ="<c:url value='/edit/memberInfo?id=${member.memberId }' />">${member.memberId }</a>
	</td>
	<td align="center">${member.memberName }</td>
	<td align="center">${member.memberTel }</td>
	<td align="center">${member.memberEmail }</td>
	<td align="center">
		<fmt:formatDate value="${member.memberRegist }" type="date" pattern="yyyy-MM-dd"/> 
	</td>
</tr>
</c:forEach>
</table>
<div align="center"><a  href="<c:url value='/register/agree' />" >회원등록</a></div>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>