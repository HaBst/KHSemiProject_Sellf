<%@page import="product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
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
crossorigin="anonymous"></script>

<!-- ajax 링크걸기  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.min.css" /> 
<link rel="stylesheet" type="text/css" href="/CSS/main/main.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/adv.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/footer.css">

<!-- 내부 js파일 -->
<script type="text/javascript" src="/JS/common/header.js?ver=1"></script>
<!-- <script type="text/javascript" src="../../JS/member/main.js"></script> -->
<script type="text/javascript" src="/JS/common/adv.js"></script>
<!-- <script type="text/javascript" src="../../JS/bootstrap/bootstrap.min.js"></script> -->
<!-- 구글 폰트 -->
<style>

</style>
<title>메인페이지</title>
</head>
<body>

	<center>
		<!-- Wrapper -->
		<div id="wrapper" style="overflow: hidden;">
		
			<!-- header -->
			<header id="header"> <%@include file="/views/common/header.jsp"%></header>
			
			<!-- 메인 광고 이미지 슬라이더 -->
			<div id="imgSliderSec">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" 	class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<a href="index.jsp"><img class="d-block w-100"
								src="img/categoryImgGroup/노트북광고.JPG"
								alt="첫번째 슬라이드"></a>
						</div>
						<div class="carousel-item">
							<a href="index.jsp"><img class="d-block w-100"
								src="img/categoryImgGroup/수익광고2.JPG"
								alt="두번째 슬라이드"></a>
						</div>
						<div class="carousel-item">
							<a href="index.jsp"><img class="d-block"
								src="img/categoryImgGroup/광고이어폰.JPG" style="width:960px;"
								alt="세번째 슬라이드"></a>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">이전</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">다음</span>
					</a>
				</div>
			</div>
			<br><br>

			<!-- 인기카테고리 -->
			<script type="text/javascript">
				$(document).ready(function(){
				$.ajax({
					url : "/popularCategory",
					data:{},
					type : "get",
					success : function(data) { // list가 넘어옴 
						console.log("성공");
						
						var name = [];
						var imgPath =[];
						var categorySubId = [];
						for (var i = 0; i < data.length; i++) {
							name[i]= data[i].productCategorySubName;
							imgPath[i]= data[i].productCategorySubId;
							categorySubId[i] = data[i].productCategorySubId;
						}
	
					
						$("#popularCategorySec .col-sm:eq(0)>div>a>img").attr("src", "/img/categoryImgGroup/"+imgPath[0]+".JPG");
					 	$("#popularCategorySec .col-sm:eq(1)>div>a>img").attr("src", "/img/categoryImgGroup/"+imgPath[1]+".JPG");;			
						$("#popularCategorySec .col-sm:eq(2)>div>a>img").attr("src", "/img/categoryImgGroup/"+imgPath[2]+".JPG");
						$("#popularCategorySec .col-sm:eq(3)>div>a>img").attr("src", "/img/categoryImgGroup/"+imgPath[3]+".JPG");
						$("#popularCategorySec .col-sm:eq(4)>div>a>img").attr("src", "/img/categoryImgGroup/"+imgPath[4]+".JPG");;
						$("#popularCategorySec .col-sm:eq(5)>div>a>img").attr("src", "/img/categoryImgGroup/"+imgPath[5]+".JPG");;
						$("#popularCategorySec #text1").text(name[0]);
						$("#popularCategorySec #text2").text(name[1]);
						$("#popularCategorySec #text3").text(name[2]);
						$("#popularCategorySec #text4").text(name[3]);
						$("#popularCategorySec #text5").text(name[4]);
						$("#popularCategorySec #text6").text(name[5]);
						$("#sellExpectedSec1_title>div:first-child").text(name[0]);
						$("#sellExpectedSec2_title>div:first-child").text(name[1]);
						$("#sellExpectedSec3_title>div:first-child").text(name[2]);
						
						$("#popularCategorySec a:eq(0)").attr("href","/views/main/productList.jsp?orderType=updateOrder&amp;category=" + categorySubId[0]);
						$("#popularCategorySec a:eq(1)").attr("href","/views/main/productList.jsp?orderType=updateOrder&amp;category=" + categorySubId[1]);
						$("#popularCategorySec a:eq(2)").attr("href","/views/main/productList.jsp?orderType=updateOrder&amp;category=" + categorySubId[2]);
						$("#popularCategorySec a:eq(3)").attr("href","/views/main/productList.jsp?orderType=updateOrder&amp;category=" + categorySubId[3]);
						$("#popularCategorySec a:eq(4)").attr("href","/views/main/productList.jsp?orderType=updateOrder&amp;category=" + categorySubId[4]);
						$("#popularCategorySec a:eq(5)").attr("href","/views/main/productList.jsp?orderType=updateOrder&amp;category=" + categorySubId[5]);
						
						},
						error : function() {
							console.log("인기카테고리 실패");
						}
					}); 	
				});	
				</script>
			<div id="content">
				<div id="popularCategorySec">
					<div id="popularCategory_title">
						<h1 style="font-weight:600;">인기 카테고리</h1>
					</div>
					<br>
					<div class="container">
						<div class="row" style="overflow: hidden;">
							<div class="col-sm">
								<div><a href="#"><img src="" style="width: 100%; height: 100%;"></a></div>
								<div id="text1"></div>
							</div>			
							<div class="col-sm">
								<div><a href="#"><img src="" style="width: 100%; height: 100%;"></a></div>	
								<div id="text2"></div>
							</div>
							<div class="col-sm">
								<div><a href="#"><img src="" style="width: 100%; height: 100%;"></a></div>
								<div id="text3"></div>	
							</div>
					
							<div class="col-sm">
								<div><a href="#"><img src="" style="width: 100%; height: 100%;"></a></div>
								<div id="text4"></div>	
							</div>	
					
							<div class="col-sm">
								<div><a href="#"><img src="" style="width: 100%; height: 100%;"></a></div>
								<div id="text5"></div>	
							</div>	
							
							<div class="col-sm">
								<div><a href="#"><img src="" style="width: 100%; height: 100%;"></a></div>
								<div id="text6"></div>	
							</div>	
		
							
						</div>
					</div>
				</div>
			</div>
			<br><br>  
			<hr>	
			
				<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url : "/notOpenProduct",
					type : "post",
					success : function(data) {
						var productName = [];
						var img = [];
						var productPk = [];
						
						console.log(data);
						for (var i = 0; i < data.length; i++) {
							img[i]= data[i].product_image;
							productName[i] =data[i].product_name;
							productPk[i] =data[i].product_entire_pk;
							}	
							console.log("상품인덱스:"+productPk[0]);
							
						$("#imghoverSec .shadow img:eq(0)").attr("src",img[0]);
							$("#imghoverSec .shadow img:eq(1)").attr("src",img[1]);
							$("#imghoverSec .shadow img:eq(2)").attr("src",img[2]);
							
							$("#imghoverSec .shadow a:eq(0)").attr("href","/productSelectOne?productId="+productPk[0]);
							$("#imghoverSec .shadow a:eq(1)").attr("href","/productSelectOne?productId="+productPk[1]);
							$("#imghoverSec .shadow a:eq(2)").attr("href","/productSelectOne?productId="+productPk[2]);  
					},
					error : function() { 
						console.log("미개봉상품가져오기 실행 실패");	
					}
				}); 	
			});	
			</script> 
			<!-- 이미지 hover 섹션 -->
				<div id="imghoverSec" style="overflow:hidden">
					<div id="imghoverSec_title">
					<h1 style="font-weight:600;">SELL:F 미개봉 중고</h1>
					</div> 
					<br><br>
					<div class="container">
						<div class="row">
							<div class="col-xs-3" style="width: 30%;">
								<div class="shadow">
									<a href="">
									 <img
									src=""
									width="100%" height="100%"> 
									</a>
								</div>
							</div>
							<div class="col-xs-3" style="width: 30%;">
								<div class="shadow">
									<a href=""><img src=""
									width="100%" height="100%"></a>
								</div>
							</div>
							<div class="col-xs-3" style="width: 30%;">
							<div class="shadow">
								<a href=""><img
									src=""
									width="100%" height="100%"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<br> <br>
			<hr>
			<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url : "/newProduct",
					data:{},
					type : "get",
					success : function(data) { 
						var name = [];
						var price = [];
						var img = [];	
						var productNo = [];
						for (var i = 0; i < data.length; i++) {
							name[i]= data[i].name;
							price[i] =data[i].price;	
							img[i] = data[i].image;
							productNo[i] = data[i].productEntireNo;
						}
					$("#newProductSec .card-img-top:eq(0)").attr("src",img[0]);
					$("#newProductSec .card-img-top:eq(1)").attr("src",img[1]);
					$("#newProductSec .card-img-top:eq(2)").attr("src",img[2]);
					$("#newProductSec .card-img-top:eq(3)").attr("src",img[3]);
					$("#newProductSec .card-img-top:eq(4)").attr("src",img[4]);
					$("#newProductSec .card-img-top:eq(5)").attr("src",img[5]);
					$("#newProductSec .card-img-top:eq(6)").attr("src",img[6]);
					$("#newProductSec .card-img-top:eq(7)").attr("src",img[7]);
					$("#newProductSec .card-img-top:eq(8)").attr("src",img[8]);
					$("#newProductSec .card-img-top:eq(9)").attr("src",img[9]);
					$("#newProductSec .card-img-top:eq(10)").attr("src",img[10]);
					$("#newProductSec .card-img-top:eq(11)").attr("src",img[11]);

					$("#newProductSec .card-title:eq(0)").text(name[0]);
					$("#newProductSec .card-title:eq(1)").text(name[1]);
					$("#newProductSec .card-title:eq(2)").text(name[2]);
					$("#newProductSec .card-title:eq(3)").text(name[3]);
					$("#newProductSec .card-title:eq(4)").text(name[4]);
					$("#newProductSec .card-title:eq(5)").text(name[5]);
					$("#newProductSec .card-title:eq(6)").text(name[6]);
					$("#newProductSec .card-title:eq(7)").text(name[7]);
					$("#newProductSec .card-title:eq(8)").text(name[8]);
					$("#newProductSec .card-title:eq(9)").text(name[9]);
					$("#newProductSec .card-title:eq(10)").text(name[10]);
					$("#newProductSec .card-title:eq(11)").text(name[11]);
					$("#newProductSec .card-title:eq(12)").text(name[12]);
					
					$("#newProductSec .card-text:eq(0)").text(price[0]+"원");
					$("#newProductSec .card-text:eq(1)").text(price[1]+"원");
					$("#newProductSec .card-text:eq(2)").text(price[2]+"원");
					$("#newProductSec .card-text:eq(3)").text(price[3]+"원");
					$("#newProductSec .card-text:eq(4)").text(price[4]+"원");
					$("#newProductSec .card-text:eq(5)").text(price[5]+"원");
					$("#newProductSec .card-text:eq(6)").text(price[6]+"원");
					$("#newProductSec .card-text:eq(7)").text(price[7]+"원");
					$("#newProductSec .card-text:eq(8)").text(price[8]+"원");
					$("#newProductSec .card-text:eq(9)").text(price[9]+"원");
					$("#newProductSec .card-text:eq(10)").text(price[10]+"원");
					$("#newProductSec .card-text:eq(11)").text(price[11]+"원");
					$("#newProductSec .card-text:eq(12)").text(price[12]+"원");
					
					$("#newProductSec .pageLocationNo:eq(0)").attr("href","/productSelectOne?productId="+productNo[0]);
					$("#newProductSec .pageLocationNo:eq(1)").attr("href","/productSelectOne?productId="+productNo[1]);
					$("#newProductSec .pageLocationNo:eq(2)").attr("href","/productSelectOne?productId="+productNo[2]);
					$("#newProductSec .pageLocationNo:eq(3)").attr("href","/productSelectOne?productId="+productNo[3]);
					$("#newProductSec .pageLocationNo:eq(4)").attr("href","/productSelectOne?productId="+productNo[4]);
					$("#newProductSec .pageLocationNo:eq(5)").attr("href","/productSelectOne?productId="+productNo[5]);
					$("#newProductSec .pageLocationNo:eq(6)").attr("href","/productSelectOne?productId="+productNo[6]);
					$("#newProductSec .pageLocationNo:eq(7)").attr("href","/productSelectOne?productId="+productNo[7]);
					$("#newProductSec .pageLocationNo:eq(8)").attr("href","/productSelectOne?productId="+productNo[8]);
					$("#newProductSec .pageLocationNo:eq(9)").attr("href","/productSelectOne?productId="+productNo[9]);
					$("#newProductSec .pageLocationNo:eq(10)").attr("href","/productSelectOne?productId="+productNo[10]);
					$("#newProductSec .pageLocationNo:eq(11)").attr("href","/productSelectOne?productId="+productNo[11]);
					$("#newProductSec .pageLocationNo:eq(12)").attr("href","/productSelectOne?productId="+productNo[12]);
					
					},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
					console.log("newProduct 실행 실패");
				}
				
				
			}); 	
		});	
		</script>
	
			<div id="content">
				<!-- 새로운제품 섹션  -->
				<div id="newProductSec">
					<div id="newProduct_title">
						<div><h1  style="font-weight:600;">새로 등록된 상품</h1></div>
						<div><a href="/views/main/productList.jsp">전체보기</a></div>
					</div>
					<br>	
					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
						<div class="container">
							<div class="carousel-inner">
									<div class="carousel-item active">
										<div class="container">
											<div class="row" style="margin-left: 15px;">
												<div class="col-xs-3" style="width: 25%;">
													<a href="" class="pageLocationNo"><img class="card-img-top" src=""></a>
													<div class="card-body">
														<a href="">
														<h5 class="card-title">ge</h5>
														</a><p class="card-text"></p>

													</div>
												</div>
												<div class="col-xs-3" style="width: 25%;">
													<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
													<div class="card-body">
														<a href="#">
														<h5 class="card-title">ge</h5>
														</a><p class="card-text"></p>

													</div>
												</div>

												<div class="col-xs-3" style="width: 25%;">
													<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
													<div class="card-body">
														<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
													</div>
												</div>
												<div class="col-xs-3" style="width: 25%;">
														<a href="#" class="pageLocationNo" > <img class="card-img-top" src=""></a>
											
													<div class="card-body">
														<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
													</div>
												</div>
											</div>
										</div>
									
									</div>		
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
													<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>
												<div class="col-xs-3" style="width: 25%;">
													<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
										
												<div class="card-body">
													<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
												<a href="#">
														<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
													<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
												<a href="#">
													<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="pageLocationNo"> <img class="card-img-top" src=""></a>
												<div class="card-body">
												<a href="#">
													<h5 class="card-title"></h5>
														</a><p class="card-text"></p>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; height: 100%;">
							<a class="carousel-control-prev" href="#carouselExampleControls"
								id="prevBTN" role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">이전</span>
							</a>
						</div>
						<div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; right: 0; height: 100%;">
							<a class="carousel-control-next" href="#carouselExampleControls"
								id="nextBTN" role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">다음</span>
							</a>
						</div>
					</div>

				</div>
			<hr>

	
		<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "/popularProduct",
				data:{},
				type : "get",
				success : function(data) { // list가 넘어옴 
					var name = [];
					var price = [];
					var img = [];
					var detail =[];
					var productNo1 =[];
					var subCateId = [];
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						detail[i] = data[i].detail;
						productNo1[i] = data[i].productNo;
						subCateId[i] = data[i].subCateId;
						console.log("인기카테고리순위1 " + name[i]);
				
						
						
					}	
					console.log("인기카테고리순위1이미지 " + subCateId[0]);
					console.log("인기카테1::::"+productNo1[0]);
					
					$("#sellExpectedSec1 .card-img-top:eq(0)").attr("src",img[0]);
					$("#sellExpectedSec1 .card-img-top:eq(1)").attr("src",img[1]);
					$("#sellExpectedSec1 .card-img-top:eq(2)").attr("src",img[2]);
					$("#sellExpectedSec1 .card-img-top:eq(3)").attr("src",img[3]);
					$("#sellExpectedSec1 .card-img-top:eq(4)").attr("src",img[4]);
					$("#sellExpectedSec1 .card-img-top:eq(5)").attr("src",img[5]);
					$("#sellExpectedSec1 .card-img-top:eq(6)").attr("src",img[6]);
					$("#sellExpectedSec1 .card-img-top:eq(7)").attr("src",img[7]);
					$("#sellExpectedSec1 .card-img-top:eq(8)").attr("src",img[8]);
					$("#sellExpectedSec1 .card-img-top:eq(9)").attr("src",img[9]);
					$("#sellExpectedSec1 .card-img-top:eq(10)").attr("src",img[10]);
					$("#sellExpectedSec1 .card-img-top:eq(11)").attr("src",img[11]);

					
					$("#sellExpectedSec1 .card-title:eq(0)").text(name[0]);
					$("#sellExpectedSec1 .card-title:eq(1)").text(name[1]);
					$("#sellExpectedSec1 .card-title:eq(2)").text(name[2]);
					$("#sellExpectedSec1 .card-title:eq(3)").text(name[3]);
					$("#sellExpectedSec1 .card-title:eq(4)").text(name[4]);
					$("#sellExpectedSec1 .card-title:eq(5)").text(name[5]);
					$("#sellExpectedSec1 .card-title:eq(6)").text(name[6]);
					$("#sellExpectedSec1 .card-title:eq(7)").text(name[7]);
					$("#sellExpectedSec1 .card-title:eq(8)").text(name[8]);
					$("#sellExpectedSec1 .card-title:eq(9)").text(name[9]);
					$("#sellExpectedSec1 .card-title:eq(10)").text(name[10]);
					$("#sellExpectedSec1 .card-title:eq(11)").text(name[11]);
					$("#sellExpectedSec1 .card-title:eq(12)").text(name[12]);
					
					$("#sellExpectedSec1 .card-text:eq(0)").text(price[0]+"원");
					$("#sellExpectedSec1 .card-text:eq(1)").text(price[1]+"원");
					$("#sellExpectedSec1 .card-text:eq(2)").text(price[2]+"원");
					$("#sellExpectedSec1 .card-text:eq(3)").text(price[3]+"원");
					$("#sellExpectedSec1 .card-text:eq(4)").text(price[4]+"원");
					$("#sellExpectedSec1 .card-text:eq(5)").text(price[5]+"원");
					$("#sellExpectedSec1 .card-text:eq(6)").text(price[6]+"원");
					$("#sellExpectedSec1 .card-text:eq(7)").text(price[7]+"원");
					$("#sellExpectedSec1 .card-text:eq(8)").text(price[8]+"원");
					$("#sellExpectedSec1 .card-text:eq(9)").text(price[9]+"원");
					$("#sellExpectedSec1 .card-text:eq(10)").text(price[10]+"원");
					$("#sellExpectedSec1 .card-text:eq(11)").text(price[11]+"원");
					$("#sellExpectedSec1 .card-text:eq(12)").text(price[12]+"원");
					
					$(".popularCate:eq(0)").attr("href","/productSelectOne?productId="+productNo1[0]);
					$(".popularCate:eq(1)").attr("href","/productSelectOne?productId="+productNo1[1]);
					$(".popularCate:eq(2)").attr("href","/productSelectOne?productId="+productNo1[2]);
					$(".popularCate:eq(3)").attr("href","/productSelectOne?productId="+productNo1[3]);
					$(".popularCate:eq(4)").attr("href","/productSelectOne?productId="+productNo1[4]);
					$(".popularCate:eq(5)").attr("href","/productSelectOne?productId="+productNo1[5]);
					$(".popularCate:eq(6)").attr("href","/productSelectOne?productId="+productNo1[6]);
					$(".popularCate:eq(7)").attr("href","/productSelectOne?productId="+productNo1[7]);
					$(".popularCate:eq(8)").attr("href","/productSelectOne?productId="+productNo1[8]);
					$(".popularCate:eq(9)").attr("href","/productSelectOne?productId="+productNo1[9]);
					$(".popularCate:eq(10)").attr("href","/productSelectOne?productId="+productNo1[10]);
					$(".popularCate:eq(11)").attr("href","/productSelectOne?productId="+productNo1[11]);
					$(".popularCate:eq(12)").attr("href","/productSelectOne?productId="+productNo1[12]);
					
					
				},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
				console.log("인기상품1 가져오기 실패 ")
				}
			}); 	
		});	
		</script>
		<br>
			<!-- 인기상품 보여주기 1  -->
	 		<div id="sellExpectedSec1">
					<div id="sellExpectedSec1_title">
						<div></div>
						<br>
						<div><a href="/views/main/productList.jsp">전체보기</a></div>
					</div>
					<br><br><br>
					<div id="carouselExampleControls1" class="carousel slide"
						data-ride="carousel">
						<div class="container" style="margin-right: 50px;">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div class="container">
										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate">  <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#" >
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate">  <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#" >
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
													<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												</a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
													<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"  class="popularCate"> <img class="card-img-top" src=""></a>
												</a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; height: 100%;">
							<a class="carousel-control-prev" href="#carouselExampleControls1"
								id="prevBTN" role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">이전</span>
							</a>
						</div>
						<div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; right: 0; height: 100%;">
							<a class="carousel-control-next" href="#carouselExampleControls1"
								id="nextBTN" role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">다음</span>
							</a>
						</div>
					</div>
				</div> 

	
		<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "/popularProduct2",
				data:{},
				type : "get",
				success : function(data) { // list가 넘어옴 
					console.log("성공");
					var name = [];
					var price = [];
					var img = [];
					var productNo2 = [];
					
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						productNo2[i] = data[i].productNo;
					}	
					console.log("인기카테고리순위2 " + name[0]);
					console.log("인기카테고리순위2이미지 " + img[0]);
					console.log("인기카테고리순위2상품인덱스 : " + productNo2[0]);
					
					$("#sellExpectedSec2 .card-img-top:eq(0)").attr("src",img[0]);
					$("#sellExpectedSec2 .card-img-top:eq(1)").attr("src",img[1]);
					$("#sellExpectedSec2 .card-img-top:eq(2)").attr("src",img[2]);
					$("#sellExpectedSec2 .card-img-top:eq(3)").attr("src",img[3]);
					$("#sellExpectedSec2 .card-img-top:eq(4)").attr("src",img[4]);
					$("#sellExpectedSec2 .card-img-top:eq(5)").attr("src",img[5]);
					$("#sellExpectedSec2 .card-img-top:eq(6)").attr("src",img[6]);
					$("#sellExpectedSec2 .card-img-top:eq(7)").attr("src",img[7]);
					$("#sellExpectedSec2 .card-img-top:eq(8)").attr("src",img[8]);
					$("#sellExpectedSec2 .card-img-top:eq(9)").attr("src",img[9]);
					$("#sellExpectedSec2 .card-img-top:eq(10)").attr("src",img[10]);
					$("#sellExpectedSec2 .card-img-top:eq(11)").attr("src",img[11]);
					
					$("#sellExpectedSec2 .card-title:eq(0)").text(name[0]);
					$("#sellExpectedSec2 .card-title:eq(1)").text(name[1]);
					$("#sellExpectedSec2 .card-title:eq(2)").text(name[2]);
					$("#sellExpectedSec2 .card-title:eq(3)").text(name[3]);
					$("#sellExpectedSec2 .card-title:eq(4)").text(name[4]);
					$("#sellExpectedSec2 .card-title:eq(5)").text(name[5]);
					$("#sellExpectedSec2 .card-title:eq(6)").text(name[6]);
					$("#sellExpectedSec2 .card-title:eq(7)").text(name[7]);
					$("#sellExpectedSec2 .card-title:eq(8)").text(name[8]);
					$("#sellExpectedSec2 .card-title:eq(9)").text(name[9]);
					$("#sellExpectedSec2 .card-title:eq(10)").text(name[10]);
					$("#sellExpectedSec2 .card-title:eq(11)").text(name[11]);
					$("#sellExpectedSec2 .card-title:eq(12)").text(name[12]);
					
					$("#sellExpectedSec2 .card-text:eq(0)").text(price[0]+"원");
					$("#sellExpectedSec2 .card-text:eq(1)").text(price[1]+"원");
					$("#sellExpectedSec2 .card-text:eq(2)").text(price[2]+"원");
					$("#sellExpectedSec2 .card-text:eq(3)").text(price[3]+"원");
					$("#sellExpectedSec2 .card-text:eq(4)").text(price[4]+"원");
					$("#sellExpectedSec2 .card-text:eq(5)").text(price[5]+"원");
					$("#sellExpectedSec2 .card-text:eq(6)").text(price[6]+"원");
					$("#sellExpectedSec2 .card-text:eq(7)").text(price[7]+"원");
					$("#sellExpectedSec2 .card-text:eq(8)").text(price[8]+"원");
					$("#sellExpectedSec2 .card-text:eq(9)").text(price[9]+"원");
					$("#sellExpectedSec2 .card-text:eq(10)").text(price[10]+"원");
					$("#sellExpectedSec2 .card-text:eq(11)").text(price[11]+"원");
					$("#sellExpectedSec2 .card-text:eq(12)").text(price[12]+"원");
					
					$(".popularCate2:eq(0)").attr("href","/productSelectOne?productId="+productNo2[0]);
					$(".popularCate2:eq(1)").attr("href","/productSelectOne?productId="+productNo2[1]);
					$(".popularCate2:eq(2)").attr("href","/productSelectOne?productId="+productNo2[2]);
					$(".popularCate2:eq(3)").attr("href","/productSelectOne?productId="+productNo2[3]);
					$(".popularCate2:eq(4)").attr("href","/productSelectOne?productId="+productNo2[4]);
					$(".popularCate2:eq(5)").attr("href","/productSelectOne?productId="+productNo2[5]);
					$(".popularCate2:eq(6)").attr("href","/productSelectOne?productId="+productNo2[6]);
					$(".popularCate2:eq(7)").attr("href","/productSelectOne?productId="+productNo2[7]);
					$(".popularCate2:eq(8)").attr("href","/productSelectOne?productId="+productNo2[8]);
					$(".popularCate2:eq(9)").attr("href","/productSelectOne?productId="+productNo2[9]);
					$(".popularCate2:eq(10)").attr("href","/productSelectOne?productId="+productNo2[10]);
					$(".popularCate2:eq(11)").attr("href","/productSelectOne?productId="+productNo2[11]);
					$(".popularCate2:eq(12)").attr("href","/productSelectOne?productId="+productNo2[12]);
					
				},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
					console.log("인기카테고리2 실패");
				}
			}); 	
		});	
		</script>
		<br>
		<!-- 인기상품 보여주기 2 -->	
				<div id="sellExpectedSec2">
					<div id="sellExpectedSec2_title">
					<div></div>
						<br>
					<div><a href="#">전체보기</a></div>
				</div>
					<br><br><br>
					<div id="carouselExampleControls2" class="carousel slide"
						data-ride="carousel">
						<div class="container" style="margin-right: 50px;">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div class="container">
										<div class="row" style="margin-left: 15px;">
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

										<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2" ><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#" >
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2" ><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate2"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						 <div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; height: 100%;">
							<a class="carousel-control-prev" href="#carouselExampleControls2"
								id="prevBTN0" role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">이전</span>
							</a>
						</div>
						<div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; right: 0; height: 100%;">
							<a class="carousel-control-next" href="#carouselExampleControls2"
								id="nextBTN0" role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">다음</span>
							</a>
						</div> 
					</div>
				</div> 
		<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "/popularProduct3",
				type : "get",
				success : function(data) { // list가 넘어옴 
					var name = [];
					var price = [];
					var img = [];
					var productNo3 = [];
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						productNo3[i] = data[i].productNo;
						console.log("인기카테고리순위3 " + name[i]);
						console.log("인기카테고리순위3이미지 : " + img[i]);		
					}	
					
					$("#sellExpectedSec3 .card-img-top:eq(0)").attr("src",img[0]);
					$("#sellExpectedSec3 .card-img-top:eq(1)").attr("src",img[1]);
					$("#sellExpectedSec3 .card-img-top:eq(2)").attr("src",img[2]);
					$("#sellExpectedSec3 .card-img-top:eq(3)").attr("src",img[3]);
					$("#sellExpectedSec3 .card-img-top:eq(4)").attr("src",img[4]);
					$("#sellExpectedSec3 .card-img-top:eq(5)").attr("src",img[5]);
					$("#sellExpectedSec3 .card-img-top:eq(6)").attr("src",img[6]);
					$("#sellExpectedSec3 .card-img-top:eq(7)").attr("src",img[7]);
					$("#sellExpectedSec3 .card-img-top:eq(8)").attr("src",img[8]);
					$("#sellExpectedSec3 .card-img-top:eq(9)").attr("src",img[9]);
					$("#sellExpectedSec3 .card-img-top:eq(10)").attr("src",img[10]);
					$("#sellExpectedSec3 .card-img-top:eq(11)").attr("src",img[11]); 
					
					$("#sellExpectedSec3 .card-title:eq(0)").text(name[0]);
					$("#sellExpectedSec3 .card-title:eq(1)").text(name[1]);
					$("#sellExpectedSec3 .card-title:eq(2)").text(name[2]);
					$("#sellExpectedSec3 .card-title:eq(3)").text(name[3]);
					$("#sellExpectedSec3 .card-title:eq(4)").text(name[4]);
					$("#sellExpectedSec3 .card-title:eq(5)").text(name[5]);
					$("#sellExpectedSec3 .card-title:eq(6)").text(name[6]);
					$("#sellExpectedSec3 .card-title:eq(7)").text(name[7]);
					$("#sellExpectedSec3 .card-title:eq(8)").text(name[8]);
					$("#sellExpectedSec3 .card-title:eq(9)").text(name[9]);
					$("#sellExpectedSec3 .card-title:eq(10)").text(name[10]);
					$("#sellExpectedSec3 .card-title:eq(11)").text(name[11]);
					$("#sellExpectedSec3 .card-title:eq(12)").text(name[12]);
					
					$("#sellExpectedSec3 .card-text:eq(0)").text(price[0]+"원");
					$("#sellExpectedSec3 .card-text:eq(1)").text(price[1]+"원");
					$("#sellExpectedSec3 .card-text:eq(2)").text(price[2]+"원");
					$("#sellExpectedSec3 .card-text:eq(3)").text(price[3]+"원");
					$("#sellExpectedSec3 .card-text:eq(4)").text(price[4]+"원");
					$("#sellExpectedSec3 .card-text:eq(5)").text(price[5]+"원");
					$("#sellExpectedSec3 .card-text:eq(6)").text(price[6]+"원");
					$("#sellExpectedSec3 .card-text:eq(7)").text(price[7]+"원");
					$("#sellExpectedSec3 .card-text:eq(8)").text(price[8]+"원");
					$("#sellExpectedSec3 .card-text:eq(9)").text(price[9]+"원");
					$("#sellExpectedSec3 .card-text:eq(10)").text(price[10]+"원");
					$("#sellExpectedSec3 .card-text:eq(11)").text(price[11]+"원");
					$("#sellExpectedSec3 .card-text:eq(12)").text(price[12]+"원");
					
					console.log("인기카테고리3:"+productNo3[0]);
					$(".popularCate3:eq(0)").attr("href","/productSelectOne?productId="+productNo3[0]);
					$(".popularCate3:eq(1)").attr("href","/productSelectOne?productId="+productNo3[1]);
					$(".popularCate3:eq(2)").attr("href","/productSelectOne?productId="+productNo3[2]);
					$(".popularCate3:eq(3)").attr("href","/productSelectOne?productId="+productNo3[3]);
					$(".popularCate3:eq(4)").attr("href","/productSelectOne?productId="+productNo3[4]);
					$(".popularCate3:eq(5)").attr("href","/productSelectOne?productId="+productNo3[5]);
					$(".popularCate3:eq(6)").attr("href","/productSelectOne?productId="+productNo3[6]);
					$(".popularCate3:eq(7)").attr("href","/productSelectOne?productId="+productNo3[7]);
					$(".popularCate3:eq(8)").attr("href","/productSelectOne?productId="+productNo3[8]);
					$(".popularCate3:eq(9)").attr("href","/productSelectOne?productId="+productNo3[9]);
					$(".popularCate3:eq(10)").attr("href","/productSelectOne?productId="+productNo3[10]);
					$(".popularCate3:eq(11)").attr("href","/productSelectOne?productId="+productNo3[11]);
					$(".popularCate3:eq(12)").attr("href","/productSelectOne?productId="+productNo3[12]);
				},
				error : function() {
					console.log("인기카테고리 3실패");
				;
				}
			}); 	
		});	
		</script>
		<br>
		<!-- 인기상품 보여주기 3 -->	
			<div id="sellExpectedSec3">
					<div id="sellExpectedSec3_title">
						<div></div>
						<br>
						<div><a href="/views/main/productList.jsp">전체보기</a></div>
					</div>
					<br><br><br>
					<div id="carouselExampleControls3" class="carousel slide"
						data-ride="carousel">
						<div class="container" style="margin-right: 50px;">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="container">
										<div class="row" style="margin-left: 15px;">
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3" ><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="carousel-item">
									<div class="container">
										<div class="row" style="margin-left: 15px;">
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#" >
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>
											
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">7 explanation</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">7 explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

										<div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#" class="popularCate3"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						 <div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; height: 100%;">
							<a class="carousel-control-prev" href="#carouselExampleControls3"
								id="prevBTN0" role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">이전</span>
							</a>
						</div>
						<div class="col-xs-3"
							style="width: 20%; position: absolute; top: 0; right: 0; height: 100%;">
							<a class="carousel-control-next" href="#carouselExampleControls3"
								id="nextBTN0" role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">다음</span>
							</a>
						</div> 
					</div>
				</div> 
				<br> <br>
		<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "/collectionSec",
				data:{},
				type : "get",
				success : function(data) { // list가 넘어옴 
					var name = [];
					var price = [];
					var img = [];
					var detail = [];
					var productNo4 = [];
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						detail[i] = data[i].detail;
						productNo4[i] = data[i].productNo;
			
					}	
					console.log("MD추천 상품인덱스: " + productNo4[0]);		
			
					$("#collectionSec .img-responsive:eq(0)").attr("src",img[0]);
					$("#collectionSec .img-responsive:eq(1)").attr("src",img[1]);
					$("#collectionSec .img-responsive:eq(2)").attr("src",img[2]);
					$("#collectionSec .img-responsive:eq(3)").attr("src",img[3]);
					
				
					$("#collectionSec .caption .caption-text:eq(0)>p").text(detail[0]);
					$("#collectionSec .caption .caption-text:eq(1)>p").text(detail[1]);
					$("#collectionSec .caption .caption-text:eq(2)>p").text(detail[2]);
					$("#collectionSec .caption .caption-text:eq(3)>p").text(detail[2]);
					
					$("#collectionSec #price1").text(price[0]);
					$("#collectionSec #price2").text(price[1]);
					$("#collectionSec #price3").text(price[2]);
					$("#collectionSec #price4").text(price[3]);

					$(".mdProduct1").attr("href","/productSelectOne?productId="+productNo4[0]);
					$("#mdProduct1").attr("href","/productSelectOne?productId="+productNo4[0]);
					$(".mdProduct2").attr("href","/productSelectOne?productId="+productNo4[1]);
					$("#mdProduct2").attr("href","/productSelectOne?productId="+productNo4[1]);
					$(".mdProduct3").attr("href","/productSelectOne?productId="+productNo4[2]);
					$("#mdProduct3").attr("href","/productSelectOne?productId="+productNo4[2]);
					$(".mdProduct4").attr("href","/productSelectOne?productId="+productNo4[3]);
					$("#mdProduct4").attr("href","/productSelectOne?productId="+productNo4[3]);
					
					$("#col_container .col-xs-3:first-child h4").text(name[0]);
					$("#col_container .col-xs-3:nth-child(2) h4").text(name[1]);
					$("#col_container .col-xs-3:nth-child(3) h4").text(name[2]);
					$("#col_container .col-xs-3:nth-child(4) h4").text(name[3]);
				},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
					console.log("실패");
				}
			}); 	
		});	
		</script>
		<hr>
				<div id="collectionSec">
					<div id="collectionSec_title">MD 추천 상품</div>
					<br><br><br>
					<div id="collectionSec_container">
					<div class="container" id="col_container">
						<br>
						<div class="row">
							<div class="col-xs-3" style="width: 23%;">
								<!-- 이미지 캡션 -->
								<div class="cuadro_intro_hover" style="background-color: #cccccc;">
									<p style="text-align: center; margin-top: 0px;">		
									<a href ="#" class="mdProduct1"><img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;"></a>	
									</p>
									<div class="caption">
										<div class="blur"></div>
										<div class="caption-text">
											<h4 style="padding: 10px;">추천</h4>
											<p align="center" style="padding: 10px;"></p>
											<a class=" btn btn-default" href="#" id="mdProduct1">가격:<span id="price1" class="glyphicon glyphicon-plus"></span>원</a>		
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<!-- 이미지 캡션 -->
								<div class="cuadro_intro_hover"
									style="background-color: #cccccc;">
									<p style="text-align: center; margin-top: 0px;" >
										<a href ="" class = "mdProduct2">
											<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;"></a>	
									</p>
									<div class="caption">
										<div class="blur"></div>
										<div class="caption-text">
											<h4 style="padding: 10px;">추천상품</h4>
											<p align="center" style="padding: 10px;"></p>
												<a class=" btn btn-default" href="#" id="mdProduct2">가격:<span id="price2" class="glyphicon glyphicon-plus"></span>원</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<!-- 이미지 캡션 -->
								<div class="cuadro_intro_hover" style="background-color: #cccccc;">
									<p style="text-align: center; margin-top: 0px;" >
										<a href ="" class = "mdProduct3">
											<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;"></a>	
									</p>
									<div class="caption">
										<div class="blur"></div>
										<div class="caption-text">
										<h4 style="padding: 10px;">추천상품</h4>
											<p align="center" style="padding: 10px;"></p>
												<a class=" btn btn-default" href="#" id="mdProduct3">가격:<span id="price3" class="glyphicon glyphicon-plus"></span>원</a>
										</div>
									</div>
								</div>
							</div>
								
							<div class="col-xs-3" style="width: 23%;">
									<!-- 이미지 캡션 -->
									<div class="cuadro_intro_hover"
										style="background-color: #cccccc;">
										<p style="text-align: center; margin-top: 0px;">
										<a href ="" class = "mdProduct4">
											<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;"></a>	
										</p>
										<div class="caption">
											<div class="blur"></div>
											<div class="caption-text" >
					
											<h4 style="padding: 10px;">추천상품</h4>
												<p align="center" style="padding: 10px;"></p>
													<a class=" btn btn-default" href="#" id="mdProduct4">가격:<span id="price4" class="glyphicon glyphicon-plus"></span>원</a>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
				</div>

				<br> <br><br> <br>

				
			<!-- 중간광고 -->
<!-- 
			<div id="middleAdSec">

				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-ride="carousel">
					<div class="carousel-inner" style="width: 100%;">
						<div class="carousel-item active">
							<a href="#"><img class="d-block w-100"
								src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
								alt="First slide"></a>
						</div>
						<div class="carousel-item">
							<a href="#"> <img class="d-block w-100"
								src="img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg"
								alt="Second slide"></a>
						</div>
						<div class="carousel-item">
							<a href="#"><img class="d-block w-100"
								src="img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg"
								alt="Third slide"></a>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleFade"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleFade"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div> -->
<!-- 
			<div id="content">
				<br> <br>
				 베스트 아이템 구역

				<div id="bestItemSec">
					<h1>BEST ITEM</h1>
					<div class="container">

						<br>
						<div class="row">
							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
													onmouseover="this.src='img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg'"
													onmouseout="this.src='img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg'"
													alt="Card image cap">
												</a>

												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>

												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg"
													onmouseover="this.src='img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg'"
													onmouseout="this.src='img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg'"
													alt="Card image cap"></a>

												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg"
													onmouseover="this.src='img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg'"
													onmouseout="this.src='img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg'"
													alt="Card image cap"></a>
												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a> </a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
													onmouseover="this.src='img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg'"
													onmouseout="this.src='img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg'"
													alt="Card image cap"></a>
												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="bestItemSec2">

					<div class="container">


						<div class="row">
							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
													onmouseover="this.src='img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg'"
													onmouseout="this.src='img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg'"
													alt="Card image cap">
												</a>

												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>

												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg"
													onmouseover="this.src='img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg'"
													onmouseout="this.src='img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg'"
													alt="Card image cap"></a>

												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg"
													onmouseover="this.src='img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg'"
													onmouseout="this.src='img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg'"
													alt="Card image cap"></a>
												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a> </a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-3" style="width: 23%;">
								<div class="productList">
									<div class="productWrap">
										<div class="productBg">
											<div class="imgWrapper">
												<a href="#"> <img class="card-img-top"
													id="productImgMain"
													src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
													onmouseover="this.src='img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg'"
													onmouseout="this.src='img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg'"
													alt="Card image cap"></a>
												<div class="productSideMenu">
													<div class="display_quickview">
														<a href="#"><img src="img/thumb_quickview.png"
															alt="미리보기"></a>
													</div>
													<div class="display_option">
														<a href="#"><img src="img/thumb_option.png" alt="옵션보기"></a>
														<div class="hide display_opt_bak" act=""></div>
													</div>
													<div class="display_send">
														<a href="#"> <img src="img/thumb_send.png"
															alt="SNS보내기"></a>
													</div>
													<div class="display_zzim">
														<a href="#"> <img src="img/thumb_zzim_off.png"
															alt="찜하기"><img src="img/thumb_quickview.png"
															style="display: none" alt="찜하기">
													</div>
												</div>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> -->
		<!-- 	<div id="content">
				<div id="popularInterestSec">
					<div id="popularInterestSec_title">
						<h1>인기관심사</h1>
					</div>
					<br>
					<div class="container">
						<div class="row" style="overflow: hidden;">
							<div class="col-sm">
								<img
									src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
									style="width: 100%; height: 100%;">디비에서이미지
							</div>
							<div class="col-sm">
								<img
									src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
									style="width: 100%; height: 100%;">디비에서이미지
							</div>
							<div class="col-sm">
								<img
									src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
									style="width: 100%; height: 100%;">디비에서이미지
							</div>
							<div class="col-sm">
								<img
									src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
									style="width: 100%; height: 100%;">디비에서이미지
							</div>
							<div class="col-sm">
								<img
									src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
									style="width: 100%; height: 100%;">디비에서이미지
							</div>
							<div class="col-sm">
								<img
									src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
									style="width: 100%; height: 100%;">디비에서이미지
							</div>
						</div>
					</div>
					<br>
				</div>
				<br>
				<br>
			</div> -->
			</div>	
	
			<!-- 고객 리뷰 가져오기 -->
			
		 	<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url : "/mainUserReview1",
					type : "post",
					success : function(data) {
						var writeDate = [];
						var comment = [];
						var userId = [];
						console.log(data);
						for (var i = 0; i < data.length; i++) {
								comment[i]= data[i].userReviewComment;
								writeDate[i] =data[i].userReviewDate;
								userId[i] = data[i].userReviewUserEntireIdFk;
								
								
							}	
						console.log("코멘트  :" + comment[0]);
						console.log("구매자아이디  :" + userId[0]);
							$("#review .col-sm:eq(0)>div:last-child").text(comment[0]);
							$("#review .col-sm:eq(1)>div:last-child").text(comment[1]);
							$("#review .col-sm:eq(2)>div:last-child").text(comment[2]);
							$("#review .col-sm:eq(0)>div:first-child").text(userId[0]+ "님이 작성한 리뷰입니다~!!  ");
							$("#review .col-sm:eq(1)>div:first-child").text(userId[1]+ "님이 작성한 리뷰입니다~!!  ");
							$("#review .col-sm:eq(2)>div:first-child").text(userId[2]+ "님이 작성한 리뷰입니다~!!  ");
					},
					error : function() { 
						console.log("리뷰가져오기 실행 실패");	
					}
				}); 	
			});	
			</script> 
			<div id="content" class="reviewContent">
			 	<div id="reviewTitle"><h1 style="font-weight:600;">1000만 사용자가 생길 예정입니다.</h1></div>
			 	<br>
			 	
				<div class="container" id="review" style="overflow:hidden;">
				  <div class="row">
				  	
				    <div class="col-sm">
				    	<div class="title_userId"></div>
				    	<hr>
				    	<div></div>
				    
				    </div>
				    <div class="col-sm">
						<div class="title_userId"></div>
						<hr>				   
						<div></div>
				    </div>
				    <div class="col-sm">
						<div class="title_userId"></div>
						<hr>				    	
						<div></div>
				    </div>
				  </div>
				</div>	
			
			</div>							
			<br><br>
				<!-- footer -->
			<div id="footer"> <%@include file="/views/common/footer.jsp"%></div>
		</div>
	
		</center>				
	
	
	 	
	 	


</body>

</html>