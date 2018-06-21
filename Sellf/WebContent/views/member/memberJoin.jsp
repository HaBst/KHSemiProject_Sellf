<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<!-- Coded by JSB -->
<html>
<head>
<style>
.header
{
	background-color:darkorange;
	height: 60px;
}
.container {
	width:1000px;
	overflow:auto;
	margin-left: auto;
	margin-right: auto;
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
	color : gray;
}

.sign-up>h4 {
	font-weight: 600;
	margin-top: 0px;
	margin-bottom: 20px;
}
.sign-up li.active {
	border-bottom: 3px solid black;
}
.sign-up li.active h3{
	color:black;
}

.sign-up li.active h3 small{
	color:black;
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



.normal-sign-up {
	border-top: 2px solid black;
	display: block;
	text-align: center;
	padding-bottom: 20px;
}

.normal-sign-up h4 {
	margin-top: 30px;
	display: inline-block;
	width: 300px;
	font-weight: 600;
}

.normal-sign-up h4>span {
	margin-right: 30px;
}

.sns-sign-up {
	border-top: 1px solid gray;
	display: block;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 200px;
}

.sns-sign-up>h4 {
	font-weight: 600;
}

.sns-list {
	display: block;
	padding-left: 0px;
}

.sns-list li {
	display: inline-block;
	width: 200px;
	padding: 0px;
}

.etc {
	border-top: 1px solid gray;
	display: block;
	text-align: center;
	padding-top: 20px;
}
.snsBtn {
	border: 0px;
	background-color: white;
}

html,body{
	font-family: 'Sunflower', sans-serif;
}
#wrapper {
	font-family: 'Sunflower', sans-serif;
	background-color: white;
}

@media ( max-width :400px) {
	#wrapper {
		display: block;
	}
	#wrapper div {
		width: 100%;
	}
}

</style>
<meta charset="UTF-8">
<title>Sell:F 회원가입</title>
<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">	
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">	
</head>

<body>
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<script type="text/javascript"	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"	charset="utf-8"></script>
<div id="wrapper" style="overflow:hidden;">
	<header id="header"> <%@include
				file="/views/common/header.jsp"%> </header><br>
	<div class="container">
		<div class="sign-up-title">
			회원가입
			<p>회원이 되셔서 다양한 혜택을 누려보세요.
		</div>
		<div class="sign-up">
			<ul>
				<li class="active"><h3>
						STEP1 <small>가입방법 선택</small>
					</h3></li>
				<li><h3>
						STEP2 <small>이용약관 동의</small>
					</h3></li>
				<li><h3>
						STEP3 <small>회원정보 입력</small>
					</h3></li>
				<li><h3>
						STEP4 <small>회원가입 완료</small>
					</h3></li>
			</ul>
			<h4>원하는 회원가입 방법을 선택하세요.</h4>
		</div>
		<!-- 회원가입 방법 선택 -->
		<div class="normal-sign-up">
				<h4>
					<span>회원 유형 : <input type="radio" name="memberType"
						value="member" checked="checked">개인
					</span> <button onclick="memberType($('input[name=memberType]:checked').val());" class="btn btn-default btn-lg"
						style="color: white; background-color: black;">회원가입</button>
				</h4>
		</div>
		<!-- SNS 계정으로 로그인 -->
		<div class="sns-sign-up">
			<h4>SNS 계정으로 로그인</h4>
			<ul class="sns-list">
			<%
		    String clientId = "dLGZqiGmEAaTdfOSAIv1";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://127.0.0.1/views/member/naverCallBack.jsp", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
		 	%>
				<li><a href="<%=apiURL%>"><img src="/img/loginByNaver.PNG" class="img-responsive"></a></li>

				<li><button onclick="memberType('google');" class="snsBtn"><img src="/img/btn_google_signin_dark_normal_web.png"
					class="img-responsive" width="200px"></button></li>
			</ul>
		</div>
	</div>
	
	<!-- footer -->
	<footer>
					<%@include file="../../views/common/footer.jsp" %>
			</footer>
	</div>
	<script type="text/javascript">
		/*	회원가입 방법에따라 값 넣어서 전송		*/
		function memberType(type) {
			location.href="/views/member/memberTerms.html?memberType="+type;
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>

</body>

</html>