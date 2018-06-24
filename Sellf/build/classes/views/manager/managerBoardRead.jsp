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

<script src="http://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../CSS/common.css" type="text/css" />
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

<title>Sell:F Manager Page</title>


<script src="../../assets/js/ie-emulation-modes-warning.js"></script>



</head>

<body>
<style>
 #boardRead{
 	height:500px;width:1000px; border:1px;
 }
 #titleRead{  
	height:30px;width:300px;  float:left;
 }
 #writeDate{ 
		height:30px;width:300px;  float:right; 
 }
 #writeMember{
 	height:30px;width:300px; float:left;	
 }
 #leftArrow
 {
 	height:30px;width:60px; float:left;
 }
 #rightArrow
 {
 height:30px;width:60px; float:right;
 }
 #boardList{
 height:50px; width:100px;
 }
 #title{
 	border:0;
 }
 #wDate{
 	border:0;
 }
 #wMember
 {
 border:0;}
</style>
	<div class="page-wrapper chiller-theme toggled">
		<div>
			<nav class="navbar bg-dark ">
				<div class="container">
					<div class=nav-head></div>
					<div class="navbar" style="float: right;">
						<ul class="nav nav nav-pills">
							<li class="nav-item"><a
								class="btn btn-primary btn-sm active" role="button"
								aria-pressed="true" href="#">게시판 관리 이동</a></li>
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
						<img src="/img/sellf.jpg" style="width: 225px; height: 75px;">
					</div>
					<div class="sidebar-header">
						<div class="user-pic">
							<img class="img-responsive img-rounded" src="/img/4dollar.jpg"
								style="width: 65px; height: 65px;">
						</div>

						<div class="user-info">
							<!-- 접속한 관리자 정보를 출력하는 공간 -->
							<span class="user-name">sa-dollar <strong>Smith</strong>
							</span> <span class="user-role">Administrator</span> <span
								class="user-status"> <i class="fa fa-circle"></i> <span>Online</span>
							</span>
						</div>
					</div>
					<!-- sidebar-header  -->

					<div class="sidebar-menu">
						<ul>
							<li class="header-menu"><span>SELL:F 운영 관리</span></li>
							<li class="sidebar-dropdown"><a href="#"> <i
									class="fa fa-shopping-cart"></i> <span>상품관리</span> <span
									class="badge badge-pill badge-danger">New</span>
							</a>
								<div class="sidebar-submenu">
									<ul>
										<li><a href="/views/manager/managerSellList.jsp">상품
												정보 조회 <span class="badge badge-pill badge-success">Pro</span>
										</a></li>

										<li><a href="#">Dashboard 3</a></li>
									</ul>
								</div></li>
							<li class="sidebar-dropdown"><a href="#"> <i
									class="fa fa-users" aria-hidden="true"></i> <span>회원 관리</span>
									<span class="badge badge-pill badge-primary">3</span>
							</a>
								<div class="sidebar-submenu">
									<ul>
										<li><a href="/views/manager/managerMemberSelect.jsp">회원
												정보 조회 </a></li>
										<li><a href="/views/manager/managerBlackList.jsp">블랙리스트</a>
										</li>
									</ul>
								</div></li>
							<li class="sidebar-dropdown"><a href="#"> <i
									class="far fa-gem"></i> <span>게시판 & 상담</span>
							</a>
								<div class="sidebar-submenu">
									<ul>
										<li><a href="/views/manager/managerBoard.jsp">게시판 현황</a>
										</li>
										<li><a href="/views/manager/managerQnABoard.jsp">상담게시판</a>
										</li>
										<li><a href="#">Tables</a></li>
									</ul>
								</div></li>

							<li class="sidebar-dropdown"><a href="#"> <i
									class="fa fa-globe"></i> <span>통계&분석</span>
							</a>
								<div class="sidebar-submenu">
									<ul>
										<li><a href="#">Web 분석</a></li>
										<li><a href="#">회원-상품 통계</a></li>
									</ul>
								</div></li>
							<li class="header-menu"><span>Extra</span></li>
							<li><a href="#"> <i class="fa fa-calendar"></i> <span>통계</span>
							</a></li>
							<li><a href="#"> <i class="fa fa-folder"></i> <span>Examples</span>
							</a></li>
							<li><a href="#"> <i class="fa fa-book"></i> <span>Documentation</span>
							</a></li>
						</ul>
					</div>
					<div class="sidebar-footer">
						<a href="#"> <i class="fas fa-angle-up"></i> <span
							class="badge badge-pill badge-warning notification">3</span>
						</a> <a href="#"> <i class="fa fa-envelope"></i> <span
							class="badge badge-pill badge-success notification">7</span>
						</a> <a href="#"> <i class="fa fa-cog"></i> <span
							class="badge-sonar"></span>
						</a> <a href="#"> <i class="fa fa-power-off"></i>
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
			
				<br><br>
		
          
        </div>
	</div>
					<div id="boardRead">
						<span id="titleRead"> <!-- 제목 -->
						제목  : <input type="text" readonly id="title"/>
						</span>
						<span id="writeDate"> <!-- 작성일 -->
						작성일  : <input type="text" readonly id="wDate" />
						</span>
					
						<br><br>
						<span id="writeMember"><!-- 작성자 id출력 -->
						작성자 : <input type="text" readonly id="wMember" />
						</span> 
						
						<br><br><br>
						<center>
						<textarea rows="12" cols="100" id="read" style="border:1;" readonly>adasdwdsgresyegdgqwewqrdgdfhsdsdfafsgdgdsg</textarea>
						<br>
						<span id="leftArrow"><a href=""><i class="fas fa-angle-left">이전 글</i></a></span>
						
						<span id="boardList"><a href=""><i class="fas fa-th-list">목록으로가기</i></a></span> 
						<span id="rightArrow"><a href=""><i class="fas fa-angle-right">다음글</i></a></span>
						</center>
						
						
					</div>
				
				</div>
			</div>
		</div>
		</main>
</body>
</html>