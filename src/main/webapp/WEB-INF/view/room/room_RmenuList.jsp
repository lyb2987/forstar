<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>
		<select id="menuName" name="menuName">
		<option value="">---메뉴---</option>
		<c:forEach items="${mmlist }" var="menu" >
		<option value="${menu.menuName}">${menu.menuName }</option>
		</c:forEach>
		</select>
</body>
</html>