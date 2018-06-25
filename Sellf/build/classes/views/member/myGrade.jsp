<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<%@ page import="member.model.vo.*"%>
<% Member m = (Member)session.getAttribute("user"); %>  
<%Grade g = (Grade)request.getAttribute("userGrade"); %>
<%String grade = g.getUser_grade_name();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원등급</title>
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
    .mpMenuAll
    {
        position: static;
        padding: inherit;
        border:3px solid none;
        width: 100%;
        height: 39%; 
        text-align:left;
    }  
    
    
    .tapBtn
    {
        margin: 0px;
        border: 1px solid gray;
        width: 100%;
        height: 10%;
    }
    .tapBtn:hover{
       /* border:2px solid white;*/
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
    .MenuCon
    {
        width: 100%;
        height: 80%;
        float: inherit;
    }
    .app
    {
        width: 100%;
        height: 50%;

    }
    .mail
     {
        width: 100%;
        height: 50%;
     }
    .appleft
    {
        float: left;
        height: 50%;
        font-size: 20px;
    }
     .mailleft
    {
        float: left;
        height: 50%;
        font-size: 20px;
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
    <style>
body {
  font-family: "Squada One",sans-serif;
  background: #000e12;
  color: #daf6ff;
}

.bluelight {
  display: table;
  width: 200px;
  height: 200px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.bluelight a {
  display: table-cell;
  font-size: 3em;
  text-decoration: none;
  text-align: center;
  vertical-align: middle;
  border-radius: 50%;
  transition: background 1s, border-width 0.5s cubic-bezier(0.075, 0.82, 0.165, 1), text-shadow 0.5s;
  color: #daf6ff;
  text-shadow: 0 0 20px #0aafe6, 0 0 20px rgba(10, 175, 230, 0);
  box-shadow: 0 0 0 rgba(10, 175, 230, 0), inset 0 0 0 rgba(10, 175, 230, 0);
  background-image: radial-gradient(ellipse cover at center, rgba(10, 175, 230, 0) 0%, rgba(10, 175, 230, 0) 90%);
  border: 0 dotted rgba(10, 175, 230, 0);
}
.bluelight a:hover {
  color: #fff;
  text-shadow: 0 0 50px #0aafe6, 0 0 50px #0aafe6;
  background-image: radial-gradient(ellipse cover at center, rgba(10, 175, 230, 0.3) 0%, rgba(10, 175, 230, 0) 60%);
}
.bluelight:before, .bluelight:after, .bluelight a:before, .bluelight a:after {
  transition: 0.2s ease-in-out;
  content: "";
  display: block;
  position: absolute;
  border-radius: 50%;
  border: 60px dashed transparent;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.bluelight:before {
  animation: rotate 20s linear 0s infinite;
  width: 180%;
  height: 180%;
  border: 3px dotted rgba(10, 175, 230, 0);
  z-index: -1;
}
.bluelight:after {
  animation: rotate 10s linear 0s infinite reverse;
  border: 80px dashed rgba(10, 175, 230, 0);
  width: 160%;
  height: 160%;
  z-index: -2;
}
.bluelight a:before {
  animation: rotate 5s ease-in-out 0s infinite alternate;
  width: 120%;
  height: 120%;
  border: 50px dashed rgba(10, 175, 230, 0);
}
.bluelight a:after {
  animation: rotate 5s linear 0s infinite;
  border: 18px dashed rgba(10, 175, 230, 0);
  width: 120%;
  height: 120%;
}
.bluelight:hover:before {
  border-color: rgba(10, 175, 230, 0.3);
}
.bluelight:hover:after {
  border-color: rgba(10, 175, 230, 0.1);
}
.bluelight:hover a:before {
  border-color: rgba(10, 175, 230, 0.3);
}
.bluelight:hover a:after {
  border-color: rgba(10, 175, 230, 0.3);
}
.menu-item,
.menu-open-button {
   background: #EEEEEE;
   border-radius: 100%;
   width: 80px;
   height: 80px;
   margin-left: -40px;
   position: absolute;
   color: #FFFFFF;
   text-align: center;
   line-height: 80px;
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
   -webkit-transition: -webkit-transform ease-out 200ms;
   transition: -webkit-transform ease-out 200ms;
   transition: transform ease-out 200ms;
   transition: transform ease-out 200ms, -webkit-transform ease-out 200ms;
}

.menu-open {
   display: none;
}

.lines {
   width: 25px;
   height: 3px;
   background: #596778;
   display: block;
   position: absolute;
   top: 50%;
   left: 50%;
   margin-left: -12.5px;
   margin-top: -1.5px;
   -webkit-transition: -webkit-transform 200ms;
   transition: -webkit-transform 200ms;
   transition: transform 200ms;
   transition: transform 200ms, -webkit-transform 200ms;
}

.line-1 {
   -webkit-transform: translate3d(0, -8px, 0);
   transform: translate3d(0, -8px, 0);
}

.line-2 {
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
}

.line-3 {
   -webkit-transform: translate3d(0, 8px, 0);
   transform: translate3d(0, 8px, 0);
}

.menu-open:checked + .menu-open-button .line-1 {
   -webkit-transform: translate3d(0, 0, 0) rotate(45deg);
   transform: translate3d(0, 0, 0) rotate(45deg);
}

.menu-open:checked + .menu-open-button .line-2 {
   -webkit-transform: translate3d(0, 0, 0) scale(0.1, 1);
   transform: translate3d(0, 0, 0) scale(0.1, 1);
}

.menu-open:checked + .menu-open-button .line-3 {
   -webkit-transform: translate3d(0, 0, 0) rotate(-45deg);
   transform: translate3d(0, 0, 0) rotate(-45deg);
}

.menu {
   margin: auto;
   position: absolute;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
   text-align: right;
   box-sizing: border-box;
   margin-bottom: 30px;
   font-size: 26px;
}

.menu-item:hover {
   background: #EEEEEE;
   color: #3290B1;
}

.menu-item:nth-child(3) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(4) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(5) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(6) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(7) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(8) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(9) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-open-button {
   z-index: 2;
   -webkit-transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
   transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
   -webkit-transition-duration: 400ms;
   transition-duration: 400ms;
   -webkit-transform: scale(1.1, 1.1) translate3d(0, 0, 0);
   transform: scale(1.1, 1.1) translate3d(0, 0, 0);
   cursor: pointer;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
}

.menu-open-button:hover {
   -webkit-transform: scale(1.2, 1.2) translate3d(0, 0, 0);
   transform: scale(1.2, 1.2) translate3d(0, 0, 0);
}

.menu-open:checked + .menu-open-button {
   -webkit-transition-timing-function: linear;
   transition-timing-function: linear;
   -webkit-transition-duration: 200ms;
   transition-duration: 200ms;
   -webkit-transform: scale(0.8, 0.8) translate3d(0, 0, 0);
   transform: scale(0.8, 0.8) translate3d(0, 0, 0);
}

.menu-open:checked ~ .menu-item {
   -webkit-transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
   transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
}

.menu-open:checked ~ .menu-item:nth-child(3) {
   transition-duration: 180ms;
   -webkit-transition-duration: 180ms;
   -webkit-transform: translate3d(0.08361px, -104.99997px, 0);
   transform: translate3d(0.08361px, -104.99997px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(4) {
   transition-duration: 280ms;
   -webkit-transition-duration: 280ms;
   -webkit-transform: translate3d(90.9466px, -52.47586px, 0);
   transform: translate3d(90.9466px, -52.47586px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(5) {
   transition-duration: 380ms;
   -webkit-transition-duration: 380ms;
   -webkit-transform: translate3d(90.9466px, 52.47586px, 0);
   transform: translate3d(90.9466px, 52.47586px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(6) {
   transition-duration: 480ms;
   -webkit-transition-duration: 480ms;
   -webkit-transform: translate3d(0.08361px, 104.99997px, 0);
   transform: translate3d(0.08361px, 104.99997px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(7) {
   transition-duration: 580ms;
   -webkit-transition-duration: 580ms;
   -webkit-transform: translate3d(-90.86291px, 52.62064px, 0);
   transform: translate3d(-90.86291px, 52.62064px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(8) {
   transition-duration: 680ms;
   -webkit-transition-duration: 680ms;
   -webkit-transform: translate3d(-91.03006px, -52.33095px, 0);
   transform: translate3d(-91.03006px, -52.33095px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(9) {
   transition-duration: 780ms;
   -webkit-transition-duration: 780ms;
   -webkit-transform: translate3d(-0.25084px, -104.9997px, 0);
   transform: translate3d(-0.25084px, -104.9997px, 0);
}

.blue {
   background-color: #669AE1;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.blue:hover {
   color: #669AE1;
   text-shadow: none;
}

.green {
   background-color: #70CC72;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.green:hover {
   color: #70CC72;
   text-shadow: none;
}

.red {
   background-color: #FE4365;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.red:hover {
   color: #FE4365;
   text-shadow: none;
}

.purple {
   background-color: #C49CDE;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.purple:hover {
   color: #C49CDE;
   text-shadow: none;
}

.orange {
   background-color: #FC913A;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.orange:hover {
   color: #FC913A;
   text-shadow: none;
}

.lightblue {
   background-color: #62C2E4;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.lightblue:hover {
   color: #62C2E4;
   text-shadow: none;
}

@keyframes rotate {
  0% {
    transform: translate(-50%, -50%) rotate(0deg);
  }
  100% {
    transform: translate(-50%, -50%) rotate(360deg);
  }
}
p.caption {
  font-size: 0.7em;
  text-align: center;
  position: fixed;
  width: 100%;
  bottom: 0;
  letter-spacing: 0.2em;
  text-shadow: 0 0 20px #0aafe6, 0 0 20px rgba(10, 175, 230, 0);
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
</head>
<body align ="center">

<div class="header">헤더</div>
<center>
        <div class="contents">
            <div class="mpMenuItems">
               <div class="mpMenuTitle">
               <h1>My Page</h1>
               </div>
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
                 <div class="MenuConTitle"><H2>회원등급</H2></div><hr>
       		<div class="bluelight">
       		<%if(grade.equals("Bronze")){%>
       		<a href="/index.jsp">브론즈 <img alt="" src="/../../img/bronze.png"></a>;
       		<%}else if(grade.equals("Silver")){%>
       		<a href="/index.jsp">실버<img alt="" src="/../../img/silver.png"></a>;
       		<%}else if(grade.equals("Gold")){%>
			<a href="/index.jsp">골드<img alt="" src="/../../img/gold.png"></a>;
			<%}else if(grade.equals("Diamond")){%>
       		<a href="/index.jsp">다이아<img alt="" src="/../../img/diamond.png"></a>;
       		<%}else{%>
       		<a href="/index.jsp">블랙<img alt="" src="/../../img/banned.png"></a>;
       		<%} %>
			</div>

				<h2> 회원님의 수수료 : 
				<%=g.getUser_grade_fees() %> %</h2>

				
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
      </center>
      
<div class="footer">푸터</div>
</body>

</html>