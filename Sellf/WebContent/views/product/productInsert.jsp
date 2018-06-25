<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "product.model.vo.*" import = "java.util.*" %>
<%
	ArrayList<CateBig>listB = (ArrayList<CateBig>)request.getAttribute("listBig");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
	<link rel="stylesheet" href="../../CSS/common/header.css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--멀티 사진 업로드-->

<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="/CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/adv.css">


<link rel="stylesheet" type="text/css" href="/CSS/product/productInsert.css">
<link rel="stylesheet" type="text/css" href="/CSS/common/footer.css?ver=1">
<link rel="stylesheet" href="../../CSS/product/productPreview.css?ver=1" /><!--프리뷰-->

<!-- 내부 js파일 -->
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>

<script type="text/javascript" src="../../JS/product/productInsert.js"></script>
</head>



<body>

	<div id="header">
			<%@include file="../../views/common/header.jsp" %>
	</div>


	<div id="allWrapper">
	
		<section class="bodyWrapper">
		
		<div class="shadow p-3 mb-5 bg-white rounded">
			<div class="insertTitle">
				<h2 id="insertProductTitle">상품 등록</h2>
			</div>
			<div class="dataWrapper">
				<span id="dataTitle">상품 상세정보</span>
				<div class="dataCon">
					<div id="dataInsert">
						<form action="/productInsert" method="post"
							enctype="multipart/form-data">
							<div class="form-row">

								<div class="form-group col-md-3">
									<label id="subTitle">카테고리</label><span id="bCateCheck"></span>
									<select name="bCategory" id="bCategory" class="form-control"
										onchange="Category(this)">
										<option selected value="0">카테고리를 선택</option>
  										<%for (CateBig cb : listB) {%>
										<option value="<%=cb.getProductCategoryId()%>"><%=cb.getProductCateGoryName()%></option>
										<%} %>

									</select>

								</div>

								<div class="form-group col-md-3">
									<label id="subTitle">카테고리(소분류)</label> <select name="sCategory"
										id="sCategory" class="form-control" onchange="sCategory">
										<option selected value="0"></option>
									</select>
								</div>

								<div class="form-group col-md-6">
									<label id="subTitle">상품 이름</label> <input name="productName"
										type="text" id="productName" class="form-control"
										placeholder="상품명을 입력하세요">
								</div>

								<div class="form-group col-md-4">
									<label id="subTitle">상품 상태</label> <select name="state"
										id="state" class="form-control" onchange="state">
										<option selected value="0">등급선택</option>
										<option value="N">새 제품</option>
										<option value="O">중고</option>
										
									</select>
								</div>

								<div class="form-group col-md-4">
									<label id="subTitle">상품 수량</label> <select name="productCount"
										id="number" class="form-control" onchange="number">
										<option selected value = "0">선택하세요</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label id="subTitle">판매 가격</label> <input name="price"
										type="text" id="price" class="form-control"> <label
										id="subTitle">( 원 )</label>
								</div>
								
								<div class="form-group col-md-3">
									<label id="subTitle">상품 등급</label> <select name="productGrade"
										id="productGrade" class="form-control" onchange="productGrade">
										<option selected value="0">등급선택</option>
										<option value="S">S</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="S">D</option>
										
									</select>
								</div>

								
								<div class="form-group col-md-3">
									<label id="subTitle">흡집</label> <select name="scratch"
										id="scratch" class="form-control" onchange="scratch">
										<option selected value="0">흠집유무 선택</option>
										<option value="Y">있음</option>
										<option value="N">없음</option>
										
									</select>
								</div>

								
								<div class="form-group col-md-3">
									<label id="subTitle">환불</label> <select name="refund"
										id="refund" class="form-control" onchange="refund">
										<option selected value="0">환불여부 선택</option>
										<option value="Y">가능</option>
										<option value="N">불가능</option>
										
									</select>
								</div>
			
								
								<div class="form-group col-md-3">
									<label id="subTitle">구성품</label> <select name="extra"
										id="extra" class="form-control" onchange="extra">
										<option selected value="0">구성품 유무</option>
										<option value="Y">유</option>
										<option value="N">무</option>
										
									</select>
								</div>
								


							</div>
							<!--사진 업로드-->
							<div class="form-row" id = "imgform">
								<div class="form-group col-md-6">
									<label id="subTitle" class = "imgTitle">상품 사진 등록</label>
								</div>
								<div class="imgCon">
									<div id="imgwrapper">
										<div class="row">
											<input id="fileSucAll" multiple="multiple" type="file"
												file_gubun="work" style="display: none" />



											<div class="col-md-2" id="line">
												<div class="row">
													<div class="col-md-12" id="successImgOne">
<!-- 
														<input id="fileSucOne" multiple="multiple" type="file"
															name="upfile1" style="display: none"
															onchange="readURL(this,0);" /> <img
															src="../../img/imgInsertBackground.PNG" width="130"
															height="130" id="imgFile_Suc_1"
															onclick="document.all.fileSucAll.click();"> <input
															type="hidden" id="imgOne" name="imgOne" value="">
 -->
 															<input id="fileSucOne" type="file" name="upfile1"
															style="display: none" onchange="readURL(this,0);" /> <img
															src="../../img/imgInsertBackground.PNG" width="130"
															height="130" id="imgFile_Suc_1" 
															onclick="document.all.fileSucOne.click();" > <input
															type="hidden" id="imgOne" name="imgOne" value="">
 
 
 
 
													</div>
												</div>
											</div>

											<div class="col-md-2" id="line">
												<div class="row">
													<div class="col-md-12" id="successImgTwo">

														<input id="fileSucTwo" type="file" name="upfile2"
															style="display: none" onchange="readURL(this,1);" /> <img
															src="../../img/imgInsertBackground.PNG" width="130"
															height="130" id="imgFile_Suc_2"
															onclick="document.all.fileSucTwo.click();"> <input
															type="hidden" id="imgTwo" name="imgTwo" value="">

													</div>
												</div>
											</div>

											<div class="col-md-2" id="line">
												<div class="row">
													<div class="col-md-12" id="successImgThrid">

														<input id="fileSucThrid" type="file" name="upfile3"
															style="display: none" onchange="readURL(this,2);" /> <img
															src="../../img/imgInsertBackground.PNG" width="130"
															height="130" id="imgFile_Suc_3"
															onclick="document.all.fileSucThrid.click();"> <input
															type="hidden" id="imgThree" name="imgThree" value="">

													</div>
												</div>
											</div>

											<div class="col-md-2" id="line">
												<div class="row">
													<div class="col-md-12" id="successImgFour">

														<input id="fileSucFour" type="file" name="upfile4"
															style="display: none" onchange="readURL(this,3);" /> <img
															src="../../img/imgInsertBackground.PNG" width="130"
															height="130" id="imgFile_Suc_4"
															onclick="document.all.fileSucFour.click();"> <input
															type="hidden" id="imgFour" name="imgFour" value="">

													</div>
												</div>
											</div>

											<div class="col-md-2" id="line">
												<div class="row">
													<div class="col-md-12" id="successImgFive">

														<input id="fileSucFive" type="file" name="upfile5"
															style="display: none" onchange="readURL(this,4);" /> <img
															src="../../img/imgInsertBackground.PNG" width="130"
															height="130" id="imgFile_Suc_5"
															onclick="document.all.fileSucFive.click();"> <input
															type="hidden" id="imgFive" name="imgFive" value="">

													</div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md">
									<label id="detailtitle">상세설명</label>
									<textarea id = "detail" name="detail" class="form-control" rows="20"
										style="resize: none;"></textarea>
								</div>

							</div>


							<div class="howSubmit">
								<div class="submitWrapper">

									<button type="reset" id = "buttons"class="btn btn-outline-secondary"
									onclick = "back();">취소</button>

									<button type="submit"id = "buttons" class="btn btn-outline-secondary"
										onclick="return check();" data-toggle="modal" data-target="#my80sizeCenterModal">작성</button>
									
									
<script>
function back(){
	history.go(-1);
}
</script>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		</section>




















		
	</div>
	<center>
<div id="footer"> <%@include file="/views/common/footer.jsp"%></div>
</center>





</body>

</html>