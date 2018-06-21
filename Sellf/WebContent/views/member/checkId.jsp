<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#check
{
	margin-top : 40px;
	margin-left: auto;
	margin-right: auto;
}
#useCancel
{
	margin-top :20px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ajax 링크걸기  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="check" align="center">
<input type="text" value="${param.checkId}" id="insertId">
<button id="checkBtn">중복 확인</button><br>
</div>
<div id="useCancel" align="center">
<button id="use">사용하기</button>
<button id="cancel">취소</button>
</div>
<script type="text/javascript">
$(document).ready(function() {

    //[1] 기본값 설정

    $("#use").hide(); //more...숨기기

});
$('#checkBtn').click(function() {
	
	var id=$('#insertId').val();
	var check =1;
	var reg = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	
	
		 if(!reg.test(id)){
			 }
		 else{
			 check=0;
			}
	
		// jQuery Ajax 코드
			$.ajax({
				url : "/checkid",
				data : {id : id},
				type : "get",
				success : function(result) {
					if(check==1)
						{
						alert("공백 없는 영문,숫자 포함 6-20자로 입력해주세요");
						}
				else if(result==1&&check==0)
						{
						alert("이미 사용중인 ID 입니다.");
						}
					else if(result==0&&check==0)
						{
						alert("사용가능합니다.");
						$("#use").show();
						}
				},
				error : function(){
					console.log("실패");
				}
			});
	});
	$('#use').click(function () {
		var id=$('#insertId').val();
		$(opener.document).find('input[name=memberId]').val(id);
		$(opener.document).find('input[name=userId]').val(id);
		self.close();

	});
	
	$('#cancel').click(function () {
		$(opener.document).find('input[name=memberId]').val('');
		$(opener.document).find('input[name=userId]').val('');
		self.close();
	});
	
</script>
	<script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>
</body>
</html>