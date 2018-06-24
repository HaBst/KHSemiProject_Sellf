<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.text.*"
	import="manager.model.vo.*"%>
<%
	ManagerBoard mb = (ManagerBoard) request.getAttribute("notice");
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

<title>Sell:F Manager BoardWrite</title>



<script src="/JS/manager/managerWrite.js"></script>


</head>

<body>
	<style>
#boardRead {
	height: 500px;
	width: 1000px;
	border: 1px;
}

#titleRead {
	height: 30px;
	width: 300px;
	float: left;
}

#writeDate {
	height: 30px;
	width: 300px;
	float: right;
}

#writeMember {
	height: 30px;
	width: 300px;
	float: left;
}

#leftArrow {
	height: 30px;
	width: 60px;
	float: left;
}

#rightArrow {
	height: 30px;
	width: 60px;
	float: right;
}

#boardList {
	height: 50px;
	width: 100px;
}

#title {
	border: 0;
}

#wDate {
	border: 0;
}

#wMember {
	border: 0;
}
</style>
	<%@include file="/views/manager/managerBase.jsp"%>

	<main class="page-content">
	<div class="container-fluid">

		<div class="row">
			<div class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">

				<br>
				<br>
				<div id="boardRead">
					<form action="/managerNoticeWrite" method="post">
						<span id="titleRead"> <!-- 제목 --> 제목 : <input type="text"
							name="title" />
						</span> <br>
						<br> <br>
						<br>
						<br>
						
							<textarea rows="12" cols="100" name="writeContent"
								style="border: 1;">
					
						</textarea>
						<center>
							<br> <input type="submit" class="btn btn-primary btn-sm"
								value="등록하기" />
							<button type="button" onclick="cancel();">작성 취소</button>
						</center>
					</form>

				</div>

			</div>
		</div>


	</div>

	</main>
</body>
</html>