<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.text.*" import="manager.model.vo.*"%>
<% ManagerMemberData mmd = (ManagerMemberData)request.getAttribute("listData");
	ArrayList<ManagerSelMember> list = mmd.getList();
	String pageNavi = mmd.getPageNavi();
%>
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
	
<script src = "/JS/manager/managerMemberSelect.js"></script> <!-- 정보조회하는 js담겨있음. -->
<title>회원관리</title>

</head>

<body>
<%@include file="/views/manager/managerBase.jsp" %>
	
		<main class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">
					<br> <br> <label><h2>회원정보 조회</h2></label>
				
					
						<table class="table table-bordered">
							<form action="/managerSelMember" method="post">
							<tr>
								<th>개인정보</th>
								<td colspan="3">
									<select name="selInfo">  <!-- option의 value값은 하기 편한걸로!!  -->
										<option value="" selected>-선택 안함-</option>
	 									<option value="userName">이름</option>
										<option value="userId">아이디</option>
									</select> 
										<input type="text" name="selVal" placeholder="이름 or id입력! " />
								</td>
							</tr>
							<tr><th>회원등급</th>
								<td>
								<select name="selGrade">
									<option value="" selected>-선택안함</option>
									<option value="G01">브론즈</option>
									<option value="G02">실버</option>
									<option value="G03">골드</option>
									<option value="G04">다이아몬드</option>
								</select>
								</td>
								<th>성별</th>
								<td>	<input type="radio" name="gender" value="" checked>전체
										<input type="radio" name="gender" value="M">남   
										<input type="radio" name="gender" value="F">여
								</td>
							</tr>
						</table>
						<center>
						<input type="submit" class="btn btn-outline-success" value = "정보조회"/>
						<input type="reset" class = "btn btn-outline-warning" value="초기화"/>
						</form>
						</center>
					
					<br>

					<hr>
					<br> <br> <label><h3>조회 결과</h3></label> 
							<br>
					 
					<div id="selectInfoResult">
						<table class="table" id="printMemberInfo">
							<tr>
								<th>체크</th>
								<th>아이디</th>
								<th>고객명</th>
								<th>등급</th>
								<th>휴대폰 번호</th>
								<th>성별</th>
								<th>가입일자</th>
								<th>포인트</th>
							</tr>
							<% for(ManagerSelMember msm:list){%>
							<tr>
								<td><input type="checkbox" id="unlock" value=<%=msm.getUserEntireId() %>></td>
								<td><%=msm.getUserEntireId() %></td>
								<td><%=msm.getUserEntireName() %></td>
								<td><%=msm.getUserGrade() %></td>
								<td><%=msm.getUserPhone() %></td>
								<td><%=msm.getUserGender()%></td>
								<td><%=msm.getUserEnrollDate() %></td>
								<td><%=msm.getUserPoint() %>
							</tr>
							<%} %>
							<label><%=pageNavi %></label>
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