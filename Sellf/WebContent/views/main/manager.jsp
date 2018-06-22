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

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<title>Sell:F Manager Page</title>


<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script>
window.onload(function(){
	location.href="/managerFirstLoad";
})
</script>
</head>

<body>
<%@include file="/views/manager/managerBase.jsp" %>
	
		<main class="page-content">
		<div class="container-fluid">

			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">
					<br> <br>
					<div id="first">
						<h3 align="right">
							<%
								java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
								String today = formatter.format(new java.util.Date());
								out.println(today);
							%>
							Sell:F 현황
						</h3>
					</div>
					<hr>
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a
							class="nav-link active" href="#sales" aria-controls="sales"
							role="tab" data-toggle="tab">일별 매출현황</a></li>
						<li role="presentation"><a class="nav-link" href="#order"
							aria-controls="order" role="tab" data-toggle="tab">거래 현황</a></li>
						<li role="presentation"><a class="nav-link"
							href="#memberStatus" aria-controls="memberStatus" role="tab"
							data-toggle="tab">회원현황</a></li>
						
					</ul>

					<div class="tab-content">
						<div role="tabpanel" class="tab-pane in active" id="sales">
							<div id="morrisChart"
								style="height: 400px; width: 535px; float: left;"></div>
							<script>
								new Morris.Bar({
									element : 'morrisChart',
									data : [ {
										year : '2008',
										value : 30
									}, {
										year : '2009',
										value : 10
									}, {
										year : '2010',
										value : 5
									}, {
										year : '2011',
										value : 5
									}, {
										year : '2012',
										value : 20
									} ],
									xkey : 'year',
									ykeys : [ 'value' ],
									labels : [ 'value' ]

								});
							</script>
							<div id="salesResult"
								style="height: 400px; width: 510px; background-color: blue; float: left;">
								아배고프다.</div>
						</div>

						<div role="tabpanel" class="tab-pane fade" id="order">
							<div id="order" style="height: 400px; width: 535px; background-color: pink; float: left;">그래프</div>

							<div id="salesResult"
								style="height: 400px; width: 510px; background-color: yellow; float: left;">
								아배고프다.</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="memberStatus">
							<div id="memberGraph"
								style="height: 400px; width: 535px; background-color: pink; float: left;"></div>
							<div id="memberResult"
								style="height: 400px; width: 510px; background-color: blue; float: left;">
								<table class="table">
									<tr>
										<th>날짜</th>
										<th>신규회원 수</th>
										<th>방문회원</th>
										<th>탈퇴회원</th>
										<th>TOTAL</th>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
									<tr>
										<td></td>
										<td>1명</td>
										<td>1명</td>
										<td>1명</td>
										<td>100명</td>
									</tr>
								</table>
							</div>
						</div>
						
					</div>

				</div>
			</div>
		</div>
		</main>
		<!-- page-content" -->
	
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
