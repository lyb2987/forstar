<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연회 인력 등록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%@ include file="../Frame/Header.jsp" %>

<div align="center">
	<form:form action="BEInsert" commandName="bECommand" id="frm" name="frm">
		<c:forEach items="${list}" var="ep" varStatus="i">
			<form:checkbox path="bENum" class="bENum" id="bENum${i.count}" name="bENum${i.count}" value="${ep.employeeNum}" /> 
			<label for="bENum${i.count}"> 
				이름 :  ${ep.employeeName}
					&nbsp;사원 번호 : ${ep.employeeNum}
				<c:if test="${ep.departmentNum eq 1}">
					&nbsp;부서 : 마스터
				</c:if>
				<c:if test="${ep.positionNum eq 1}">
					&nbsp;직급 : 마스터
				</c:if>
				<br />
			</label>
		</c:forEach>
		직무 : 
		<form:select path="bEDuties">
			<form:option value="">직무를 선택해주세요.</form:option>
			<form:option value="진행">진행</form:option>
			<form:option value="보조">보조</form:option>
			<form:option value="뷰티_메이크업">뷰티_메이크업</form:option>
			<form:option value="뷰티_의상">뷰티_의상</form:option>
		</form:select>
		<br />
		연회인력 이용료 : <form:input path="bECharge"/>
		
		<input type="submit" value="확인">
	</form:form>
	<script type="text/javascript">
		$(function(){
			var check = $("input:checkbox[class=bENum]").length;
			var cheked = $("input:checkbox[class=bENum]:checked").length;
			
			$(".bENum").change(function(){
				cheked = $("input:checkbox[class=bENum]:checked").length;
				if(cheked >= 2){
					alert("한명 이상 선택 불가능합니다!\n다시 선택해주세요");
					$(".bENum").prop("checked", false);
				}
			});
		});
	</script>
</div>

<%@ include file="../Frame/Footer.jsp" %>

</body>
</html>