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
<title>상품 관리</title>
<script src="/JS/manager/managerSellList.js"></script>
</head>

<body>
<%@include file="/views/manager/managerBase.jsp" %>

		<main class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main">

					<h3>상품 정보 조회</h3>
					<hr>
						<form action="/managerProductSearch" method="post">
						<table class="table table-bordered">
							<tr>
								<form action ="/managerProductSearch" method="post"> 
								
								<th>검색분류</th>
								<td><select name="searchType"> <!-- value값은 차차 생각!! -->
										<option value="">-선택안함-</option>
										<option value="1">상품명</option>
										<option value="2">카테고리</option>
										<option value="3">판매자</option>
								</select><input type="text" name ="getSearch">
								</td>
							</tr>
							<tr>
								<th>상품 분류</th> 
								<td>
								<select name="productCategory" onchange="chan();" >
									<option value="" selected>-대분류 선택-</option>
									<option value="M01">전자제품</option>
									<option value="M02">패션의류</option>
									<option value="M03">패션잡화</option>
									<option value="M04">화장품/미용</option>
									<option value="M05">스포츠/레저</option>
									<option value="M06">완구/문구/취미</option>
									<option value="M07">여행/문화</option>
									<option value="M08">도서/음반/DVD</option>
									<option value="M09">유아동/출산</option>
									<option value="M10">가구/인테리어</option>
									<option value="M11">생활/건강</option>
									<option value="M12">자동차</option>
									<option value="M13">해외명품</option>
								</select>
							 	
							 	<select name="productItem" >
								<!-- 카테고리에 딸린 소분류를 db에서 읽어와서 출력. -->
								<option disabled>-소분류 선택-</option>
								
							</select>
						</td>
						</tr>
							<tr>
								<th>상품 상태</th>
								<td> <input type="radio" name="status" value="" checked />전체 
									 <input type="radio" name="status" value="a" />상  
									 <input type="radio" name="status" value="b" />중상  
									 <input type="radio" name="status" value="b" />중  
									 <input type="radio" name="status" value="d" />중하  
									 <input type="radio" name="status" value="e" />하 
								</td>
								
							</tr>
						</table>
						<center>
							<input type="submit" class="btn btn-outline-warning btn-sm"  >							
							<input type="reset" class="btn btn-outline-secondary btn-sm" onckick="reset();">초기화</button>
						</center>
					</form>
					<hr>
					<br><br>
					<div id="searchResult">
					 <label><h3>조회결과</h3></label><br>
					
						<table class="table">
							<tr>
								<th>상품번호</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>회원정보</th>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<!-- 조회결과 출력 -->
						</table>
						<button type="button" class="btn btn-outline-warning btn-sm">삭제</button>
					</div>
				</div>
			</div>
		</div>
		</main>
		
</body>
</html>