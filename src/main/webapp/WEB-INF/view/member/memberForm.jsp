<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력</title>
<link rel="stylesheet" type="text/css" href="../css/Regist.css" />
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	if("${err}" == "1"){
		alert("입력이 되지 않았습니다.");
	}
});
</script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div class="container">
	<div class="ctnJoin ctnJoinStep1">
		<div class="agreeBox contents" id="contents">
			<div class="location rgt">
				<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>회원가입</strong></p>
			</div>
			<div class="headTit">
				<h4 class="tit">회원가입</h4>
			</div>
			<div class="top2">
				<h1 class="logo">
					<span>
					</span>
				</h1>
				<div class="info">
				</div>
			</div>
			<div class="hTit hTit2">
				<h4 class="tit">회원 정보 입력</h4>
			</div>	
		</div>
		<div class="joinFormDiv">
			<form:form action="memberJoinAction" name = "frm" id="frm" method = "post" commandName="memberCommand">
			 ${employeeNumError}
			 <table border = 1  class="joinTable">
			 	<tr>
			 		<th width="600" colspan="2" class="th2">회원 구분</th>
			 	</tr>
			 	<tr>
			 		<th width="100">구분</th>
			 		<td width="500" class="memberSortationTD">
			 			<input type="radio" class="Sortation" name="Sortation" id="Sortation" value="mem" checked="checked" > 회원
					 	&nbsp;&nbsp;
					 	<input type="radio" class="Sortation" name="Sortation" id="Sortation" value="emp"> 직원
			 		</td>
			 	</tr>
			 	<tr class="empNum">
			 		<th width="100">사원 번호</th>
			 		<td width="500">
			 			<form:input path="employeeNum" value=""/>
			 		</td>
			 	</tr>
				<tr>
			 		<th width="600" colspan="2" class="th2">회원 정보</th>
			 	</tr>
			 	<tr>
			 		<th width = "100">사용자 ID</th>
			 		<td width = "500">
			 			<form:input path="memberId" 
			 			size = "12" maxlength="10" id="memberId" />
			 			<form:errors path="memberId"/>
			 		</td>
			 	</tr>
			 	<tr>
			 		<th  width = "100">비밀번호</th>
			 		<td  width = "500">
			 			<form:password path="memberPw" id = "memberPw"
			 			size = "12" maxlength="10" />
			 			<form:errors path="memberPw"/>
			 		</td>
			 	</tr>
			 	<tr>
			 		<th  width = "100">비밀번호 확인</th>
			 		<td  width = "500">
			 			<form:password path="memberPwCon" 
			 			 id = "memberPwCon" size = "12" maxlength="10" />
			 			<form:errors path="memberPwCon"/>
			 		</td>
			 	</tr>
			 	<tr>
			 		<th  width = "100">사용자 이름</th>
			 		<td  width = "500">
			 			<form:input  path="memberName" 
			 			 id = "memberName" size = "12" maxlength="10" />
			 			<form:errors path="memberName" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<th  width = "100">생년원일</th>
			 		<td  width = "500">
			 			<input type="date"  name="memberBirth" 
			 			 id = "memberBirth" size = "12" maxlength="10" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<th  width = "100">성별</th>
			 		<td  width = "500">
			 			<form:radiobutton value="M" path="memberGender" id  = "memberGender" checked="checked" /> 남자
			 			&nbsp;&nbsp;
			 			<form:radiobutton value="F" path="memberGender" id  = "memberGender" /> 여자
			 		</td>
			 	</tr>
			 	<tr><th width ="100">사용자 주소 </th>
					<td width ="500">
						<form:input path="memberAddr" 
							id = "memberAddr" size = "30" maxlength="28"/>
						<form:errors path="memberAddr"/>
					</td>
				</tr>
				<tr><th width ="100">사용자 전화번호</th>
					<td width ="500">
						<form:input path="memberTel" 
							id = "memberTel" size = "30" maxlength="28"/>
						<form:errors path="memberTel"/>
					</td>
				</tr>
			 	<tr><th width ="100">사용자 이메일 </th>
					<td width ="500">
						<form:input  path="memberEmail" 
							id = "memberEmail" size = "30" maxlength="28"/>
						<form:errors path="memberEmail"/>
					</td>
				</tr>
				
				<tr>
					<td colspan = 2 >
						<div class="joinBtnDiv" align="center">
							<a class="buttonstyleA" style="color:#fff; text-decoration: none" onclick="javascript:frm.submit();">가입 신청</a>
							&nbsp; &nbsp;
							<a class="buttonstyleA" style="color:#fff; text-decoration: none" onclick="javascript:frm.reset();">다시 입력</a>
							&nbsp; &nbsp;
							<a class="buttonstyleA" style="color:#fff; text-decoration: none" href="/main">가입 취소</a>
			 			</div>
			 		</td>
				</tr>
			 </table>
			</form:form>
		</div>
	</div>
</div>

<%@ include file="../Frame/Footer.jsp" %>

<script type="text/javascript">
	
	var checkSortation = ""; 
	
	$(function(){
		$("input[name='Sortation']").change(function(){
			checkSortation = $("input[name='Sortation']:checked").val();
			if(checkSortation == "emp"){
				$('.empNum').show();
			}
			else if(checkSortation == "mem"){
				$('.empNum').hide();
				$("#employeeNum").val("");
			}
		})
		
		
	});
	
</script>

</body>
</html>