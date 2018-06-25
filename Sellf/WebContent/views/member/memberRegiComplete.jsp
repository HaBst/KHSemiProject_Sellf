<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
.header {
	background-color: darkorange;
	height: 60px;
}

.container {
	width:1000px;
	margin-left: auto;
	margin-right: auto;
	overflow: auto;
}

.footer {
	background-color: darkorange;
	height: 60px;
}

.
.sign-up {
	display: block;
	margin-top: 30px;
	margin-bottom: 30px;
}

.sign-up>ul {
	padding: 0px;
	margin-bottom: 30px;
}

.sign-up>ul li {
	text-align: center;
	margin: 0 2px;
	display: inline-block;
	width: 24%;
	border-bottom: 3px solid gray;
}

.sign-up>ul li h3 {
	font-weight: 600;
	color: gray;
}

.sign-up>h4 {
	font-weight: 600;
	margin-top: 0px;
	margin-bottom: 20px;
}

.sign-up li.active {
	border-bottom: 3px solid RGBA(216,85,161,1);
}

.sign-up li.active h3 {
	color: RGBA(216,85,161,1);
}

.sign-up li.active h3 small {
	color: RGBA(216,85,161,1);
}

.sign-up-title {
	display: inline-block;
	font-size: 18px;
	text-align: center;
	width: 100%;
	margin-top: 50px;
	position: relative;
}

.sign-up-title>p {
	font-size: 14px;
	color: gray;
}
.regiComplete {
	display: block;
	margin-top:50px;
	margin-bottom:50px;
	padding-top:50px;
	height : 400px;
	border: 2px solid gray;
}
.regiComplete h2
{
	margin-top:0px;
	text-align: center;
	font-weight: 600;
	color: black;
}
#logo {
	margin:0 auto;
	max-width: 250px;
	height: auto;
	display: block;
}
.regiBtn
{
	margin-top: 50px;
}
</style>
<meta charset="UTF-8">
<title>Sell:F 회원가입 완료</title>
<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">	
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">	
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
	<script type="text/javascript" src="../../JS/common/adv.js"></script>
	<header id="header"> <%@include
				file="/views/common/header.jsp"%> </header><br>
	<div class="container">
		<div class="sign-up-title">
			회원가입
			<p>회원이 되셔서 다양한 혜택을 누려보세요.
		</div>
		<div class="sign-up">
			<ul>
				<li><h3>
						STEP1 <small>가입방법 선택</small>
					</h3></li>
				<li><h3>
						STEP2 <small>이용약관 동의</small>
					</h3></li>
				<li><h3>
						STEP3 <small>회원정보 입력</small>
					</h3></li>
				<li class="active"><h3>
						STEP4 <small>회원가입 완료</small>
					</h3></li>
			</ul>
		</div>
		<div class="regiComplete">
		<img alt="" src="/img/logo.png" id="logo">
		<h2>회원가입이 완료 되었습니다.</h2>
		<div class="regiBtn" align="center">
			<button onclick="login()" class="btn btn-primary btn-lg"
				style="background-color: RGBA(216,85,161,1); border-radius: 0px; width: 150px">로그인</button>&nbsp
			<a href="/index.jsp" class="btn btn-default btn-lg "
				style="background-color: lightgray; border-radius: 0px; width: 150px">메인화면</a>
		</div>
		</div>
		<!-- footer -->
		<div align="center">
		<footer>
			<%@include file="../../views/common/footer.jsp" %>
		</footer>
		</div>
	</div>
	<script>
		function login() {
			location.href="/views/member/memberLogin.jsp";
		}
	</script>
</body>
</html>