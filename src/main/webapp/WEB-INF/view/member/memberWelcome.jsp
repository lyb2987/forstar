<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/Regist.css" />
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div class="container">
	<div class="ctnJoin ctnJoinStep1">
		<div class="agreeBox contents" id="contents">
			<div class="location rgt">
				<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>회원가입 완료</strong></p>
			</div>
			<div class="headTit2">
				<h4 class="tit">회원가입 완료</h4>
			</div>
			<div class="top3">
				<h1 class="logo">
					<span>
					</span>
				</h1>
				<div class="info">
				</div>
			</div>
		</div>
		<div class="content" align="center">
			<spring:message code="register.done" 
			 arguments="${memberCommand.memberName },${memberCommand.memberEmail }" />
			<br />
			<br />
			
			<a class="buttonstyleA" style="color:#fff; text-decoration: none" href="/main">메인으로</a>
		</div>
	</div>
</div>

	
	
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>