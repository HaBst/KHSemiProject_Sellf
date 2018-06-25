<%@page import="product.model.vo.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- jQuery 링크걸기 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>

<!-- ajax 링크걸기  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="../../CSS/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../../CSS/member/myCart.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/footer.css">
<!-- 내부 js파일 -->
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/member/myCart.js?ver=1"></script>
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<script type="text/javascript" src="../../JS/bootstrap/bootstrap.min.js"></script>
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">

<title>장바구니 (step1)</title>
</head>

<body>

	<center>


		<div id="wrapper" style="overflow: hidden;">

			<header id="header"> <%@include
				file="/views/common/header.jsp"%> </header>
			<br>
			<div id="content">
				<div id="titleSec">
					<div id="title">
						<h1>장바구니</h1>
					</div>
					<div id="explan"></div>
				</div>
				<div id="orderStepSec">
					<div class="sign-up">
						<ul>
							<li class="active">
								<h3>
									STEP1 <small> 장바구니</small>
								</h3>
							</li>
							<li>
								<h3>
									STEP2 <small>주문/결제</small>
								</h3>
							</li>
							<li>
								<h3>
									STEP3 <small>결제완료</small>
								</h3>
							</li>
						</ul>
					</div>
				</div>
				<!-- orderStepSec끝 -->

				<div id="cartListSec">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
								<th scope="col">상품금액</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("myCartList");
							%>

							<!-- 장바구니 db에 담겨져있는 갯수만큼 출력하기 -->
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="cartlistTr">
								<td scope="row"><input type="checkbox" name="chk" value =<%=list.get(i).getProduct_entire_pk()%>></td>
								<td id="productName"><%=list.get(i).getProduct_name()%></td>
								<td id="productAmount"><%=list.get(i).getProduct_amount()%>개</td>
								<td id="productPrice"><%=list.get(i).getProduct_price()%>원</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>

					<!-- 체크박스 선택여부 검증 -->
					<script>
						function myCartListPurchase() {
							var val;
							var item = [];
							var checkLength = $("input:checkbox[name=chk]:checked").length;
							console.log(checkLength);
							// 여기가 myCart1
							if(checkLength==1){
								$("input:checkbox[name=chk]:checked").each(function(){
									val = $(this).val();			
									item.push(val);	
									console.log("value값:"+val);
								location.href ="/myCart2?productIndex="+item;
								//return true;
								});
							}else if(checkLength>1){
								alert("주문하실 상품을 1개만 선택해주세요");
								//return false;
							}else if(checkLength==0){
								alert("주문하실 상품을 선택해주세요");
								//return false;
							}
						}
							
						function deleteOneBtn() {
							if ($("input[name=chk]").prop("checked")) {
								$("#cartlistTr").remove();
								console.log($('tbody>tr').length);
							}
							if ($('tbody>tr').length <= 0) {
								$('#dontHaveGoodsList').text("장바구니에 담긴 상품이 없습니다.");
							}
						}

					</script>

					<div id="dontHaveGoodsList"></div>
					<hr>
					<div class="selectBtn1">
						<button type="button" class="btn btn-info" style="float: left; background-color: RGBA(216,85,161,1);"
							id="allSelectBtn" onclick="selectAllChk();" >전체선택/해제</button>
						<button type="button" class="btn btn-info" id="deleteOneBtn"
							onclick="deleteOneBtn();" style="float: left; margin-left: 5px; background-color: RGBA(216,85,161,1);">선택상품삭제</button>
					</div>
					<br>
					<div class="purchase">
						<!-- <div class="cart_billing_label"
							style="float: left; font-size: 20px; margin-right: 40px;">결제금액
							합계</div> -->
						<div class="cart_billing_price" style="float: right;"
							id="totalPrice" name="totalPrice" id="totalPrice"></div>
					</div>
					<br> <br> <br>
									
					<div class="purchase">
						<input type="hidden" name="productInfo" id="productInfo" value="" />
						<input type="button" class="btn btn-info" 
							style="background-color: RGBA(216,85,161,1);" id="purchaseBtn" 	name="purchaseBtn" onclick=" myCartListPurchase();" value="구매하기" />		
					</div>
					
					<!-- cartList 끝 -->
				</div>
				<!-- content 끝 -->
			</div>

			<footer> 
				<%@include file="/views/common/footer.jsp"%>
			</footer>
			<!-- wrapper 끝 -->
		</div>
	</center>
</body>
</html>