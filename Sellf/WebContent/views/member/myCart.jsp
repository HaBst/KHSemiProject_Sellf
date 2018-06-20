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

			
						
				
<!-- 								/* 	var rowData = new Array(); // 체크박스 선택될 때
									var tdArr = new Array(); 
									//체크된 체크박스의값을 가져온다
									check.each(function(i) {
										var tr = check.parent().parent().eq(i);
										var td = tr.children();
										console.log(tr);
										// 체크된 row의 값을 배열에 담음 
										rowData.push(tr.text());
										
										var productImg = $("#cartGoodsImg").html(); // 상품 이미지 가져오기 
										var productName  = $("#cartGoodsName").html(); // 상품명 가져오기
										var option = $("#cartGoodsOption").html(); //상품 옵션 
										var quantity =$("#orderQuantity").html(); // 상품수량
										var price = $("#goodsPrice").html(); //상품 금액 
										var totalPrice = quantity * price; // 상품 주문금액 합계 
										var alltotalPrice = totalPrice - 3000; // 상품 주문금액 합계 -3000원(고정값?)
										console.log("상품이름: "+ productName)
										console.log("전체 금액 : "+ totalPrice)
										// 가져온 값을 배열에 담는다.
										tdArr.push(productImg);
										tdArr.push(productName);
										tdArr.push(option);
										tdArr.push(quantity);
										tdArr.push(price);	
										tdArr.push(totalPrice);	
										tdArr.push(alltotalPrice);	
										
										$.ajax({

											url : "/test12",
											type : "get",
											date{ tdArr :tdArr},
											success : function(data) {
												
												var result = "";
												var keys = Object.keys(data);
												for (var i = 0; i < keys.length; i++) {
													result += "이름 :" + data[keys[i]].name + "나이: "
															+ data[keys[i]].age + "주소 : "
															+ data[keys[i]].addr;
												}
												
												$("#result12").html(result);
												console.log("성공");
											},
											error : function() {
												console.log("실패");
											}
										});


									});
								
									$("#test1").text(" 체크된 Row의 모든 데이터 = "+rowData +"입니다.");	
									$("#test2").text("배열담기:"+tdArr);		
									//location.href = "../../views/member/myCart2.jsp";
								}
											
							});  -->
					
					
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
							<!--  장바구니하는 개수만큼 장바구니에 리스트 출력하는 구문  -->
						<!-- 	<c:forEach begin="0" end="[input:checkbox[name='chk']:checked.length]-1" step="1"> -->
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
											<div class="cartGoodsOption" name="cartGoodsOption" value = "dd">(옵션:색상-그레이)</div>
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
				<br>

				<hr>
				<div class="selectBtn1">
					<button type="button" class="btn btn-info" style="float: left;"
						id="allSelectBtn" onclick="selectAllChk();">전체선택/해제</button>
					<button type="button" class="btn btn-info" id="deleteOneBtn"
						onclick="deleteOneBtn();" style="float: left; margin-left: 5px;">선택상품삭제</button>
				</div>
				<div class="purchase">
					<div class="cart_billing_label"
						style="float: left; font-size: 20px;" >상품 금액 합계</div>
					<div class="cart_billing_price" style="float: right;" id="totalPrice">????????</div>
				</div>
				<br> <br>
				<div class="purchase">
					<div class="cart_billing_label"
						style="float: left; font-size: 20px;">배&nbsp;&nbsp;송&nbsp;&nbsp;비</div>
					<div class="cart_billing_price" style="float: right;">3000원</div>
				</div>
				<br> <br>
				<hr>
				<div class="purchase">
					<div class="cart_billing_label"
						style="float: left; font-size: 20px;">총&nbsp;&nbsp;합&nbsp;&nbsp;계</div>
					<div class="cart_billing_price" style="float: right;">????????</div>
				</div>
				<br> <br>
				
				<div class="purchase">
					<button type="submit" class="btn btn-info" id="purchaseBtn" name ="purchaseBtn" onclick = "return myCartListPurchase();" value="${selectedValue}"">구매하기</button>
				</div>
			</form>
			</div>
					
			<br> <br> <br>
			<footer>
					<%@include file="../../views/common/footer.jsp" %>
			</footer>
	</center>
	
	
</body>
</html>