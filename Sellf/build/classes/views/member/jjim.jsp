<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="member.model.vo.*" import="java.util.ArrayList"%>
<% Member m = (Member)session.getAttribute("user"); %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>찜한 상품</title>
<style>
body {
	font: 13px/20px 'Lucida Grande', Verdana, sans-serif;
	color: #404040;
	background: white;
}
div{background-color: white;}
    
.header{border:3px solid white;
       background-color: #7151FC;
        width: auto;
        height: 100px;}
.contents {
	position: relative;
	border: 3px solid white;
	width: 1300px;
	height: 800px;
}
    .footer{border:3px solid white;
    background-color: #7151FC;
    width: auto;
    height: 120px;
    }
    .mpMenuItems{border: 1px solid white;
    float: left;
    width: auto;
    height: 100%;
    }
    
    
    .mpMenuAll{border: 1px solid #F2F2F2;
    margin-bottom:10px;
	list-style-type:none;
	font: 15px/40px 'Lucida Grande', Verdana, sans-serif;	
    }
    ul.mpMenuAll li{
	margin:0;padding:0;border-top:1px solid #F2F2F2;
	border-bottom:1px solid white;
}
ul.mpMenuAll li a{
	display:block;text-decoration:none;color:black;
	background:white;padding:5px 0 5px 20px;width:140px;
}
ul.mpMenuAll li a:hover{
	background:#F2F2F2 url("http://www.blueb.co.kr/data/201010/IJ12872476173279/vert-one_arrow.gif") no-repeat 0 9px;
	color:#7151FC;
}

ul.mpMenuItems li a.current,ul.vert-one li a.current:hover{
background:black url("http://www.blueb.co.kr/data/201010/IJ12872476173279/vert-one_arrow.gif") no-repeat 0 9px;}
.mpMenuTitle {
	width: auto;
	margin-top:55px;
	height: 5%;
	animation: background 1s linear infinite;
	background: linear-gradient(90deg, rgba(150, 48, 30, 1) 0%,
		rgba(199, 201, 88, 1) 10%, rgba(28, 147, 46, 1) 20%,
		rgba(74, 165, 168, 1) 30%, rgba(89, 90, 165, 1) 40%,
		rgba(84, 16, 67, 1) 50%, rgba(28, 58, 63, 1) 60%,
		rgba(82, 175, 183, 1) 70%, rgba(78, 170, 76, 1) 80%,
		rgba(150, 48, 30, 1) 90%, rgba(199, 201, 88, 1) 100%);
	background-size: 1000% 100%;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
    .mpMenuAll
    {
        position: static;
        padding: inherit;
        border:3px solid none;
        width: 100%;
        height: 39%; 
        text-align: justify;
    }  
    .MenuContents
    {
        position: static;
        width: 70%;
        height: 100%;
        float:inherit;
    }
    .MenuConTitle
    {
    	margin-top:30px;
        width:100%;
        height: 10%;
        float: left;
 		text-align: justify;
    }
    .MenuCon
    {
        width: 100%;
        height: 80%;
        float: inherit;
    }
.delete {
	float: left;
	position: relative;
	width: 100px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #7151FC;
	background: #7151FC;
	text-align: center;
	padding: 16px 18px 14px;
	margin: 12px;
	font-size: 25px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}

.delete:active {
	-webkit-box-shadow: 0px 2px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 2px 0px rebeccapurple;
	position: relative;
	top: 4px;
}

.container {
	margin: 50px auto;
	width: 580px;
	text-align: center;
}

.container>.button {
	margin: 12px;
}

.button {
	position: relative;
	display: inline-block;
	vertical-align: top;
	height: 36px;
	line-height: 35px;
	padding: 0 20px;
	font-size: 13px;
	color: white;
	text-align: center;
	text-decoration: none;
	text-shadow: 0 -1px rgba(0, 0, 0, 0.4);
	background-clip: padding-box;
	border: 1px solid;
	border-radius: 2px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 0 0
		1px rgba(255, 255, 255, 0.08), 0 1px 2px rgba(0, 0, 0, 0.25);
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 0 0 1px
		rgba(255, 255, 255, 0.08), 0 1px 2px rgba(0, 0, 0, 0.25);
}

.button:before {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	pointer-events: none;
	background-image: -webkit-radial-gradient(center top, farthest-corner, rgba(255, 255, 255,
		0.08), rgba(255, 255, 255, 0));
	background-image: -moz-radial-gradient(center top, farthest-corner, rgba(255, 255, 255,
		0.08), rgba(255, 255, 255, 0));
	background-image: -o-radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08
		), rgba(255, 255, 255, 0));
	background-image: radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08),
		rgba(255, 255, 255, 0));
}

.button:hover:before {
	background-image: -webkit-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
	background-image: -moz-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
	background-image: -o-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
	background-image: radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
}

.button:active {
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2);
}

.button:active:before {
	content: none;
}

#mytable {
	width: 700px;
	padding: 0;
	margin: 0;
}

caption {
	padding: 0 0 5px 0;
	width: 700px;
	font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	text-align: right;
}

th {
	font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #4f6b72;
	border-right: 1px solid #F2F2F2;
	border-bottom: 1px solid #F2F2F2;
	border-top: 1px solid #F2F2F2;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-align: left;
	padding: 6px 6px 6px 12px;
	background: #F2F2F2 url(/data/201011/IJ12896448126037/bg_header.jpg)
		no-repeat;
	background: #F2F2F2 url(/data/201011/IJ12896448126037/bg_header.jpg)
		no-repeat;
}

th.nobg {
	border-top: 0;
	border-left: 0;
	border-right: 1px solid #C1DAD7;
	background: none;
}

td {
	border-right: 1px solid #F2F2F2;
	border-bottom: 1px solid #F2F2F2;
	background: #fff;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
}

td.alt {
	background: #F2F2F2;
	color: #F2F2F2;
}

th.spec {
	border-left: 1px solid #F2F2F2;
	border-top: 0;
	background: #fff url(/data/201011/IJ12896448126037/bullet1.gif)
		no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

th.specalt {
	border-left: 1px solid #F2F2F2;
	border-top: 0;
	background: #f5fafa url(/data/201011/IJ12896448126037/bullet2.gif)
		no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #797268;
}

.menu-button {
	-webkit-transition: 0.4s;
	-moz-transition: 0.4s;
	transition: 0.4s;
	position: absolute;
	right: 30px;
	bottom: 30px;
	width: 60px;
	height: 60px;
	text-align: center;
	line-height: 60px;
	border-radius: 50%;
	background-color: #7151FC;
	color: #FFFFFF;
	font-size: 24px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0
		rgba(0, 0, 0, 0.22);
	cursor: pointer;
}

.menu-button:hover {
	background: #d81557;
	box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.28), 0 4px 15px 0
		rgba(0, 0, 0, 0.25);
}

.menu-button a {
	-webkit-transition: 0.4s;
	-moz-transition: 0.4s;
	transition: 0.4s;
	opacity: 0;
	width: 0px;
	height: 0px;
	text-align: center;
	line-height: 50px;
	border-radius: 50%;
	color: #FFFFFF;
	font-size: 24px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0
		rgba(0, 0, 0, 0.22);
	cursor: pointer;
}

.menu-button a:hover {
	box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.28), 0 4px 15px 0
		rgba(0, 0, 0, 0.25);
}

.menu-button a:nth-child(2) {
	-webkit-transition-delay: 0.3s;
	-moz-transition-delay: 0.3s;
	transition-delay: 0.3s;
	position: absolute;
	right: 30px;
	bottom: 30px;
	background: #55acee;
}

.menu-button a:nth-child(3) {
	-webkit-transition-delay: 0.4s;
	-moz-transition-delay: 0.4s;
	transition-delay: 0.4s;
	position: absolute;
	right: 30px;
	bottom: 30px;
	background: #dc4e41;
}

.menu-button a:nth-child(4) {
	-webkit-transition-delay: 0.5s;
	-moz-transition-delay: 0.5s;
	transition-delay: 0.5s;
	position: absolute;
	right: 30px;
	bottom: 30px;
	background: yellow;
}

.menu-button:hover a {
	opacity: 1;
	width: 50px;
	height: 50px;
}

.menu-button:hover a:nth-child(2) {
	right: 80px;
	bottom: 0px;
}

.menu-button:hover a:nth-child(2):hover {
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	transition-delay: 0s;
	background: #3ea1ec;
}

.menu-button:hover a:nth-child(3) {
	right: 65px;
	bottom: 65px;
}

.menu-button:hover a:nth-child(3):hover {
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	transition-delay: 0s;
	background: #d83a2b;
}

.menu-button:hover a:nth-child(4) {
	right: 0px;
	bottom: 80px;
}

.menu-button:hover a:nth-child(4):hover {
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	transition-delay: 0s;
	background: yellow;
}
</style>
</head>

<body align="center">

	<div class="header">헤더</div>
	<center>
		<div class="contents">
			<div class="mpMenuItems">
				<div class="mpMenuTitle">
					<h1>My Page</h1>
				</div>
				<div></div>
				<ul class="mpMenuAll" role="tablist" style="">
					<li role="presentation" class="active"><a
						href="/views/member/mySelf.jsp">판매내역</a></li>
					<li role="presentation" class="active"><a
						href="/views/member/myBuy.jsp">구매내역</a></li>
					<li role="presentation" class="active"><a
						href="/views/member/jjim.jsp">찜한 상품</a></li>
					<li role="presentation" class="active"><a
						href="/views/member/myCoupon.jsp">내 쿠폰</a></li>
					<li role="presentation" class="active"><a
						href="/views/member/myInfoQuiz.jsp">내 정보</a></li>
										<li role="presentation" class="active"><a href="/views/member/myGrade.jsp">등급보기</a></li>
				</ul>
			</div>
			<div class="MenuContents">
				<div class="MenuConTitle">
					<H2>찜한 상품</H2>
				</div>
				<hr>
				<div class="MenuCon">
					<div class="table-users">
						<%
							ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("userList");
						%>
						<center>
							<%
								if (list != null) {
							%>
							<table id="cart" class="table table-hover table-condensed">
								<thead>
									<tr>
										<th style="width: 50%">찜한 상품</th>
										<th style="width: 10%">가격</th>
										<th style="width: 8%">수량</th>
										<th style="width: 22%" class="text-center">총 가격</th>
										<th style="width: 10%">삭제</th>
									</tr>

								</thead>
								<%
									for (Member m : list) {
								%>
								<tbody>
									<tr>
										<td data-th="Product">
											<div class="row">
												<div class="col-sm-2 hidden-xs">
													<img src="http://placehold.it/100x100" alt="..."
														class="img-responsive" />
												</div>
												<div class="col-sm-10">
													<h4 class="nomargin">주ㅡㅡㅡ멘</h4>
													<p>주멘은 대한민국 원탑 공격수입니다 ^ㅅ^</p>
												</div>
											</div>
										</td>
										<td data-th="Price" id="Price">1000원</td>
										<td data-th="Quantity"><input type="number"
											class="form-control text-center" value="1"></td>
										<td data-th="Subtotal" class="text-center">몰라.. ㅠ_ㅠ</td>
										<td class="actions" data-th="">

											<button class="delete" onclick="jjimdelete();">삭제
											</button>
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td><a href="#" class="btn btn-warning"><i
												class="fa fa-angle-left"></i>Shopping</a></td>
										<td colspan="2" class="hidden-xs"></td>
										<td class="hidden-xs text-center"><strong>총합 :
												102313원</strong></td>
										<td><a href="#" class="btn btn-success btn-block">장바구니에
												추가 <i class="fa fa-angle-right"></i>
										</a></td>
									</tr>
								</tfoot>
								<%
									}
								%>
							</table>
						</center>
						<%
							} else {
						%>
						<div>살까말까 고민되는 물건을 찜해보세요!</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="menu-button">
				<i class="Qbtn"></i> <a href="/views/member/myCart.jsp"
					style="background-image: url(/../../img/messageQbtn.png)"> <i
					class="messageQbtn"></i>
				</a> <a href="/index.jsp"
					style="background-image: url(/../../img/homeQbtn.png)"> <i
					class="homeQbtn"> </i>
				</a> <a href="/views/member/myCart3.jsp"
					style="background-image: url(/../../img/sayQbtn.png)"> <i
					class="sayQbtn"> </i>
				</a>
			</div>
		</div>
	</center>
	<div class="footer">푸터</div>
</body>
</html>