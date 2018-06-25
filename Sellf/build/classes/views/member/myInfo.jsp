<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" %>
<% Member m = (Member)session.getAttribute("user"); %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
   <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
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

.mpMenuAll {
	position: static;
	padding: inherit;
	border: 3px solid none;
	width: 100%;
	height: 39%;
	text-align:left;
}

.tapBtn {
	margin: 0px;
	border: 1px solid gray;
	width: 100%;
	height: 10%;
}

.tapBtn:hover {
	color: rebeccapurple;
	font-size: 31px;
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
.insertTitle {
	text-align: left;
	width: 80px;
	height:30px;
}
.info {width: 100%; height: 25%; float:right;}
.infoleft {width: 30%; overflow: auto; float: left;}
.inforight {width: 60%;overflow: auto; float: left;}

.phonediv {
	display: block;
	overflow: auto;
}
.phonediv div {
	float: left;
}
.phonediv input{
float:left;
margin:10px;
margin-top:19px;
margin-bottom:1px;
}

.emaildiv {
	overflow: auto;
	display: block;
	margin-bottom: 10px;
}
.emaildiv div {
	float: left;
	display: inline-block;
	margin-right: 10px;
}
.emaildiv input {
	overflow: auto;
	display: block;
	float: left;
	}
.pointdiv {
overflow: auto;
display: block;
margin-top:10px;
margin-bottom: 10px;
}
.pointdiv div {
	float: left;
	display: inline-block;
}


.delivery {width: 100%;height:25%;float:right;}
.deliveryleft {width: 30%; overflow: auto; float: left;}
.deliveryright {width: 60%;overflow: auto;float: left;}

.address1{
display: block;
overflow: auto;
margin-top:20px;
}
.address1 div {
	float: left;
	margin-right:10px;
	display: block;
}
.address2 {
	overflow: auto;
	display: block;
}
.address2 div {
	float: left;
	display: inline-block;
	margin-right: 10px;
}
.address2 input {
	overflow: auto;
	display: block;
	float: left;
}
.address3 {
	overflow: auto;
	display: block;
}
.address3 div {
	float: left;
	display: inline-block;
	margin-right: 10px;
}
.address3 input {
	overflow: auto;
	display: block;
	float: left;
}
.bank {width: 100%; height: 25%; float:right;}
.bankleft {width: 30%; overflow: auto; float: left;}
.bankright {width: 60%;overflow: auto; float: left;}

.bank1{
display: block;
overflow: auto;
}
.bank1 div{
float:left;
}
.bank1 select {
	overflow: auto;
	display: block;
	float: left;
	margin:10px;
}
.bank2{
display: block;
overflow: auto;
margin-top: -34px;
}
.bank2 div{
float:left;
}
.bank2 input {
	overflow: auto;
	display: block;
	float: left;
	margin:10px;
}
.bank3{
display: block;
overflow: auto;
margin-top: -34px;
}
.bank3 div{
float:left;
}
.bank3 input {
	overflow: auto;
	display: block;
	float: left;
	margin:10px;
}


.deleteok {width: 100%;height: 5%;float: right;}
.save {
	width: 100px;
	height: 50px;
	float: right;
	position: relative;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #f39c12;
	background: #e67e22;
	text-align: center;
	padding: 16px 18px 14px;
	margin: 12px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px #d35400;
	-moz-box-shadow: 0px 6px 0px #d35400;
	box-shadow: 0px 6px 0px #d35400;
}

.button-3d:active {
	-webkit-box-shadow: 0px 2px 0px #d35400;
	-moz-box-shadow: 0px 2px 0px #d35400;
	box-shadow: 0px 2px 0px #d35400;
	position: relative;
	top: 4px;
}

.search {
	margin-bottom:10px;
	width: auto;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #7151FC;
	background: #7151FC;
	text-align: center;
	padding: 16px 18px 14px;
	font-size: 15px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}

.search:active {
	-webkit-box-shadow: 0px 2px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: 4px;
}
.point
{

	float:left;
		margin-left:10px;
}
.pointBtn {
	float:right;
	position: relative;
	width: 80px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #7151FC;
	background: #7151FC;
	text-align: center;
	padding: 16px 18px 14px;
	margin-right: 150px;
	font-size: 15px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}
.pointBtn:active {
	-webkit-box-shadow: 0px 1px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: -1px;
}


.button-purple {
	background: #9966cb;
	border-color: #8040be #8040be #733aab;
	background-image: -webkit-linear-gradient(top, #a87dd3, #9966cb 66%, #8f57c6);
	background-image: -moz-linear-gradient(top, #a87dd3, #9966cb 66%, #8f57c6);
	background-image: -o-linear-gradient(top, #a87dd3, #9966cb 66%, #8f57c6);
	background-image: linear-gradient(to bottom, #a87dd3, #9966cb 66%, #8f57c6);
}

.button-purple:active {
	background: #9966cb;
	border-color: #733aab #8040be #8040be;
}

body {
	font: 13px/20px 'Lucida Grande', Verdana, sans-serif;
	color: #404040;
	background: white;
}

.container {
	margin: 50px auto;
	width: 580px;
	text-align: center;
}

.save {
text-align:center;
 	height:60px;
	width:80px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #7151FC;
	background: #7151FC;
	padding: 16px 18px 14px;
	margin: 12px;
	font-size: 20px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}

.save:active {
	-webkit-box-shadow: 0px 2px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: 4px;
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
	font-size: 15px;
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
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: 4px;
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
<!--  <link rel="stylesheet" href="/data/201010/IJ12874238457466/buttons.css"
	type="text/css" media="screen" />-->
</head>
<body align="center">

	<div class="header">헤더</div>
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
		<center>
			<div class="MenuContents">
			<form action="/update" method="post">
				<div class="MenuConTitle">
					<H2>내 정보</H2>
				</div>
				<hr>
				<div class="info">

					<div class="infoleft">
						<H2>기본정보</H2>
					</div>
					<div class="inforight">
						<div class="phonediv">
							<!-- 핸드폰 div start -->
							<div class="insertTitle"
								style="margin-top: 30px; font-size: 20px" name="phone">전화번호</div>
								
							<input type="text" style="width: 300px; height: 40px;"
								style="border:1px solid maroon; background:transparent;" 
								name="userPhone" value="<%=m.getUser_phone()%>">
							
						</div>
						<!-- 핸드폰 div end -->
						<br>
						<div class="emaildiv">
							<!-- 이메일 div start -->
							<div class="insertTitle" style="font-size: 20px">이메일</div>
							<input type="email" style="width: 300px; height: 40px;"
								style="border:1px solid maroon;background:transparent;" 
								name="email" placeholder="이메일을 입력하세요" value="<%=m.getUser_email()%>">
							<input type="hidden" value="<%=m.getUser_id() %>" name="userId">
							
						</div>
						
					
						<div class="pointdiv">
						<div class="insertTitle" style="font-size: 20px">포인트</div>
						
						<input type="text" style="width: 220px; height: 40px;"
								style="border:1px solid maroon;background:transparent;" 
								name="point" readonly class="point" value="<%=m.getUser_epoint()%> 원">
						<input type="button" value="충전" class="pointBtn"> 
						</div>
						
						
						
						<!-- 이메일 div end -->
					</div>
				</div>
				<hr>
				<div class="delivery">
					<div class="deliveryleft">
					<H2>배송정보</H2>
					</div>
					<div class="deliveryright">
						<!-- 주소1번째 -->
						<div class="address1">
								<div class="insertTitle"
								style="margin-top: 10px; font-size: 20px">주소</div>
								<div>
								<input autocomplete="off" class="postcodify_postcode5" id="user_address"
								ng-keypress="keypress($event)" ng-model="addressKeyword"
								placeholder="읍, 면, 동으로 검색해주세요." type="text"
								style="width: 300px; height: 40px;"
								style="border:1px solid maroon; background:transparent;" name="postNum" id="postNum">
								</div>
								
								
							<div><button type="button" id="postcodify_search_button" class="search">검색</button></div>
						</div>
						<!-- 주소2번째 -->
						<div class="address2">
								<div class="insertTitle"
								style="margin-top: 30px; font-size: 20px"> </div>
								<div>								
							<input class="postcodify_address" ng-model="profile.addr1"
								placeholder="주소검색을 이용해주세요" readonly="readonly"
								style="width: 300px; height: 40px;"
								style="border:1px solid maroon; background:transparent;" name="addrInfo">
						</div>
						</div>
						<!-- 주소3번째 -->
						<div class="address3">
								<div class="insertTitle"
								style="margin-top: 20px; font-size: 20px"> </div>
								<div>
							<input class="postcodify_details" id="user-addr2" ng-model="profile.addr2"
								style="width: 300px; height: 40px;" value="<%=m.getUser_addr() %>"
								style="border:1px solid maroon; background:transparent;" name="addrDetail">
						</div>
					</div>
				</div>
				</div>
				<hr>
				<div class="bank">

					<div class="bankleft">
						<H2>관심분야</H2>
					</div>
					<div class="bankright">
						<tr class="regi-tr" name="interest">
					<td>
					<table>
					<tr>
						<td><input type="checkbox" name="userInter" value="전자제품"> 전자제품</td>
						<td><input type="checkbox" name="userInter" value="패션의류"> 패션의류</td>
						<td><input type="checkbox" name="userInter" value="패션잡화"> 패션잡화</td>
						<td><input type="checkbox" name="userInter" value="화장품/미용"> 화장품/미용</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userInter" value="스포츠/레저"> 스포츠/레저</td>
						<td><input type="checkbox" name="userInter" value="유아동/출산"> 유아동/출산</td>
						<td><input type="checkbox" name="userInter" value="완구/문구/취미"> 완구/문구/취미</td>
						<td><input type="checkbox" name="userInter" value="해외 명품/ 자동차"> 해외 명품/ 자동차</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userInter" value="도서/음반/DVD"> 도서/음반/DVD</td>
						<td><input type="checkbox" name="userInter" value="가구/인테리어"> 가구/인테리어</td>
						<td><input type="checkbox" name="userInter" value="여행/문화"> 여행/문화</td>
						<td><input type="checkbox" name="userInter" value="생활/건강"> 생활/건강</td>
					</tr>
						</table></td>
				</tr>
					</div>
				
				</div>
				<div class="deleteok">
				
				
				<input type="submit" id="delBtn" value="회원탈퇴" class="delete" onclick="return deletecheck();" />
				
					<div>
						<div><button  type="submit" id="save" class="save">확인</button></div>
						
					</div>
					</div>
		</form>
	</div>

	</center>
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



   <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script> <!-- 주소 검색 -->
   <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script> <!-- 주소 api -->
   <script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>
<script>
var swi = false;
function deletecheck(){
	if(swi==false){
		var result = window.confirm("계정을 삭제하면 개인 정보 및 거래 내역이 모두 삭제됩니다.             그래도 계정을 삭제하시겠습니까?                                              전화번호 또는 이메일을 변경하고 싶다면 기본정보에서                   변경할 수 있습니다.");
		if(result){
			location.href="/delete";
		}else{
		alert('취소했어양!! ^ㅅ^');
		}
	}else{
	return true;
}
	return false;
}
</script>

	</center>
	<div class="footer">푸터</div>
</body>
</html>