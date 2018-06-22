<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">
	<div class="containerAd" id="div2">
		<div id="advertising">
			<img id="exerImg2" src="../../img/join_coupon.PNG" height="120px" ;/>
			<button class="btn" id="hideBtn">x</button>
		</div>

	</div>
	<center>
		<button value="" id="show"></button>
	</center>
	<div id="headerDetailGroup">
		<div id="logoarea">
			<img id="logoimg" src="../../img/logo.jpg" height="120px"
				width="270px" alt="셀프이미지"; />
		</div>
		<div id="middleTwoBox">
			<div id="headerTitle">
				<!--중간 첫번째 윗부분-->
				<div>
					<a href="">LOGIN</a>
				</div>
				<div>
					<a href="">JOIN</a>
				</div>
				<div>
					<a href="">CART</a>
				</div>
				<div>
					<a href="">ORDER</a>
				</div>
				<div>
					<a href="">MYPAGE</a>
				</div>
				<div>
					<a href="">CSCENTER</a>
				</div>
				<div>
					<a href="" id="bookmark">+BOOKMARK</a>
				</div>
			</div>
			<div id="searchBox">
				<form action="#" method="get">
					<div id="searchText">
						<input type="text" id="search" name="searchquery"
							placeholder="상품명으로 검색해보세요">
					</div>
					<div id="searchIcon">
						<input type="submit" value="" class="inputImg"
							style="BACKGROUND-COLOR: #FFFFFF">
					</div>
				</form>
			</div>
		</div>

	</div>
	<hr>
	<div class="bs-example">
		<div class="navimove">
			<form action="/productSortCategory">
				<ul class="nav nav-pills" role="tablist">
					<!--            <li role="presentation" class="active"><a href="#">전체 카테고리</a></li>-->
					<li role="presentation" class="dropdown"><a id="drop4" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false"> 전자기기
							<span class="caret"></span>
					</a>

						<ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">

							<h4 class="dropdown-header">전자제품</h4>

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0101" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0101">스마트폰</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0102" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0102">태블릿PC</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0103" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0103">노트북/PC</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0104" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0104">노트북/PC 주변기기</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0105" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0105">카메라</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0106" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0106">음향가전/학습기기</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0107" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0107">게임/타이틀</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0108" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0108">웨어러블</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0109" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0109">영상가전</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0110" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0110">생활/주방/미용가전</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0111" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0111">자동차기기</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0112" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0112">기타 주변기기</a></li>
							<li role="presentation" class="divider"></li>
							<h4 class="dropdown-header">자동차</h4>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=">자동차</a></li>
						</ul></li>
					<li role="presentation" class="dropdown"><a id="drop5" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false"> 패션 <span class="caret"></span>
					</a>
						<ul id="menu2" class="dropdown-menu" role="menu" aria-labelledby="drop5">

							<h4 class="dropdown-header">패션용품</h4>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0201" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0201">남성의류</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0202" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0202">여성의류</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0203" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0203">언더웨어</a></li>

							<li role="presentation" class="divider"></li>
							<h4 class="dropdown-header">패션잡화</h4>

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0301" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0301">신발</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0302" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0302">여성가방</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0303" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0303">남성가방</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0304" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0304">지갑</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0305" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0305">시계</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0306" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0306">주얼리</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0307" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0307">모자</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0308" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0308">여행용 가방/소품</a></li>
							<li role="menuitem" tabindex="-1" class="detailcategory"><a id="S0309" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0309">기타잡화</a></li>

						</ul></li>
					<li role="presentation" class="dropdown"><a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
							화장품/미용 <span class="caret"></span>
					</a>
						<ul id="menu3" class="dropdown-menu" role="menu" aria-labelledby="drop6">
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0401" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0401">스킨케어</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0402" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0402">선케어</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0403" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0403">베이스메이크업</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0404" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0404">색조메이크업</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0405" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0405">클렌징</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0406" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0406">마스크/팩</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0407" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0407">헤어케어</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0408" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0408">헤어스타일링</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0409" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0409">바디케어</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0410" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0410">네일케어</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0411" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0411">헤어스타일링</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0412" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0412">바디케어</a></li>

						</ul></li>
					<li role="presentation" class="dropdown"><a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
							스포츠/레저 <span class="caret"></span>
					</a>
						<ul id="menu3" class="dropdown-menu" role="menu" aria-labelledby="drop6">

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0501" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0501">캠핑</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0502" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0502">등산</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0503" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0503">골프</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0504" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0504">자전거/오토바이/스쿠터</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0505" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0505">스키/보드</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0506" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0506">낚시</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0507" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0507">수영/헬스/요가</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0508" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0508">스케이트/보드/롤러</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0509" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0509">축구/야구/농구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0510" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0510">기타 스포츠 용품</a></li>

						</ul></li>
					<li role="presentation" class="dropdown"><a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
							취미/문화/도서 <span class="caret"></span>
					</a>
						<ul id="menu3" class="dropdown-menu" role="menu" aria-labelledby="drop6">

							<h4 class="dropdown-header">완구/문구/취미</h4>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0601" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0601">문구/사무용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0602" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0602">화방용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0603" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0603">악기</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0604" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0604">피규어</a></li>

							<li role="presentation" class="divider"></li>
							<h4 class="dropdown-header">여행/문화</h4>

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0701" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0701">지류/카드상품권</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0702" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0702">공연/티켓</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0703" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0703">모바일쿠폰/상품권</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0704" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0704">여행/항공권</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0705" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0705">레저이용권</a></li>

							<li role="presentation" class="divider"></li>
							<h4 class="dropdown-header">도서/음반/DVD</h4>

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0801" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0801">도서</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0802" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0802">DVD/음반</a></li>
						</ul></li>

					<li role="presentation" class="dropdown"><a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
							유아동/출산 <span class="caret"></span>
					</a>
						<ul id="menu3" class="dropdown-menu" role="menu" aria-labelledby="drop6">

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0901" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0901">완구/교육/교구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0902" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0902">수유/이유용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0903" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0903">외출용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0904" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0904">유아가구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0905" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0905">목욕/스킨케어</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0906" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0906">위생/건강/세제</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0907" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0907">임부복</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0908" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0908">유아동 의류/잡화</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0909" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0909">안전용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0910" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0910">기저귀/물티슈</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S0911" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S0911">분유/이유식/간식</a></li>


						</ul></li>
					<li role="presentation" class="dropdown"><a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
							가구/인테리어 <span class="caret"></span>
					</a>
						<ul id="menu3" class="dropdown-menu" role="menu" aria-labelledby="drop6">

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1001" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1001">침실가구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1002" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1002">거실/주방가구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1003" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1003">수납가구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1004" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1004">침구단품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1005" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1005">커튼</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1006" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1006">서재/사무용가구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1007" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1007">DIY자재/용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1008" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1008">침구세트</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1009" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1009">아동/주니어가구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1011" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1011">인테리어소품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1012" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1012">베개/솜류</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1013" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1013">수예</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1014" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1014">카페트/러그</a></li>

						</ul></li>
					<li role="presentation" class="dropdown"><a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
							생활/건강 <span class="caret"></span>
					</a>
						<ul id="menu3" class="dropdown-menu" role="menu" aria-labelledby="drop6">

							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1101" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1101">자동차용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1102" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1102">주방용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1103" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1103">세탁용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1104" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1104">수납/정리용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1105" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1105">생활용품</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1106" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1106">공구</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1107" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1107">애완</a></li>
							<li role="presentation" class="detailcategory"><a role="menuitem" tabindex="-1" id="S1108" href="/views/main/productList.jsp?orderType=updateOrder&amp;category=S1108">식품</a></li>
						</ul></li>
				</ul>
			</form>

		</div>
	</div>
</div>