<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="../../CSS/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../../CSS/member/myCart3.css">		
<link rel="stylesheet" type="text/css" href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<!-- 내부 js파일 -->
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/member/myCart3.js"></script>
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<script type="text/javascript" src="../../JS/bootstrap/bootstrap.min.js"></script>

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<title>주문완료</title>			
<style>
</style>
</head>

<body>
	<center>
		<div id="wrapper" style="font-family: 'Sunflower', sans-serif; overflow:hidden;" >
			<!-- header -->
			<header id="header"> <%@include file="/views/common/header.jsp"%> </header>
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
							<li>
								<h3>
									STEP2 <small>주문/결제</small>
								</h3>
							</li>
							<li class="active">
								<h3>
									STEP3 <small>결제완료</small>
								</h3>
							</li>
						</ul>
					</div>
				</div>
				<br>
				<div id="orderComplete">
					<div id="orderCompleteTitle">
						<h1>주문완료</h1>
						<span style="font-size: 50px; color: green;">SELL:F</span> <span
							style="font-size: 20px;">쇼핑몰을 이용해주셔서 감사합니다.</span>
					</div>
				</div>
				<br>
				<div id="orderInfo">
					<div>
						<table class="table"
							style="table-layout: fixed; margin: auto; text-align: center;">
							<thead>
								<tr>
									<th scope="col" style="padding-left:145px;">주문상품</th>
									<th scope="col" style="padding-left:160px;">수량</th>
									<th scope="col" style="padding-left:140px;">총결제금액</th>
								</tr>
							</thead>
							<tbody>
								<tr style="height: auto;" id="infoSelectTr">
									<td style="width: 30%; padding-top: 10px;">
										<div class="orderGoodsInfo1">
											<img
												src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
												style="width: 100px; height: 100px;" />
										</div>
										<div class="orderGoodsInfo2">
											<div class="orderGoodsName">
												<a href="#">상품명:<span>?????</span></a>
											</div>
											<div class="orderGoodsOption">(옵션:색상-그레이)</div>
										</div>
									</td>
									<td style="padding-top: 50px;"><span style="font-size: 15px;" id="orderquantity">1</span> <br></td>
									<td style="padding-top: 50px;"><span style="font-size: 15px;">총결제금액</span></td>										
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<hr>
				<button type="button" class="btn btn-secondary" onclick="home();">메인으로</button>
				<button type="button" class="btn btn-secondary" onclick="myPage();">마이페이지</button>
				<button type="button" class="btn btn-secondary"
					onclick="myOrderList();">주문내역확인</button>
			</div>
			<br> <br>
			<footer id="footer">
						<%@include file="../../views/common/footer.jsp" %>
			</footer>
		</div>
	</center>
</body>


</body>
</html>