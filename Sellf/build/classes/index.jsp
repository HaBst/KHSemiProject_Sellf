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
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/member/main.js"></script>
<script type="text/javascript" src="../../JS/common/adv.js"></script>
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
					<div class="carousel-inner" style="width: 100%;">
						<div class="carousel-item active">
							<a href="index.jsp"><img class="d-block w-100"
								src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
								alt="첫번째 슬라이드"></a>
						</div>
						<div class="carousel-item">
							<a href="index.jsp"><img class="d-blockw-100"
								src="img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg"
								alt="두번째 슬라이드"></a>
						</div>
						<div class="carousel-item">
							<a href="index.jsp"><img class="d-block w-100"
								src="img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg"
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
			<br> <br> <br>
			<!-- 인기카테고리 -->
			
			<script type="text/javascript">
				$(document).ready(function(){
				$.ajax({
					url : "/popularCategory",
					data:{},
					type : "get",
					success : function(data) { // list가 넘어옴 
						console.log("성공");
						var result = "";
						var name = [];
						var imgPath =[];
						for (var i = 0; i < data.length; i++) {
							name[i]= data[i].categoryName;
							imgPath[i]= data[i].categoryImagePath;
						}
						console.log(name[0]);
						console.log(imgPath[0]);
						console.log(name[1]);
						console.log(imgPath[1]);
	
						$("#popularCategorySec .col-sm:eq(0)>div>a>img").attr("src", imgPath[0]);
					 	$("#popularCategorySec .col-sm:eq(1)>div>a>img").attr("src", imgPath[1]);;			
						$("#popularCategorySec .col-sm:eq(2)>div>a>img").attr("src", imgPath[2]);
						$("#popularCategorySec .col-sm:eq(3)>div>a>img").attr("src", imgPath[3]);
						$("#popularCategorySec .col-sm:eq(4)>div>a>img").attr("src", imgPath[4]);;
						$("#popularCategorySec .col-sm:eq(5)>div>a>img").attr("src", imgPath[5]);;
						$("#popularCategorySec #text1").text(name[0]);
						$("#popularCategorySec #text2").text(name[1]);
						$("#popularCategorySec #text3").text(name[2]);
						$("#popularCategorySec #text4").text(name[3]);
						$("#popularCategorySec #text5").text(name[4]);
						$("#popularCategorySec #text6").text(name[5]);
						$("#sellExpectedSec1_title>div:first-child").text("인기카테고리 "+name[0]);
						$("#sellExpectedSec2_title>div:first-child").text(name[1]);
						$("#sellExpectedSec3_title>div:first-child").text(name[2]);
						},
						error : function() {
							console.log("실패");
							$("#test1").text("ggggg");
						}
					}); 	
				});	
				
				function test12() {

					$.ajax({

						url : "/test12",
						type : "get",
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

				}

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
			<div>
			<br><br>
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
						for (var i = 0; i < data.length; i++) {
							name[i]= data[i].name;
							price[i] =data[i].price;	
							img[i] = data[i].image;
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
				},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
					console.log("newProduct 실행 실패");
				}
			}); 	
		});	
		</script>
	
				<div id="content">
				<br> <br>
				<!-- 새로운제품 섹션  -->
				<div id="newProductSec">
					<div id="newProduct_title">
						<div><h1  style="font-weight:600;">새로 등록된 상품</h1></div>
						<div><a href="#">전체보기</a></div>
					</div>
					<br>	
					<div id="carouselExampleControls" class="carousel slide"
						data-ride="carousel">
						<div class="container">
							<div class="carousel-inner">
									<div class="carousel-item active">
										<div class="container">
											<div class="row" style="margin-left: 15px;">
												<div class="col-xs-3" style="width: 25%;">
													<a href="#"><img class="card-img-top" src=""></a>
													<div class="card-body">
														<a href="#">
														<h5 class="card-title">${newProductMainList[0].productName} </h5>
														</a><p class="card-text">${newProductMainList[0].productPrice}원 </p>

													</div>
												</div>
												<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
													<div class="card-body">
														<a href="#">
															<h5 class="card-title">${newProductMainList[1].productName} </h5>
														</a>
														<p class="card-text">${newProductMainList[1].productPrice} 원</p>

													</div>
												</div>

												<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
													<div class="card-body">
														<a href="#">
															<h5 class="card-title">${newProductMainList[2].productName} </h5>
														</a>
														<p class="card-text">${newProductMainList[2].productPrice} 원</p>
													</div>
												</div>
												<div class="col-xs-3" style="width: 25%;">
														<a href="#"> <img class="card-img-top" src=""></a>
											
													<div class="card-body">
														<a href="#">
															<h5 class="card-title">${newProductMainList[3].productName} </h5>
														</a>
														<p class="card-text">${newProductMainList[3].productPrice}원 </p>
													</div>
												</div>
											</div>
										</div>
									
									</div>		
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">${newProductMainList[4].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[4].productPrice}원</p>
												</div>
											</div>
												<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">${newProductMainList[4].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[4].productPrice}원</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">${newProductMainList[6].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[6].productPrice}원</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
										
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">${newProductMainList[7].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[7].productPrice}원</p>

												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="container">

										<div class="row" style="margin-left: 15px;">

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
												<a href="#">
														<h5 class="card-title">${newProductMainList[8].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[8].productPrice}원</p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">${newProductMainList[9].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[9].productPrice}원</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
												<a href="#">
														<h5 class="card-title">${newProductMainList[10].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[10].productPrice}원</p>

												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
												<a href="#">
														<h5 class="card-title">${newProductMainList[11].productName}</h5>
													</a>
													<p class="card-text">${newProductMainList[11].productPrice}원</p>

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
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						detail[i] = data[i].detail;
						console.log("인기카테고리순위1 " + name[i]);
						console.log("인기카테고리순위1이미지 " + img[i]);
					}				
				
					$("#sellExpectedSec1 .card-img-top:eq(0)").attr("src",img[0]);
					console.log(img[0]);
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
						<div><a href="#">전체보기</a></div>
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
												<a href="#"> <img class="card-img-top" 	src="" 	alt="Card image cap"></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title"></h5>
													</a>
													<p class="card-text"></p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
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
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
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
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
													<a href="#"> <img class="card-img-top" src=""></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">product explanation</p>

												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"> <img class="card-img-top" src=""></a>
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
					
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						console.log("인기카테고리순위1 " + name[i]);
						console.log("인기카테고리순위1이미지 " + img[i]);
					}				
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
				},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
					console.log("실패");
					$("#test1").text("ggggg");
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
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
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
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
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
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
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
				data:{},
				type : "get",
				success : function(data) { // list가 넘어옴 
					var name = [];
					var price = [];
					var img = [];
					
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
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
				},// ★ 배열은 인덱스번호 i값!!!!!!!!!!!!!!!꺄~~~~~
				error : function() {
					console.log("실패");
					$("#test1").text("ggggg");
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
						<div><a href="#">전체보기</a></div>
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
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
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
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>
											
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div>

											<div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">7 explanation</p>
												</div>
											</div>
											<div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
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
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
												<div class="card-body">
													<a href="#">
														<h5 class="card-title">Card title</h5>
													</a>
													<p class="card-text">6 explanation</p>
												</div>
											</div><div class="col-xs-3" style="width: 25%;">
												<a href="#"><img class="card-img-top"	src="" ></a>
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
					for (var i = 0; i < data.length; i++) {
						name[i]= data[i].name;
						price[i] =data[i].price;	
						img[i]= data[i].image;
						detail[i] = data[i].detail;
						console.log("컬렉션 " + name[i]);
						console.log("컬렉션이미지 : " + img[i]);
						console.log("컬렉션설명: " + detail[i]);
					}	
					
			
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
								<div class="cuadro_intro_hover"
									style="background-color: #cccccc;">
									<p style="text-align: center; margin-top: 0px;">
										<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;">	
									</p>
									<div class="caption">
										<div class="blur"></div>
										<div class="caption-text">
											<h3 style="padding: 10px;">상품설명</h3>
											<p align="center" style="padding: 10px;"></p>
												<a class=" btn btn-default" href="#">가격:<span id="price1" class="glyphicon glyphicon-plus">ggs=</span>원</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<!-- 이미지 캡션 -->
								<div class="cuadro_intro_hover"
									style="background-color: #cccccc;">
									<p style="text-align: center; margin-top: 0px;">
										<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;">	
									</p>
									<div class="caption">
										<div class="blur"></div>
										<div class="caption-text">
											<h3 style="padding: 10px;">상품설명</h3>
											<p align="center" style="padding: 10px;"></p>
												<a class=" btn btn-default" href="#">가격:<span id="price2" class="glyphicon glyphicon-plus"></span>원</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3" style="width: 23%;">
								<!-- 이미지 캡션 -->
								<div class="cuadro_intro_hover"
									style="background-color: #cccccc;">
									<p style="text-align: center; margin-top: 0px;">
										<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;">	
									</p>
									<div class="caption">
										<div class="blur"></div>
										<div class="caption-text">
											<h3 style="padding: 10px;">상품설명</h3>
											<p align="center" style="padding: 10px;"></p>
												<a class=" btn btn-default" href="#">가격:<span id="price3" class="glyphicon glyphicon-plus"></span>원</a>
										</div>
									</div>
								</div>
							</div>
								
							<div class="col-xs-3" style="width: 23%;">
									<!-- 이미지 캡션 -->
									<div class="cuadro_intro_hover"
										style="background-color: #cccccc;">
										<p style="text-align: center; margin-top: 0px;">
											<img src="" class="img-responsive" alt ="" style="width: 100%; height: 200px;">	
										</p>
										<div class="caption">
											<div class="blur"></div>
											<div class="caption-text">
												<h3 style="padding: 10px;">상품설명</h3>
												<p align="center" style="padding: 10px;"></p>
													<a class=" btn btn-default" href="#">가격:<span id="price4" class="glyphicon glyphicon-plus"></span>원</a>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
				</div>

				<br> <br><br> <br>

				<!-- 이미지 hover 섹션 -->
				<div id="imghoverSec" style="overflow:hidden">
					<div class="container">

						<div class="row">
							<div class="col-xs-4" style="width: 30%;">
								<div class="shadow">
									<a href="#"><img
										src="img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg"
										width="100%" height="100%"></a>
								</div>
							</div>
							<div class="col-xs-4" style="width: 30%;">
								<div class="shadow">
									<a href="#"><img
										src="img/11_tmp_606d17707165b62f4acf9cb1f07275399075large.jpg"
										width="100%" height="100%"></a>
								</div>
							</div>
							<div class="col-xs-4" style="width: 30%;">
								<div class="shadow">
									<a href="#"><img
										src="img/12_tmp_d8bfc4e19d83e16b58504a5271a05bfe9565large.jpg"
										width="100%" height="100%"></a>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
			<br> <br>
		</div>	
		<br><br>
		<hr>	
		<br>
	<!-- 고객 리뷰 가져오기 -->
			<div id="content">			
			<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url : "/mainUserReview",
					type : "get",
					success : function(data) {
						var writeDate = [];
						var comment = [];
							for (var i = 0; i < data.length; i++) {
								comment[i]= data[i].comment;
								writeDate[i] =data[i].date;	
								console.log("코멘트  "+[i] +":" + comment[i]);
							}	
							console.log("코멘트 ??? " + comment[0]);
							$("#review1_content").text(comment[0]);
							$("#review2_content").text(comment[1]);
							$("#review3_content").text(comment[2]);
		
							$("#review1_title").text(name[0]);
							$("#review2_title").text(name[1]);
							$("#review3_title").text(name[2]);
					},
					error : function() { 
						console.log("리뷰가져오기 실행 실패");	
					}
				}); 	
			});	
			</script>
		
				<div id="reviewSec">
					<div id="review_title"><h1>1000만이 넘는 사용자들이 생길 예정입니다.</h1></div>
					<div id ="reviewContent">
						<div class="review1">
							<div id="review1_title"></div>
							<div id="review1_content"></div>
						</div>
						<div class="review2">
							<div id="review2_title"></div>
							<div id="review2_content"></div>
						</div>
						<div class="review3">
							<div id="review3_title"></div>
							<div id="review3_content"></div>
						</div>
						
					</div>
				</div>
			</div>
			<br><br>
		<!-- footer -->
			<footer id="footer"> <%@include file="/views/common/footer.jsp"%></footer>	
	
	</div>		 	
	</center>

</body>

</html>