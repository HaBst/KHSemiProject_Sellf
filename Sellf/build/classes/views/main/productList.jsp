<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
 	import="product.model.vo.*" import="java.util.ArrayList"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery 링크걸기 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="../../CSS/bootstrap/bootstrap.min.css?ver=1" />
<link rel="stylesheet" href="../../CSS/common/common.css?ver=1" />
<link rel="stylesheet" href="../../CSS/main/productListMain.css?ver=1" />

<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<!-- 내부 js파일 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="../../JS/bootstrap/bootstrap.min.js?ver=1"></script>
<script src="../../JS/main/productListMain.js"></script>
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/common/adv.js?ver=1"></script>

<!-- 내부 css 파일 -->

<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css?ver=1">
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css?ver=1">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css?ver=1">
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css?ver=1">

<title>상품 목록</title>
</head>
<body>
	<center>
		<!--  Wrraper    -->
		<div id="wrapper">
			<!--  Header -->
			<header id="header">
                 <center>
				 <%@include  file="../../views/common/header.jsp" %>
				 </center>
			</header>
			<section id="content">				
				<div id="topLeftLink">
					<a href="#">홈>LIVINGROOM</a>
				</div>
				<br>
				<br>
				<br>
				<div id="categorySelect">
					<div id="categoryBorder">
						<div id="categoryType">
							<div class="categoryTitle">카테고리</div>
							<div class="categoryTitleList">
								<a class="category-btn" onclick="selectCategory(this);" >모든상품</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >거실/주방가구</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >게임/타이틀</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">공구</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">공연티켓</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">기저귀/물티슈</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >낚시</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >전자기기</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">남성의류</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">여성의류</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">가방</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);">목욕/스킨케어</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >모자</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >생활용품</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >수유/이유용품</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >스마트폰</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >여행,항공권</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >유아가구</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >노트북</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >테블릿</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >입장권</a>
								<a class="category-btn" onclick="selectCategoryMulti(this);" >유람선 티켓 </a>
							</div>
						</div>
						<div id="productState">
							<div class="categoryTitle">상품상태</div>
							<div class="categoryTitleList">
								<a class="productState-btn" onclick="selectProductState();">모든상품</a>
								<a class="productState-btn" onclick="selectProductMulti(this);">최상</a>
								<a class="productState-btn" onclick="selectProductMulti(this);">상</a>
								<a class="productState-btn" onclick="selectProductMulti(this);">중</a>
								<a class="productState-btn" onclick="selectProductMulti(this);">중하</a>
								<a class="productState-btn" onclick="selectProductMulti(this);">하</a>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div id="crossLine"></div>
				<div id="productTitle">
					<label>전자제품</label>
				</div>
	
				<div id="recommandProductTitle">
					<strong>추천상품</strong>
				</div>
				<div id="recommandProductContent">
					<div id="recommandProduct">
						<div class="productBg" style="height:100%;">
							<div class="imgWrapper">
								<img class="productImgMain"
									src="../../img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg"
									alt="">														
								
								<div class="productCoverExplain">
									<br><br><br>				
									<ul>
										<li style="color:white;overflow:auto;">	세련된flex 디자인</li>
										<li style="color:gray;overflow:auto;">	 제품설명1<br> 제품설명2</li>
										<li style="color:white;overflow:auto;">		<s>￦ 50,000</s>-> ￦ 40,000</li>
									</ul>
								</div>
								<div class="productSideMenu">
									<div class="display_newwin hide"><img src="../../img/thumb_quickview.png" alt=""></div>
									<div class="display_quickview"><img src="../../img/thumb_quickview.png" alt="미리보기"></div>
									<div class="display_option"><img src="../../img/thumb_option.png" alt="옵션보기"><div class="hide display_opt_bak" act=""></div></div>
									<div class="display_send"><img src="../../img/thumb_send.png" alt="SNS보내기"></div>
									<div class="display_zzim"><img src="../../img/thumb_zzim_off.png" alt="찜하기"><img src="../../img/thumb_quickview.png" style="display:none" alt="찜하기"></div>
								</div>
							</div>
						</div>
					</div>
					<div id="recommandProduct">
						<div class="productBg" style="height:100%;">
							<div class="imgWrapper">
								<img class="productImgMain"
									src="../../img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg"
									alt="">														
								
								<div class="productCoverExplain">
									<br><br><br>				
									<ul>
										<li style="color:white;overflow:auto;">	세련된flex 디자인</li>
										<li style="color:gray;overflow:auto;"> 제품설명1<br> 제품설명2</li>
										<li style="color:white;overflow:auto;">	<s>￦ 50,000</s>-> ￦ 40,000</li>
									</ul>
								</div>
								<div class="productSideMenu">
									<div class="display_newwin hide"><img src="../../img/thumb_quickview.png" alt=""></div>
									<div class="display_quickview"><img src="../../img/thumb_quickview.png" alt="미리보기"></div>
									<div class="display_option"><img src="../../img/thumb_option.png" alt="옵션보기"><div class="hide display_opt_bak" act=""></div></div>
									<div class="display_send"><img src="../../img/thumb_send.png" alt="SNS보내기"></div>
									<div class="display_zzim"><img src="../../img/thumb_zzim_off.png" alt="찜하기"><img src="../../img/thumb_quickview.png" style="display:none" alt="찜하기"></div>
								</div>
							</div>
						</div>
					</div>
					<div id="recommandProduct">
						<div class="productBg" style="height:100%;">
							<div class="imgWrapper">
								<img class="productImgMain"
									src="../../img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg"
									alt="">														
								
								<div class="productCoverExplain">
									<br><br><br>				
									<ul>
										<li style="color:white;overflow:auto;">	세련된flex 디자인</li>
										<li style="color:gray;overflow:auto;">	 제품설명1<br> 제품설명2</li>
										<li style="color:white;overflow:auto;">		<s>￦ 50,000</s>-> ￦ 40,000</li>
									</ul>
								</div>
								<div class="productSideMenu">
									<div class="display_newwin hide"><img src="../../img/thumb_quickview.png" alt=""></div>
									<div class="display_quickview"><img src="../../img/thumb_quickview.png" alt="미리보기"></div>
									<div class="display_option"><img src="../../img/thumb_option.png" alt="옵션보기"><div class="hide display_opt_bak" act=""></div></div>
									<div class="display_send"><img src="../../img/thumb_send.png" alt="SNS보내기"></div>
									<div class="display_zzim"><img src="../../img/thumb_zzim_off.png" alt="찜하기"><img src="../../img/thumb_quickview.png" style="display:none" alt="찜하기"></div>
								</div>
							</div>
						</div>
					</div>
					<div id="recommandProduct">
						<div class="productBg" style="height:100%;">
							<div class="imgWrapper">
								<img class="productImgMain"
									src="../../img/13_tmp_2a76a0e4e67b6235c1154881381ed2655930large.jpg"
									alt="">																						
								<div class="productCoverExplain">
									<br><br><br>				
									<ul>
										<li style="color:white;overflow:auto;">	세련된flex 디자인</li>
										<li style="color:gray;overflow:auto;">	 제품설명1<br> 제품설명2</li>
										<li style="color:white;overflow:auto;">	<s>￦ 50,000</s>-> ￦ 40,000</li>
									</ul>
								</div>
								<div class="productSideMenu">
									<div class="display_newwin hide"><img src="../../img/thumb_quickview.png" alt=""></div>
									<div class="display_quickview"><img src="../../img/thumb_quickview.png" alt="미리보기"></div>
									<div class="display_option"><img src="../../img/thumb_option.png" alt="옵션보기"><div class="hide display_opt_bak" act=""></div></div>
									<div class="display_send"><img src="../../img/thumb_send.png" alt="SNS보내기"></div>
									<div class="display_zzim"><img src="../../img/thumb_zzim_off.png" alt="찜하기"><img src="../../img/thumb_quickview.png" style="display:none" alt="찜하기"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="entireProduct">
					<div id="entireProductTitle">
						<label id="entireProductTitleLabel">전체상품</label>
					</div>
					<div id="crossLineLong"></div>
					<ul class="float_wrap">
						<li class="left"><span class="sort_item">
								<button class="sortBtn" onclick = 'selectSortType("uploadOrder");' name="uploadOrder" value="최근등록순"><b>최근등록순</b></button>
								&nbsp;|&nbsp; 
								<button class="sortBtn" onclick = 'selectSortType("lowPriceOrder");' name="lowPriceOrder" value="낮은가격순">낮은가격순</button>
								&nbsp;|&nbsp; 
								<button class="sortBtn" onclick = 'selectSortType("highPriceOrder");' name="highPriceOrder" value="높은가격순">높은가격순</button>
								&nbsp;|&nbsp;
								<button class="sortBtn" onclick = 'selectSortType("manyReviewOrder");' name="manyReviewOrder" value="상품평많은순">상품평많은순</button>
						</span></li>
						<!-- <li class="right">
							 <select name="perpage" id="perPageCount" 
								onchange="selectOnePageProduct(this);">
									<option value="16">16개씩 보기</option>
									<option value="32">32개씩 보기</option>
									<option value="80">80개씩 보기</option>
									<option value="160">160개씩 보기</option>
							</select>
							
							<ul class="goods_list_style">
								<li><a
									href="?display_style=lattice_a&amp;code=0006&amp;popup=&amp;iframe="
									title="격자형A">■</a></li>
								<li><a
									href="?display_style=lattice_b&amp;code=0006&amp;popup=&amp;iframe="
									title="격자형B">▣</a></li>
								<li><a
									href="?display_style=list&amp;code=0006&amp;popup=&amp;iframe="
									title="리스트형">▦</a></li>
							</ul>
						</li>
						-->
					</ul>
					<br>
					<br>
					<div class="productList">
						<!-- 상품리스트 -->
					</div>
				</div>
				<div id="pagingArea" style="display: block; width: 100%; overflow: auto;">
					<ul class="pagination">
						<!-- 페이징 처리 부분 -->
					</ul>					
				</div>
			</section>

			<footer id="footer">
				<%@include file="../../views/common/footer.jsp"%> 
			</footer>
		</div>
	</center>
</body>
</html>