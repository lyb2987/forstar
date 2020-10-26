<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<%@ include file="../Frame/Header.jsp" %>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	$("#modify").click(function(){
		location.href="/edit/memberModify?id=${memberCommand.memberId }";
	});
	$("#memDel").click(function(){
		location.href="/edit/memberInfoDel?id=${memberCommand.memberId }"
	});
});
</script>
</head>
<body>

<table align="center">
<tr><td>이름 : ${memberCommand.memberName }<br /></td></tr>
<tr><td>아이디 : ${memberCommand.memberId }<br /></td></tr>
<tr><td>이메일  : ${memberCommand.memberEmail }<br /></td></tr>
<tr><td>생년월일  : <fmt:formatDate value="${memberCommand.memberBirth }" type="date" pattern="yyyy-MM-dd"/> <br /></tr>
<tr><td>성별 : <c:if test="${memberCommand.memberGender == 'M'}">
		남자
	  </c:if>
	  <c:if test="${memberCommand.memberGender == 'F'}">
		여자
	  </c:if>
	 <br /> </td></tr>
<tr><td>전화번호 : ${memberCommand.memberTel }<br /></td></tr>
<tr><td>등록일 : ${memberCommand.memberRegist }<br /></td></tr>
<tr><td>주소  : ${memberCommand.memberAddr }<br /></td></tr>
<tr><td>적립  : ${memberCommand.memberPoint }<br /></td></tr>
<tr><td><input type="button" name="modify" id ="modify" value="수   정" > &nbsp;
<input type="button" value="취  소" 
				onclick = "javascript:history.back();" />&nbsp;
<input type="button" value="회원삭제" id ="memDel"/></td></tr>
</table>

<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>