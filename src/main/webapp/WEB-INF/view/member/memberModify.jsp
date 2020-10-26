<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>

</head>
<%@ include file="../Frame/Header.jsp" %>
<body>
<form:form name ="frm" id ="frm" method = "post" action ="memberModifyPro"
	commandName="memberCommand">
	<form:hidden path="memberId"/>
	<form:hidden path="memberNum"/>
	<form:hidden path="memberPoint"/>
	<input type="hidden" name="memberBirth" 
	    value ="<fmt:formatDate 
	              value='${memberCommand.memberBirth}' 
		          type='date' pattern='yyyy-MM-dd' />" />

<table border = 1  width = 600 align = "center" cellpadding = 3 >
	<tr><td colspan=2> 회원정보 수정 </td></tr>
	<tr><td >아이디와 비번</td>
		<td >&nbsp;</td></tr>
	<tr><td>사용자 ID</td><td>${memberCommand.memberId }</td></tr>
	<tr><td>비밀번호</td>
		<td><form:password id="pw" path ="memberPw" />
		<form:errors path="memberPw"/>
		  <div></div>
		  </td>
	</tr>
	<tr><td >기본정보 입력</td>
		<td >&nbsp;</td></tr>
	<tr><td>사용자 이름</td>
		<td>${memberCommand.memberName }</td>
	</tr>
	<form:hidden path="memberBirth"/>
	<form:hidden path="memberGender"/>
	<tr><td> 생년월일 및 성별</td>
		<td><fmt:formatDate 
	              value='${memberCommand.memberBirth}' 
		          type='date' pattern='yyyy-MM-dd' />
		           / ${memberCommand.memberGender}</td>
	</tr>
	<tr><td>사용자 이메일</td>
	    <td><form:input id ="email" path ="memberEmail" />
	    <form:errors path="memberEmail"/></td></tr>
	<tr><td>사용자 주소</td>
	    <td>
	    <form:input id ="addr" path ="memberAddr" />
	    <form:errors path="memberAddr"/>
	    </td>
	</tr>
	<tr><td>전화번호</td>
	    <td>
	    <form:input id ="memberTel" path ="memberTel" />
	    <form:errors path="memberTel"/>
	    </td>
	</tr>
	<tr>
		<td colspan=2>
		<input type="submit" name="modify" id ="modify" 
				value="수   정" >
		<input type="button" value="취  소" 
			onclick = "javascript:history.back();" />
		<!-- onclick = "javascript:location.href='main.jsp';" -->
		</td>
	</tr>
</table>

</form:form>
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>