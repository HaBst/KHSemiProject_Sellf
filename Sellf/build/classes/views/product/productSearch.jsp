<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "product.model.vo.*" import = "java.util.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<!--
    <link rel="stylesheet" type="text/css" href="/CSS/product/productSearch.css">
    <link rel="stylesheet" type="text/css" href="../../CSS/product/productSearch.css">
-->
</head>
<style>
body {
	margin: 0px;
	width: 100%;
	height: auto;
}

header {
	text-align: center;
	border: 1px solid black;
	width: 100%;
	height: 150px;
}

footer {
	text-align: center;
	border: 1px solid black;
	width: 100%;
	height: 150px;
}

.wrapper {
	width: 100%;
	height: auto;
}

.Allcontainer {
	padding: 0px;
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	height: auto;
}

.searchProductNameWrapper {
	margin-top: 2%;
	padding: 1%;
}

.searchProductNameWrapper h2 {
	display: inline;
}

.searchProductName {
	padding: 10px;
	margin-bottom: 20px;
}

#productFilter {
	width: 90%;
	border: 1px solid rgb(236, 236, 236);
	padding: 30px 30px 22px;
	margin-bottom: 40px;
	margin: auto;
}

.subject {
	float: left;
	padding-top: 3px;
	padding-right: 3%;
}
/*
.conSelect {
	margin-left: 13%;
}

.conSelect a {
	margin-right: 2%;
}
*/
.filterWrapper {
	margin-bottom: 2.5%;
}

.listSort {
	margin: 6% 5% 3%;
}

.listSort>* {
	margin-right: 1%;
}

.idWrapper {
	padding: 5px 20px 15px;
}

#page {
	text-align: center;
}

.btn-toolbar {
	display: inline-block;
	margin-top: 4%;
	margin-bottom: 3%;
}

.btn-group {
	padding: 6px;
}

.ad {
	margin-top: 5%;
	margin-bottom: 2%;
}
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
        $(document).ready(function() {
            $(window).scroll(function() {
                var scrollHeight = $(window).scrollTop() + $(window).height();
                var documentHeight = $(document).height();

                if (scrollHeight == documentHeight) {
                    for (var i = 0; i < 4; i++) {
                        $().appendTo('.row');
                    }
                }
            });
        });
    </script>

	<header>
		<div>
			<h1>탑 들어갈 부분</h1>
		</div>
	</header>

	<style>
.productState-btn {
	display: inline-block;
	float: left;
	height: 30px;
	font-size: 14px;
	line-height: 16px;
	padding: 6px 16px;
	border-radius: 14px;
	border: 1px solid #dbdbdb;
	margin: 0 8px 8px 0;
	color: #dbdbdb;
}

#productState {
	width: 100%;
	clear: both;
	padding: 2%;
}

.productPrice-btn {
	display: inline-block;
	float: left;
	height: 30px;
	font-size: 14px;
	line-height: 16px;
	padding: 6px 16px;
	border-radius: 14px;
	border: 1px solid #dbdbdb;
	margin: 0 8px 8px 0;
	color: #dbdbdb;
}

#productPrice {
	width: 100%;
	clear: both;
	padding: 2%;
}
</style>
	<script>
        var allState;
        var allPrice;
window.onload = function(){
	allState = document.getElementsByClassName('productState-btn')[0];
	selectProductState();
    allPrice = document.getElementsByClassName('productPrice-btn')[0];
	selectPrice();
}
    function selectProductState()
{
	var stateList = document.getElementsByClassName('productState-btn');
	for(var i = 0; i<stateList.length;i++)
	{
		stateList[i].style.backgroundColor = "white";
	}
	allState.style.backgroundColor = "gray";	
	stateArr =[];
}
        var stateArr = [];
function selectProductMulti(state)
{
	allState.style.backgroundColor = "white";
	state.style.backgroundColor = "gray";	
	stateArr.push(state);
}
        
        
        function selectPriceState()
{
	var priceList = document.getElementsByClassName('productPrice-btn');
	for(var i = 0; i<priceList.length;i++)
	{
		priceList[i].style.backgroundColor = "white";
	}
	allPrice.style.backgroundColor = "gray";	
	priceArr =[];
}

var priceArr = [];
function selectPriceMulti(price)
{
	allPrice.style.backgroundColor = "white";	
	price.style.backgroundColor = "gray";	
	priceArr.push(price);
}
    </script>






	<section>
		<div class="wrapper">

			<div class="Allcontainer">

				<div class="searchProductNameWrapper">
					<div class="searchProductName">
						<h2 id=p roductName>????</h2>
						<!--상품이름-->
						"에 대한 검색 결과"
					</div>
				</div>

				<section id="newProwductsSec">
					<div class="shadow-sm p-3 mb-5 bg-white rounded">
						<div id="productFilter">


							<div class="filterWrapper">

								<div id="productState">
									<div class="subject">상품 상태</div>
									<a class="productState-btn" onclick="selectProductState();">모든상품</a>
									<a class="productState-btn" onclick="selectProductMulti(this);">최상</a>
									<a class="productState-btn" onclick="selectProductMulti(this);">상</a>
									<a class="productState-btn" onclick="selectProductMulti(this);">중</a>
									<a class="productState-btn" onclick="selectProductMulti(this);">중하</a>
									<a class="productState-btn" onclick="selectProductMulti(this);">하</a>
								</div>



								<div id="productState">
									<div class="subject">가격대</div>
									<a class="productPrice-btn" onclick="selectPriceState();">전체</a>
									<a class="productPrice-btn" onclick="selectPriceMulti(this);">~
										1만원</a> <a class="productPrice-btn"
										onclick="selectPriceMulti(this);">1~5만원</a> <a
										class="productPrice-btn" onclick="selectPriceMulti(this);">5~15만원</a>
									<a class="productPrice-btn" onclick="selectPriceMulti(this);">15~30만원</a>
									<a class="productPrice-btn" onclick="selectPriceMulti(this);">30만원~</a>

								</div>

								<div class="listSort">
									<a href="" class="btn btn-outline-primary btn-sm">최신순</a> <a
										href="" class="btn btn-outline-primary btn-sm">낮은 가격순</a> <a
										href="" class="btn btn-outline-primary btn-sm">높은 가격순</a>

								</div>
							</div>
						</div>
				</section>













				<section id="newProductsSec">
					<div class="container">

						<div class="row">



							<div class="col-md-3" style="width: 18rem;">
								<div class="idWrapper">
									<div class="uploadId">계정명</div>
								</div>
								<img class="card-img-top" src="../../img/1.PNG"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title"></h5>
									<p class="card-text"></p>
									<a href="#" class="btn btn-primary">자세히보기</a>
									<p class="card-text"></p>
								</div>
							</div>


                            
                            
                            
                            
                            
						</div>
					</div>

				</section>

				<section class="ad">
					<div id="carouselExampleFade" class="carousel slide carousel-fade"
						data-ride="carousel">

						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-5" src="../../img/%EC%9D%98%EC%9E%90.JPG"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-5" src="../../img/%EC%9D%98%EC%9E%902.JPG"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-5" src="../../img/%EC%9D%98%EC%9E%903.JPG"
									alt="Third slide">
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
				</section>







				<section id="page">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>

				</section>

			</div>
		</div>

	</section>

	
	<form action="/productSearch" method="get"  >
	<input type="text" name="searchSub">
	<input type ="submit" value="검색">
	</form>






	<footer>
		<h2>footer</h2>
	</footer>
</body>
</html>