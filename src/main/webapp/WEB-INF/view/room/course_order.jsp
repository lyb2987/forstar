﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
		xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
      	layout:decorator="layout/sub">
<head>
  	<title>User</title>
	<!-- 페이지 css -->
	<th:block layout:fragment="css">
		<style></style>
	</th:block>
	
	<!-- 페이지 js -->
	<th:block layout:fragment="js">
		<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		
		<script>
		$("#pay").click(function() {

			var IMP = window.IMP; // 생략가능
			IMP.init('imp41979243'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

			IMP.request_pay({
				pg: 'kakao', 
				pay_method: 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '데이트코스 상품',
				amount : '[[${sumTotalPrice}]]',
				buyer_email : '[[${memEmail}]]',
				buyer_name : '[[${memName}]]',
				buyer_tel : '[[${memTel}]]',
				buyer_addr : '[[${memAddr}]]',
				buyer_postcode : '123-456',
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					document.getElementById('payFrm').submit();

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
		
		</script>
	</th:block>
</head>

<body>
	<th:block layout:fragment="content" class="content">
   	<section id="page-title">

		<div class="container clearfix">
			<h1>CHECKOUT</h1>
		</div>

	</section>
	
	<section id="content">

		<div class="content-wrap">

			<div class="container clearfix">

				<div class="row clearfix">
					<div class="col-md-12">
						<h3 class="">배송 정보 입력</h3>

						<form id="payFrm" name="shipping-form" class="nobottommargin" th:action="@{/course/goods/orderOk}" method="post" th:object="${orderCommand}">


							<div class="col_full">
								<label for="shipping-form-companyname">주문자명</label>
								<input type="text" id="memId" th:value="${memId}" class="sm-form-control" />
							</div>

							<div class="clear"></div>

							<div class="col_full">
								<label for="shipping-form-companyname">업체</label>
								<input type="text" id="venId" name="venId" th:value="${venId}" class="sm-form-control" />
							</div>

							<div class="col_full">
								<label for="shipping-form-address">배송지 주소</label>
								<input type="text" id="orderAddr" name="orderAddr" class="sm-form-control" />
							</div>

							<div class="col_full">
								<label for="shipping-form-message">주문 시 전달사항 <small>*</small></label>
								<textarea class="sm-form-control" id="orderMsg" name="orderMsg" rows="6" cols="30"></textarea>
							</div>
							
                            <button type="button" id="pay" class="button button-3d fright">Place Order</button>
                           
						</form>
					</div>
					<div class="clear bottommargin"></div>
					<div class="col-md-6" >
						<div class="table-responsive clearfix">
							<h4>Your Orders</h4>

							<table class="table cart">
								<thead>
									<tr>
										<th class="cart-product-thumbnail">&nbsp;</th>
										<th class="cart-product-name t400">상품명</th>
										<th class="cart-product-quantity t400">수량</th>
										<th class="cart-product-subtotal t400">금액</th>
									</tr>
								</thead>
								<tbody>
									<tr class="cart_item" th:each="cartList : ${cartList}">
										<td class="cart-product-thumbnail">
											<a href="#"><img width="64" height="64" th:src="@{'/static/upload/course/'+${cartList.goodsImage}}" alt="goods image"></a>
										</td>

										<td class="cart-product-name">
											<a href="#" th:text="${cartList.goodsName}"></a>
										</td>

										<td class="cart-product-quantity">
											<div class="quantity clearfix" th:text="${cartList.cartQty}"></div>
										</td>

										<td class="cart-product-subtotal">
											<span id="price" class="amount" th:text="${cartList.cartPrice}"></span>
										</td>
									</tr>
									<!--
									<tr class="cart_item">
										<td class="cart-product-thumbnail">
											<a href="#"><img width="64" height="64" src="https://via.placeholder.com/270" alt="Checked Canvas Shoes"></a>
										</td>

										<td class="cart-product-name">
											<a href="#">Checked Canvas Shoes</a>
										</td>

										<td class="cart-product-quantity">
											<div class="quantity clearfix">
												2
											</div>
										</td>

										<td class="cart-product-subtotal">
											<span class="amount">$24.99</span>
										</td>
									</tr>
									<tr class="cart_item">
										<td class="cart-product-thumbnail">
											<a href="#"><img width="64" height="64" src="https://via.placeholder.com/270" alt="Pink Printed Dress"></a>
										</td>

										<td class="cart-product-name">
											<a href="#">Blue Men Tshirt</a>
										</td>

										<td class="cart-product-quantity">
											<div class="quantity clearfix">
												4
											</div>
										</td>

										<td class="cart-product-subtotal">
											<span class="amount">$41.97</span>
										</td>
									</tr> -->
									
								</tbody>

							</table>

						</div>
					</div>
					<div class="col-md-6">
						<div class="table-responsive">
							<h4>Cart Totals</h4>

							<table class="table cart">
								<tbody>
									<tr class="cart_item" >
										<td class="notopborder cart-product-name">
											<strong class="t400">총 금액</strong>
										</td>

										<td class="notopborder cart-product-name">
											<span class="amount" th:text="${sumTotalPrice}"></span>
										</td>
									</tr>
									<tr class="cart_item">
										<td class="cart-product-name">
											<strong class="t400">배송비</strong>
										</td>

										<td class="cart-product-name">
											<span class="amount">무료</span>
										</td>
									</tr>
									<tr class="cart_item">
										<td class="cart-product-name">
											<strong class="t400">결제 금액</strong>
										</td>

										<td class="cart-product-name">
											<strong><span class="amount color lead"  th:text="${sumTotalPrice}"></strong></span>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
						<!-- <div class="accordion clearfix">
							<div class="acctitle"><i class="acc-closed icon-ok-circle"></i><i class="acc-open icon-remove-circle"></i>가상 계좌 입금</div>
							<div class="acc_content clearfix">신한은행 120-3584-562336 (오후 3시 기준 입금 확인 처리)</div>

							<div class="acctitle"><i class="acc-closed icon-ok-circle"></i><i class="acc-open icon-remove-circle"></i>카드 결제</div>
							<div class="acc_content clearfix">
							<div class="col-md-10">

							<table class="card">
								<tbody>
									<tr class="card-info" >
										
									  <div class="form-group row">
	        					        <label for="cardNum" class="col-sm-3 col-form-label">
	        					         	카드번호 
	        					        </label>
	        					        <div class="col-sm-10">
	        						    <input type="text" name="cardNum" class="form-control" id="cardNum">
	        					       </div>
	        			          	  </div>
	        			          	 
									  <div class="form-group row">
	        					        <label for="cardLimit" class="col-sm-3 col-form-label">
	        					         	유효기간 
	        					        </label>
	        					        <div class="col-sm-10">
	        						    <input type="text" name="cardLimit" class="form-control" id="cardLimit">
	        					       </div>
	        			          	  </div>	        			          	 

									  <div class="form-group row">
	        					        <label for="cvc" class="col-sm-3 col-form-label">
	        					         	CVC 
	        					        </label>
	        					        <div class="col-sm-10">
	        						    <input type="text" name="cvc" class="form-control" id="cvc">
	        					       </div>
	        			          	  </div>		        			          	 
	        			          	 
									</tr>
								</tbody>
							</table>

						</div>
							</div>

						</div> -->
						
						<!-- <a th:href="orderOk" class="button button-3d fright">Place Order</a> -->
					</div>
				</div>
			</div>

		</div>

	</section>
    </th:block>
</body>
</html>
