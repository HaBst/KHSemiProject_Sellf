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

<title>BlackList</title>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src = "/JS/manager/managerBlackList.js"></script>
</head>

<body>
<%@include file="/views/manager/managerBase.jsp" %>
	
		<!-- sidebar-wrapper  -->
		<main class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">

					<h3>블랙리스트 회원 보기</h3>
					<hr>
					<table class="table" id="resultBlackList">
							<tr>
								<th>체크</th>
								<th>아이디</th>
								<th>고객명</th>
								<th>등급</th>
								<th>휴대폰 번호</th>
								<th>성별</th>
								<th>가입일자</th>
							</tr>
							<!-- 결과 출력 -->
						<% for(ManagerSelMember msm:list){%>
							<tr>
								<td><input type="checkbox" id="unlock" value=<%=msm.getUserEntireId() %>></td>
								<td><%=msm.getUserEntireId() %></td>
								<td><%=msm.getUserEntireName() %></td>
								<td>불량</td>
								<td><%=msm.getUserPhone() %></td>
								<td><%=msm.getUserGender()%></td>
								<td><%=msm.getUserEnrollDate() %></td>
							</tr>
							<%} %>
							
						</table>
						<center><label><%=pageNavi %></label></center>
						<button type="button" class="btn btn-outline-info btn-sm" onclick="unlock();">불량회원 해제</button>
					</div>
				</div>
			</div>
		
		</main>
		
</body>
</html>