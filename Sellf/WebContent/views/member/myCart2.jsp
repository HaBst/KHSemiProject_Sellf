<%@page import="member.model.vo.Member"%>
<%@page import="product.model.vo.Product"%>
<%@page import="member.model.vo.MyCartTmp"%>
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
	href="/CSS/member/myCart2.css">
<link rel="stylesheet" type="text/css"
	href="/CSS/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css"
	href="/CSS/common/footer.css">
	
<!-- 내부 js파일 -->
<script type="text/javascript" src="/JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="/JS/common/adv.js"></script>
<script type="text/javascript" src="/JS/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>

<!-- 주소 검색 -->
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script> <!-- 주소 검색 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script> <!-- 주소 api -->

<title>주문하기 (step2)</title>
</head>
<body>	
<script>

</script>
<%ArrayList<MyCartTmp> list = (ArrayList<MyCartTmp>) request.getAttribute("orderList"); %>
	<center>
<%="디테일은 :" +list.get(0).getProductDetail() %>
		 <div id="wrapper" style="overflow: hidden;">
			
			<!-- header -->
			<header id="header"> <%@include
				file="/views/common/header.jsp"%> </header>
			<br>
		
			<div id="content">
				<div id="orderStepSec">
					<div class="sign-up">
						<ul>
							<li>
								<h3>
									STEP1 <small> 장바구니</small>
								</h3>
							</li>
							<li class="active">
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
				<div id="content2">
				
				<form action="/myCart3" method="post">
					<div id="deliveryInfo" style="margin-bottom: 80px; height: 100%;">
						<h2>주문정보</h2>
						<hr>
						<h3 style="float: left;">배송지</h3>
						<br> <br> <br> <br>
						<div class="input-group input-group-sm mb-3"
							style="width: 300px; float: left;">
							<input type="text" class="form-control" aria-label="Small"
								aria-describedby="inputGroup-sizing-sm" placeholder="받는 분"
								name="memberName" id="memberName" style="height: 40px;" value="<%=list.get(0).getUser_name()%>">
						</div>
						<div class="input-group input-group-sm mb-3"
							style="width: 300px; float: left;">
							<input type="tel" class="form-control" aria-label="Small"
								aria-describedby="inputGroup-sizing-sm"
								placeholder="휴대폰번호(숫자만입력)" name="phone" id="phone"
								style="height: 40px;"  value="<%=list.get(0).getUser_phone() %>">
						</div>
						<br> <br>
						<div class="input-group input-group-sm mb-3"
							style="width: 300px; float: left;">
							<div class="input-group-prepend"></div>
							<input type="email" class="form-control" aria-label="Small"
								aria-describedby="inputGroup-sizing-sm" placeholder="이메일주소"
								name="email" id="email" style="height: 40px;" value ="<%=list.get(0).getUser_email()%>">
						</div>
						<div class="input-group input-group-sm mb-3"
							style="width: 300px; float: left;">
							<input type="text" class="form-control postcodify_address" aria-label="Small"
								aria-describedby="inputGroup-sizing-sm" placeholder="주소"
								name="addrInfo" size="50" readonly="readonly" style="height: 40px;" value="<%=list.get(0).getUser_addr()%>">
						</div>
						<br> <br> <br> <br>
						 <button type="button" class="btn btn-secondary btn-sm"
							onclick="findAddr();" id="postcodify_search_button"
							style="margin-left: -80px; margin-top: -3px; height: 40px;">주소검색</button>


						<div class="input-group input-group-sm mb-3"
							style="width: 400px; float: left;">
							<input type="text" class="form-control postcodify_details" aria-label="Small"
								aria-describedby="inputGroup-sizing-sm" placeholder="상세주소"
								name="addrDetail" size="50" style="height: 40px;">
						</div>
						<br> <br> <br> <br> <br> <br>
						<div id="orderResult"></div>
						<h2>결제수단</h2>
						<hr>
						<br> <br> <input type="button" value="신용카드"
							class="payButton"> 
							<input type="button"
							value="무통장입금(가상계좌)" class="payButton">
					</div>
					
					<div id="orderListInfo" >
						<br>
						<h2>결제상품</h2>
						<hr>
						<div id="goodsInfo">
							<img src="<%=list.get(0).getProductImage() %>"
								style="width: 100px; height: 100px; float: left;">
							<div id="goodsName" name="goodsName" style="padding-bottom:10px; margin-top:10px;">상품명 : <%=list.get(0).getProductName()%></div>
							<div id="goodsPrice" name="goodsPrice">상품가격 : <%=list.get(0).getProductPrice()%></div>
						</div>
						<div id="orderListInfoWrap">
							<div>
								<span style="font-weight:500;">주문 수량</span><span id="productPrice">상품명:<%=list.get(0).getProductName()%>&nbsp;
													<%=list.get(0).getProductAmount()%>외&nbsp;<%=list.size()-1 %>개</span>
							</div>
							<div>
								<span style="font-weight:500;">쿠폰사용</span><span>
									<button type="button" style="background-color: #66CCFF;"class="btn btn-secondary" onclick="availableCouponsBtn();">사용가능쿠폰</button>		
								</span>
							</div>
							<div>
								<span style="font-weight:500;" >E-wallet포인트</span><span id="userPoint" name="ewalletPoint"><%=list.get(0).getUser_ePoint() %>포인트</span>
							</div>
							<div>
								<span style="font-weight:500;">배송료</span><span>무료배송</span>
							</div>
							<hr>
							<div>
							<%! int totalPrice = 0; 
								int amount= 0; 
								int price = 0;
							%>
							<%for (int i = 0 ; i<list.size(); i++){ 
								int result = 0;
								amount = list.get(i).getProductAmount();
								price = list.get(i).getProductPrice();
								result = amount * price;
								totalPrice+=result;	
							%>						
							<%}%>
							
							<%for(int i = 0 ; i<list.size();i++) {%>
							<input type="hidden" name ="productEntire+<%=i %>" value = "<%=list.get(i).getProductEntire() %>" />
							<%} %>
							<input type="hidden" name="totalAmount" value="<%=list.size() %>" />	
								<span style="font-weight:500;">총 결제 금액</span> 
								<span id="totalPrice"><%=totalPrice-list.get(0).getUser_ePoint()%>원</span>				
							</div>
							<div style="padding-left: 16px;">
								<!--  외부 API 결제시스템 반영 or 기존에 적립한 포인트로 결제하는 방법  -->	
								<input type="submit" class="btn btn-secondary" id="orderButton" 
								style="width: 300px; height: 50px; margin-right: 15px; background-color: #66CCFF;" value="주문하기" onclick="return orderBtn();">
							</div>
											
							<br><br>	
						</div>
					</div>
				</form>
				</div>
			</div>
			<footer> <%@include file="../../views/common/footer.jsp"%>
			</footer>
		</div> 
	</center>

<script type="text/javascript">
	function orderBtn() {
		var memberName = $("#memberName").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var detailAddress = $("#detailAddress").val();
		var address = $("#address").val();

		if (memberName == "" || email == "" || phone == ""
				|| detailAddress == "" || address == "") {
			$("#orderResult").text(
					"빈칸 없이 입력해주세요 (2초 후 페이지 새로고침)");
			setInterval(function() {
				location.reload();
			}, 2000);
			return false;
		} else {

			return true;
			
		}
	}

	$(document).ready(function(){
		$("#goodsInfo>img").attr("src",<%=list.get(0).getProductImage()%>)
	});

	function availableCouponsBtn() {
		window.open("/views/member/availableCoupons.jsp","pop","toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,width=400px,height=500px");			
	}
	</script>
</body>
</html>