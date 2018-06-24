<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<div>
<input type="text" value="${param.checkId}" id="insertId">
<button onclick="checkId()">중복 확인</button>
</div>
<script type="text/javascript">
	function checkId() {
		var id = $("#insertId").val();
		// jQuery Ajax 코드
		$.ajax({
			url : "/checkid",
			data : {id : id},
			type : "get",
			success : function() {
				console.log("성공");
			},
			error : function(){
				console.log("실패");
			}
		});
	}
</script>
	<script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>
</body>
</html>