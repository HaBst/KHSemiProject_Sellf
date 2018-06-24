<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" 
		 import="java.util.ArrayList"
		 import="product.model.vo.*"%>
<% Member m = (Member)session.getAttribute("user"); %> 
<% ArrayList<Product> list2 = (ArrayList<Product>)request.getAttribute("product"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매내역</title>
<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="../../CSS/bootstrap/bootstrap.min.css?ver=1" />
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css" />
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<!-- 헤더 끝 -->
<style>
body {
	 font-family: 'Sunflower';
}
.contents {
	position: relative;
	border: 3px solid white;
	width: 1300px;
	height: 800px;
}
    .mpMenuItems{border: 1px solid white;
    float: left;
    width: auto;
    height: 100%;
    }
    .mpMenuAll{border: 1px solid #F2F2F2;
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
	float:left;
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
.container > .button {
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
  -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 0 0 1px rgba(255, 255, 255, 0.08), 0 1px 2px rgba(0, 0, 0, 0.25);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 0 0 1px rgba(255, 255, 255, 0.08), 0 1px 2px rgba(0, 0, 0, 0.25);
}
.button:before {
  content: '';
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  pointer-events: none;
  background-image: -webkit-radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08), rgba(255, 255, 255, 0));
  background-image: -moz-radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08), rgba(255, 255, 255, 0));
  background-image: -o-radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08), rgba(255, 255, 255, 0));
  background-image: radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08), rgba(255, 255, 255, 0));
}
.button:hover:before {
  background-image: -webkit-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18), rgba(255, 255, 255, 0.03));
  background-image: -moz-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18), rgba(255, 255, 255, 0.03));
  background-image: -o-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18), rgba(255, 255, 255, 0.03));
  background-image: radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18), rgba(255, 255, 255, 0.03));
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
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	border-top: 1px solid #C1DAD7;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-align: left;
	padding: 6px 6px 6px 12px;
	background: #F2F2F2 url(/data/201011/IJ12896448126037/bg_header.jpg) no-repeat;
}

th.nobg {
	border-top: 0;
	border-left: 0;
	border-right: 1px solid #C1DAD7;
	background: none;
}

td {
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	background: #fff;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
}


td.alt {
	background: #F5FAFA;
	color: #797268;
}

th.spec {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #fff url(/data/201011/IJ12896448126037/bullet1.gif) no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

th.specalt {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #f5fafa url(/data/201011/IJ12896448126037/bullet2.gif) no-repeat;
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
  background-color: #9B9BA7;
  color: #FFFFFF;
  font-size: 24px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0 rgba(0, 0, 0, 0.22);
  cursor: pointer;
}
.menu-button:hover {
  background: #d81557;
  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.28), 0 4px 15px 0 rgba(0, 0, 0, 0.25);
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
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0 rgba(0, 0, 0, 0.22);
  cursor: pointer;
}
.menu-button a:hover {
  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.28), 0 4px 15px 0 rgba(0, 0, 0, 0.25);
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
<body align ="center">


	<div class="header"><%@include file="../../views/common/header.jsp"%></div>	
<center>
        <div class="contents">
            <div class="mpMenuItems">
                      <div class="mpMenuTitle"><h1>My Page</h1></div>

                 <ul class="mpMenuAll" role="tablist" style="none">
					<li role="presentation" class="active" id="selfb"><a href="/self">판매내역</a></li>
					<li role="presentation" class="active" id="buyb"><a href="/buy">구매내역</a></li>
					<li role="presentation" class="active" id="jjimb"><a href="/jjim">찜한 상품</a></li>
					<li role="presentation" class="active" id="coub"><a href="/views/member/myCoupon.jsp">내 쿠폰</a></li>
					<li role="presentation" class="active" id="infob"><a href="/views/member/myInfoQuiz.jsp">내 정보</a></li>
					<li role="presentation" class="active"><a href="/Grade">등급보기</a></li>
				</ul>
            </div>

            <div class="MenuContents">
                 <div class="MenuConTitle"><H2>구매 내역</H2>
                </div> <hr>
                <div class="MenuCon">  <div class="table-users" style="overflow:auto; width:800px; height:550px;">


<center>
<%if(list2!=null){ %>
<table>
  				<tr>
					<th style="width: 40%">상품사진</th>
					<th style="width: 20%">상품내용</th>
					<th style="width: 20%">가격</th>
					<th style="width: 20%">수량</th>
				</tr>
				</thead>
				<%for (Product p : list2){%>
				<tbody>
				<tr>
					<td><div class="row"><div class="col-sm-2 hidden-xs">
					<img src="<%=p.getProduct_image()%>" alt="..." class="img-responsive" /></div>
					</div>
					</td>
					<td><h4 class="nomargin"><%=p.getProduct_name() %></h4>
					<h5>    <% String state = p.getProduct_state(); %>
       		 <%if(state.equals("S")){%>
         	  <h4  style="color: blue">판매중</h4>
         	 <%}else if(state.equals("T")) {%>
         	  <h4  style="color: orange">거래중</h4>
         	 <%}else if(state.equals("E")) {%>
         	  <h4  style="color: red">판매완료</h4>
         	 <%} %></h5></td>
					<td><%=p.getProduct_price()%></td>
					<td>
					<input type="" value="<%=p.getProduct_amount()%>"></td>
			
					</tr>
					</tbody><%}%>
					</table>
					</center>
						<%} else {%>
						<div>살까말까 고민되는 물건을 찜해보세요!</div>
						<%}%>
					</div>
				</div>
			</div>
  <div class="menu-button">
				<i class="Qbtn"></i> <a href="/views/manager/managerChat.html"
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
<div class="footer"><center><%@include file="../../views/common/footer.jsp"%></center> </div>
</body>

</html>