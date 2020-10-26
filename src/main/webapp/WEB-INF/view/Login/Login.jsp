<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For Star 로그인</title>
<link rel="stylesheet" type="text/css" href="../css/Login.css" />
</head>
<body class="subBody joinBody">
<%@ include file="../Frame/Header.jsp" %>
<div class="container">
	<div class="loginBox contents" id="contents">
		
		<div class="location rgt">
			<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>로그인</strong></p>
		</div>
		<div class="headTit">
			<h4 class="tit">로그인</h4>
		</div>

		<div class="top">
			<h1 class="logo">
				<span>
					<p>
						호텔 ForStar 홈페이지를 방문해 주셔서 감사합니다.
						<br>
						회원 가입시 입력하신 아이디와 비밀번호를 입력해 주시기  바랍니다.
					</p>
					<p>
						※ 호텔 ForStar의 회원이 되시면 다양한 신라호텔의 정보 및  서비스 혜택을 받으실 수 있습니다.
					</p>
				</span>
			</h1>
			<div class="info">
				<p>
					호텔 ForStar 홈페이지를 방문해 주셔서 감사합니다.
					<br>
					회원 가입시 입력하신 아이디와 비밀번호를 입력해 주시기  바랍니다.
				</p>
				<p>
					※ 호텔 ForStar의 회원이 되시면 다양한 신라호텔의 정보 및  서비스 혜택을 받으실 수 있습니다.
				</p>
			</div>
		</div>
		
		<div class="loginErrorDiv">
			${loginError}
		</div>
		
		
		<!--  start -->
		<form:form id="loginForm" action="loginSubmit" name="frm" method="post" commandName="loginCommand">	
		<ul class="tabForm">
			<div class="rBtn">
				<div class="radio" id="uniform-rMember">
					<span class="checked">
						<input type="radio" class="rMember uiform radio" id=sortation name="sortation" value="mem" autocomplete="off" checked="checked">
					</span>
				</div>
				<label class="rMember" for="rMember">회원</label> 
					<div class="radio" id="uniform-rMemberNone">
						<span>
							<input type="radio" class="rMemberNone uiform radio" id="sortation" name="sortation" value="emp" autocomplete="off">
						</span>
					</div>
				<label class="rMemberNone" for="rMemberNone">직원</label>
			</div>
			<li class="ctn ctnOn" id="rMem">
				<div class="allBox">
					<div class="box">
						<div class="formBox">
							<div class="cBox">
								<fieldset class="loginSet">
										<div class="inputForm">
											<div class="inputId">
												<label for="id">신라리워즈 번호 또는 아이디</label>
												<form:input type="text" class="id input uiform text" path="id1" id="id1" name="id1"  autocomplete="off" placeholder=" 아이디" />
											</div>
											<div class="inputPw">
												<label for="pw">비밀번호</label>
												<form:password class="pw input uiform password" path="pw" id="pw" name="pw"  maxlength="20" autocomplete="off" placeholder=" 비밀번호"/>
											</div>
										</div>
										<div class="checker" id="uniform-rememberId">
											<span>
												<form:checkbox path="idStore" class="idSave uiform checkbox" id="idStore" name="idStore" value="" autocomplete="off" />
											</span>
										</div>
										<label class="idSave" for="idSave"> 아이디 저장</label>
										<div class="loginBtn">
											<a href="javascript:frm.submit();" title="Login">
												<img src="../images/Login/loginBtnLogin.gif" alt="로그인" class="btnLogin">
											</a>
										</div>
										<input type="hidden" name="nextURL" id="nextURL" autocomplete="off" value="">
								</fieldset>
								<div class="btn">
									<a class="btnJoin" href="../register/agree"><span>회원 가입</span></a>
									<a href="" id="popForIdButton" class="btnLostId"><span>아이디 찾기</span></a>
									<a href="" id="popForPwButton" class="btnLostPw"><span>비밀번호 찾기</span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="loginT">
						<p>이메일, 연락처 등의 정보가 변경되면 웹사이트에서 회원정보를 수정해주시기 바랍니다.</p>
					</div>
				</div>
			</li>
		</ul>
		</form:form>
	</div>
</div>
	
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>