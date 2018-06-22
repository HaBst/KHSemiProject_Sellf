<%@page import="member.model.vo.UserCartList"%>
<%@page import = "java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="../../CSS/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../../CSS/member/myCart.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">	
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">	
<!-- 내부 js파일 -->
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/member/myCart.js"></script>
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<script type="text/javascript" src="../../JS/bootstrap/bootstrap.min.js"></script>
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">

<title>장바구니 (step1)</title>
</head>

<body>
	<center>
	
				
		
			

	
			
		<div id="wrapper" style="overflow:hidden;">

			<header id="header"> <%@include 	file="/views/common/header.jsp"%> </header>
			<br>
			<div id="content">
				<div id="titleSec">
					<div id="title">
						<% ArrayList<UserCartList> userCart =( ArrayList<UserCartList> ) request.getAttribute("myCartList"); %>
						<%=userCart.get(0).getPrice()%>
						
						
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
				<br> <br>
<!-- 	
				<script>
				function myCartListPurchase(){
					var check = $("input:checkbox[name='chk']:checked");	
					console.log("check:" + check.length	);
						if (check.length == 0) {
								alert("주문상품을 체크해주세요 ");
								location.reload();
								return false;
							
							
						} else if (check.length > 1) {
							alert("주문상품을 하나만 체크해주세요");
							location.reload();
							return false;
					
						}else{ 
							alert("주문페이지 넘기기 성공");
						}
					
				}
				

				function submit() {
					myCartForm.selectedValue.value= $("#cartGoodsName").val(); 
					document.myCartForm.submit();
				}
				</script>
				
		 -->

			
				<form action = "/myCart" method = "post" name = "myCartForm" id ="myCartForm">	
				<div id="cartListSec">
					<table class="table"
						style="table-layout: fixed; margin: auto; text-align: center;">
						<thead>
							<tr>
								<th scope="col" style="width: 10%; padding-left:45px;"><input type="checkbox" id="allCheckBox" /></th>
								<th scope="col" style="width: 30%; padding-left:45px;">주문상품</th>
								<th scope="col" style="padding-left:140px;">수량</th>
								<th scope="col" style="padding-left:140px;">상품금액</th>
							</tr>
						</thead>

						<tbody>
					
						<c:forEach begin="0" end= "0" step="1"> 
								<tr style="height: auto;" id="infoSelectTr">
									<td scope="row" style="width: 10%;">
									<input type="checkbox" style="margin-top: 50px;" name="chk" id="oneCheckBox" name ="oneCheckBox"/></td>	
									<td style="width: 30%;">
										<div class="orderGoodsInfo1"> <!-- 주문상품 정보 : 상품이미지  -->
											<img src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
												style="width: 100px; height: 100px; margin-top: 10px;" id="cartGoodsImg" name="cartGoodsImg" />
										</div>
										<div class="orderGoodsInfo2">  <!-- 주문상품 정보 : 상품명,상품옵션  -->
											<div class="orderGoodsName" style="margin-top: 30px;">
												<a href="#" style="font-size: 13px;">상품명:<span id="cartGoodsName"  name ="cartGoodsName" value="상품명">상품이름입력하세요</span></a>									
											</div>
											<div class="cartGoodsOption" name="cartGoodsOption" value = "dd"> (옵션:색상-그레이)</div>
										</div>
									</td>
									<td style="padding-top: 50px;"><span style="font-size: 15px;" id="orderQuantity">1</span> <br>
										<button type="button" class="btn btn-info" id="quantityUp" 		style="font-size: 10px;">+</button>
										<button type="button" class="btn btn-info" id="quantityDown" 	style="font-size: 10px;">-</button>
										<button type="button" class="btn btn-info" id="changeBtn" style="font-size: 10px;">변경</button></td>
									<td style="padding-top: 60px;"><span style="font-size: 15px;" id="goodsPrice" name="goodsPrices">10000</span>원</td>
								</tr>
							<!-- 	</c:forEach> -->
						</tbody>
					</table>
			
					<br><br>
				</div>
				<div id="dontHaveGoodsList"></div>
				<hr>
				<div class="selectBtn1">
					<button type="button" class="btn btn-info" style="float: left;"
						id="allSelectBtn" onclick="selectAllChk();">전체선택/해제</button>
					<button type="button" class="btn btn-info" id="deleteOneBtn"
						onclick="deleteOneBtn();" style="float: left; margin-left: 5px;">선택상품삭제</button>
				</div>
				<br>
				<div class="purchase">
					<div class="cart_billing_label"
						style="float: left; font-size: 20px; margin-right:40px;" >결제 금액 합계</div>
					<div class="cart_billing_price" style="float: right;" id="totalPrice">????????</div>
				</div>
				<br><br><br>				
				<div class="purchase">
					<button type="submit" class="btn btn-info" id="purchaseBtn" name ="purchaseBtn" onclick = "return myCartListPurchase();" value="${selectedValue}"">구매하기</button>
				</div>
			</form>
			</div>	

			<br><br><br>
			<footer>
					<%@include file="../../views/common/footer.jsp" %>
			</footer>
	</center>
	
	
</body>
</html>