<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.text.*" import="manager.model.vo.*"%>
<% ManagerBoard mb = (ManagerBoard)request.getAttribute("notice");%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

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
<%@include file="/views/manager/managerBase.jsp" %>
	
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
						제목  : <input type="text" readonly id="title" value=<%=mb.getSubject() %> />
						</span>
						<span id="writeDate"> <!-- 작성일 -->
						작성일  : <input type="text" readonly id="wDate" value=<%=mb.getWriteDate() %>/>
						</span>
					
						<br><br>
						<span id="writeMember"><!-- 작성자 id출력 -->
						작성자 : <input type="text" readonly id="wMember" value=<%=mb.getWriteId() %>/>
						</span> 
						
						<br><br><br>
						<center>
						<textarea rows="12" cols="100" id="read" style="border:1;" readonly>
						<%=mb.getContent() %>
						</textarea>
						<br>
						
						<span id="boardList"><a href=""><i class="fas fa-th-list">목록으로가기</i></a></span> 
						
						</center>
						
						
					</div>
				
				</div>
			</div>
		</div>
		</main>
</body>
</html>