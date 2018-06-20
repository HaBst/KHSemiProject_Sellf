<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.text.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
	

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

<!-- 사이드바와 네비를 위한 공통적인 스크립트파일과 css파일  -->
<link rel="stylesheet" type="text/css" href="/CSS/manager/manager.css">
<script src="/JS/manager/manager.js"></script>
<script src = "/JS/manager/managerMemberSelect.js"></script>
<title>회원관리</title>



<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class="page-wrapper chiller-theme toggled">
		<div>
			<nav class="navbar bg-dark ">
				<div class="container">
					<div class=nav-head></div>
					<div class="navbar" style="float: right;">
						<ul class="nav nav nav-pills">
							<li class="nav-item"><a
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true" href="#">Dashboard</a></li>
							<li class="nav-item"><a
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true" href="#">Sell:F 이동</a></li>
							<li class="nav-item"><a
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true" href="#">Profile</a></li>
							<li class="nav-item"><a
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true" href="#">Help</a></li>
							<li class="nav-item"><a
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true" href="">몰라</a></li>
							<form class="navbar-form" action="" method="post">
								<!-- 검색어에 따라  -->
								<input type="text" class="form-control" placeholder="검색 내용 입력!">
							</form>
						</ul>
					</div>
				</div>
			</nav>
			<nav id="sidebar" class="sidebar-wrapper">
				<div class="sidebar-content">
                <div id="toggle-sidebar">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="sidebar-brand">
                    <img  src="/img/sellf.jpg" style="width:225px;height:75px;">
                </div>
                <div class="sidebar-header">
                    <div class="user-pic">
                        <img class="img-responsive img-rounded" src="/img/4dollar.jpg"style="width:65px;height:65px;">
                    </div>
                    
                    <div class="user-info"> <!-- 접속한 관리자 정보를 출력하는 공간 -->
                        <span class="user-name">sa-dollar
                            <strong>Smith</strong>
                        </span>
                        <span class="user-role">Administrator</span>
                        <span class="user-status">
                            <i class="fa fa-circle"></i>
                            <span>Online</span>
                        </span>
                    </div>
                </div>
                <!-- sidebar-header  -->
               
                <div class="sidebar-menu">
                    <ul>
                        <li class="header-menu">
                            <span>SELL:F 운영 관리</span>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-shopping-cart"></i>
                                <span>상품관리</span>
                                <span class="badge badge-pill badge-danger">New</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/views/manager/managerSellList.jsp">상품 정보 조회
                                            <span class="badge badge-pill badge-success">Pro</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Dashboard 3</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                               <i class="fa fa-users" aria-hidden="true"></i>
                                <span>회원 관리</span>
                                <span class="badge badge-pill badge-primary">3</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/views/manager/managerMemberSelect.jsp">회원 정보 조회
                                            
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/views/manager/managerBlackList.jsp">블랙리스트</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="far fa-gem"></i>
                                <span>게시판 & 상담</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/views/manager/managerBoard.jsp">게시판 현황</a>
                                    </li>
                                    <li>
                                        <a href="/views/manager/managerQnABoard.jsp">Panels</a>
                                    </li>
                                    <li>
                                        <a href="#">Tables</a>
                                    </li>
                                   
                                </ul>
                            </div>
                            
                        </li>
                       
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-globe"></i>
                                <span>통계&분석</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="#">Web 분석</a>
                                    </li>
                                    <li>
                                        <a href="#">회원-상품 통계</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="header-menu">
                            <span>Extra</span>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-calendar"></i>
                                <span>통계</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-folder"></i>
                                <span>Examples</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-book"></i>
                                <span>Documentation</span>
                            </a>
                        </li>
                    </ul>
                </div>
                 <div class="sidebar-footer">
                <a href="#">
                    <i class="fas fa-angle-up"></i>
                    <span class="badge badge-pill badge-warning notification">3</span>
                </a>
                <a href="#">
                    <i class="fa fa-envelope"></i>
                    <span class="badge badge-pill badge-success notification">7</span>
                </a>
                <a href="#">
                    <i class="fa fa-cog"></i>
                    <span class="badge-sonar"></span>
                </a>
                <a href="#">
                    <i class="fa fa-power-off"></i>
                </a>
            </div>
                <!-- sidebar-menu  -->
            </div>
				<!-- sidebar-content  -->

			</nav>
		</div>
		<!-- sidebar-wrapper  -->
		<main class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">
					<br> <br> <label><h2>회원정보 조회</h2></label>
				
					
						<table class="table table-bordered">
							<tr>
								<th>개인정보</th>
								<td colspan="3">
									<select id="selInfo">  <!-- option의 value값은 하기 편한걸로!!  -->
	 									<option value="userName">이름</option>
										<option value="userId">아이디</option>
									</select> 
										<input type="text" id="memberInfo" />
								</td>
							</tr>
							<tr><th>회원등급</th>
								<td>
								<select id="selGrade">
									<option value="G01">브론즈</option>
									<option value="G02">실버</option>
									<option value="G03">골드</option>
									<option value="G04">다이아몬드</option>
								</select>
								</td>
								<th>성별</th>
								<td>
										<input type="radio" name ="gender" value="M">남   
										<input type="radio" name="gender" value="F">여
								</td>
							</tr>
						</table>
						<center>
						<input type="submit" class="btn btn-outline-success" onclick="memberSelect();" value="정보 조회!" />
						</center>
					
					<br>

					<hr>
					<br> <br> <label><h3>조회 결과</h3></label> <label><h5
							style="color: red;">[총 n명 검색]</h5></label>
							<br>
					 
					<div id="selectInfoResult">
						<table class="table" id="printMemberInfo">
							<tr>
								<th><input type="checkbox" name="allCheck"></th>
								<th>아이디</th>
								<th>고객명</th>
								<th>등급</th>
								<th>휴대폰 번호</th>
								<th>성별</th>
								<th>가입일자</th>
								<th>거래내역</th>
							</tr>
							
						</table>
						<br>
						<button type="button" class="btn btn-danger btn-sm">불량회원 설정</button>
						<hr>
						<h5>추가 설정</h5>
						<br>
						<table class="table">
							<tr>
								<th>회원 등급 변경</th>
								<td>선택된 회원을 <select name="changeGrd">
										<option>브론즈</option>
										<option>실버</option>
										<option>골드</option>
								</select>로
									<button type="button" class="btn btn-outline-warning"> 등급변경</button>합니다.
								</td>
							</tr>
						</table>
					</div>



				</div>
			</div>
		</div>
	</div>
	</main>
	<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>

</html>