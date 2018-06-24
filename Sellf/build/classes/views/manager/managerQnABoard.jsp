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

<title>Q&A Board</title>
</head>

<body>
<%@include file="/views/manager/managerBase.jsp" %>
		<main class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">
					
					<br><br>
					<h3>Q&A게시판</h3>
					<hr>
					<table class="table">
						<tr>
							<th>No</th><th>제목</th><th>작성자</th><th>작성일</th>
						</tr>
						<tr>
						 <td></td><td></td><td></td><td></td> <!-- 이쪽에 내용을 출력하면 됩니다. 디비에서 읽어와서 -->
						 </tr>
					
					</table>
					</div>
					</div>
					</div>
					</main>

</body>
</html>