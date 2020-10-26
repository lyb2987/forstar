<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 Home</title>
<link rel="stylesheet" type="text/css" href="../css/Admin.css" />
</head>
<body>
	<%@ include file="../Frame/Header.jsp"%>

	<div class="container">
		<div class="adminCtn">
			<div class="adminBox contents" id="contents">
				<div class="location rgt">
					<p class="list">
						<span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>마이
							페이지</strong>
					</p>
				</div>

				<div class="adminContent">
					<script type="text/javascript"
						src="http://code.jquery.com/jquery-latest.js"></script>
					<script type="text/javascript">
						$(function() {
							$("#modify")
									.click(
											function() {
												location.href = "/edit/memberModify?id=${memberCommand.memberId }"
											});
							$("#memDel")
									.click(
											function() {
												location.href = "/edit/memberInfoDel?id=${memberCommand.memberId }"
											});

						});
						function btnclick(num) {
							if (confirm("환불요청하시겠습니까? 자세한 환불금액은 환불규정을 참고해주세요.")) {
								location.href = num;

							}
						}
						function btnSubmitclick(num) {
							var test = confirm("취소승인을 하시겠습니까?");
							if (test == true) {
								location.href = num;

							}

						}
					</script>


					<div class="root">
						<div id="wrapper">
							<div class="page_body">

								<main class="page_main">
									<div class="sc">
										<div class="mypage" style="ppadding-top: 24px;">
											<div class="mypage_rowcontainer"
												style="border-bottom: 1px align black;">
												<span>마이 페이지</span>
											</div>
											<hr />
											<div style="height: auto" class="mypage_container">

												<div class="myinpo" style="">
													<h3 style="align-items: center;">내정보</h3>
													<hr style="border: 2px dotted grey" />
													<div style="">
														<table border="1px" align="center"
															cellpadding=3border-right:1pxalignblack;>
															<tr>
																<td><span id="font1">이메일</span></td>
																<td><span id="font1">${memberCommand.memberEmail }</span></td>
															</tr>
															<tr>
																<td><span id="font1">사용자 이름</td>
																<td><span id="font1">
																		${memberCommand.memberName } </span></td>
															<tr>
																<td colspan="2"><span id="font1">기본정보 </span></td>
															</tr>
															</tr>

															<tr>
																<td><span id="font1">사용자 주소</span></td>

																<td><span id="font1">
																		${memberCommand.memberAddr } </span></td>
																</span>
															</tr>
															<tr>
																<td><span id="font1">전화번호</span></td>
																<td><span id="font1">
																		${memberCommand.memberTel } </span> </span>
															</tr>

															<td colspan=2 align="center"><input type="button"
																name="modify" id="modify" value="수   정"> <input
																type="button" value="탈퇴" id="memDel" /></td>


														</table>
													</div>
												</div>

												<div class="myinpo" style="">
													<h3 style="align-items: center;">객실 예약정보</h3>
													<hr style="border: 2px dotted grey" />
													<c:if test="${!empty mrlist}">
														<div style="">
															<table style="text-align: right" border="1px"
																align="center" cellpadding=3border-right:1pxalignblack;>
																<tr>
																	<td><span>객실예약번호</span></td>
																	<td><span>객실번호</span></td>
																	<td><span>예약날짜</span></td>
																	<td><span>총예약금</span></td>
																	<td><span>대여시작날짜</span></td>
																	<td><span>대여끝날짜</span></td>
																	<td><span>결제상태</span></td>
																</tr>
																<c:forEach items="${mrlist }" var="dto">
																	<tr>
																		<td>${dto.roomReserNum }</td>
																		<td>${dto.roomNum }호</td>
																		<td><fmt:formatDate value="${dto.reserDate }"
																				type="date" pattern="yyyy-MM-dd" /></td>
																		<td><fmt:formatNumber value="${dto.reserCharge}"
																				type="currency"></fmt:formatNumber></td>

																		<td><fmt:formatDate value="${dto.reserStart }"
																				type="date" pattern="yyyy-MM-dd" /></td>
																		<td><fmt:formatDate value="${dto.reserEnd }"
																				type="date" pattern="yyyy-MM-dd" /></td>
																		<td>${dto.reserStatus }</td>
																	</tr>


																</c:forEach>

															</table>

														</div>
													</c:if>
													<c:if test="${empty mrlist}">

														<table align="center">
															<tr>
																<td>예약 정보가 없습니다.</td>
															</tr>
														</table>
													</c:if>
												</div>

												<div class="myinpo" style="">
													<h3 style="align-items: center;">다이닝 예약정보</h3>
													<hr style="border: 2px dotted grey" />
												<c:if test="${!empty test}">
													<div style="">
														<table style="text-align: right" border="1px"
															align="center" cellpadding=3border-right:1pxalignblack;>
														</table>
													</div>
													</c:if>
													<c:if test="${empty test}">

														<table align="center">
															<tr>
																<td>예약 정보가 없습니다.</td>
															</tr>
														</table>
													</c:if>
												</div>

												<div class="myinpo" style="">
													<h3 style="align-items: center;">라이프 스타일 예약정보</h3>
													<hr style="border: 2px dotted grey" />
													<c:if test="${!empty test}">
													<div style="">
														<table style="text-align: right" border="1px"
															align="center" cellpadding=3border-right:1pxalignblack;>
														</table>
													</div>
													</c:if>
													<c:if test="${empty test}">

														<table align="center">
															<tr>
																<td>예약 정보가 없습니다.</td>
															</tr>
														</table>
													</c:if>
												</div>
												<div class="myinpo" style="">
													<h3 style="align-items: center;">웨딩&연회 예약정보</h3>
													<hr style="border: 2px dotted grey" />
													<c:if test="${!empty test}">
													<div style="">
														<table style="text-align: right" border="1px"
															align="center" cellpadding=3border-right:1pxalignblack;>
														</table>
													</div>
													</c:if>
													<c:if test="${empty test}">

														<table align="center">
															<tr>
																<td>예약 정보가 없습니다.</td>
															</tr>
														</table>
													</c:if>
											</div>

</div></div></div></main></div></div></div></div>

					



	<%@ include file="../Frame/Footer.jsp"%>
</body>
</html>