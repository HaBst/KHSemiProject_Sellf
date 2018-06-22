<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "product.model.vo.*" import = "java.util.*" %>
<%
	ArrayList<CateBig>listB = (ArrayList<CateBig>)request.getAttribute("listBig");
	ArrayList<CateSmall>listS = (ArrayList<CateSmall>)request.getAttribute("listSmall");
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--멀티 사진 업로드-->

<link rel="stylesheet" type="text/css"
	href="/CSS/product/productInsert.css">
</head>

<style>
body {
	margin: auto;
	width: 100%;
	height: auto;
}

#allWrapper {
	width: 1600px;
	margin: auto;
}

header {
	text-align: center;
	border: 1px solid black;
	width: 100%;
	height: 150px;
}

footer {
	text-align: center;
	border: 1px solid black;
	width: 100%;
	height: 150px;
}

/*바디부분 크기 */
.bodyWrapper {
	width: 80%;
	margin: 5% auto 0px auto;
}

/*상품등록페이지 div */
.insertTitle {
	margin-top: 8px;
	padding-top: 5%;
}

/* 상품등록페이지 h2 */
#mainTitle {
	padding-left: 2%;
}

/* 상세정보 랩퍼 */
.dataWrapper {
	width: auto;
	margin: 5%;
}

/*상품 상세정보 span*/
.dataWrapper>#dataTitle {
	font-size: 25px;
}

/* 상세정보 내용 */
.dataCon {
	margin: 3%;
}

/* 상세정보 내용 폼 */
#dataInsert {
	margin: 1%;
}

/*상세설명 라벨*/
#detail {
	padding-bottom: 1%;
	margin: 1%;
	font-size: 20px;
}

/*광고 */
.ad {
	padding-top: 6%;
	margin-bottom: 5%;
}

/*판매가격 */
#price {
	float: left;
}

/*상세정보 분류제목 */
#subTitle {
	margin-top: 1%;
}

.thumb-image {
	float: left;
	width: 100px;
	position: relative;
	padding: 5px;
}

.submitWrapper {
	display: inline;
}

.submitWrapper * {
	float: right;
	margin-right: 2%;
	margin-left: 2%;
}

/* 날력 버튼 지우기 */
input[type="date"]::-webkit-inner-spin-button {
	display: none;
	appearance: none;
}

.imgCon {
	height: auto;
	border: 1px solid lightgray;
	margin: 1%;
}

#wrapper {
	float: left;
	margin: 2% 2% 2% 2%;
}

#line {
	margin-right: 3%;
}
</style>

<body>
	<!-- 컴마찍기 시작 -->
	<!--
    <script>
        $(function() {
            var $input = $("#price");
            $input.on('keyup', function() {
                // 입력 값 알아내기
                var _this = this;
                numberFormat(_this)
            })
        });

        // 콤마 찍기
        function comma(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        // 콤마 풀기
        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        }

        function numberFormat(obj) {
//            obj.value = uncomma(obj.value);
            obj.value = comma(uncomma(obj.value));
        }
    </script>
-->
	<!-- 컴마찍기 끝 -->
	<!-- 사진 업로드-->
	<script>
	<!--
/* 그림추가부분-요리완성-전체  */
    $(document).ready(function() {
           $("#fileSucAll").on('change', function () {
             //Get count of selected files
             var countFiles = $(this)[0].files.length;/* 파일의 개수  */
             var imgPath = $(this)[0].value;/* 값? 선택된 파일의 값? */
             var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
             var imgFile_Suc_1 = $('#imgFile_Suc_1'); var imgFile_Suc_2 = $('#imgFile_Suc_2'); 
             var imgFile_Suc_3 = $('#imgFile_Suc_3');  var imgFile_Suc_4 = $('#imgFile_Suc_4'); var imgFile_Suc_5 = $('#imgFile_Suc_5');
             /* imgFile_Suc_One.empty(); */
             if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
               if (typeof(FileReader) != "undefined") {
                 //loop for each file selected for uploaded.
                 if(countFiles <5){
                 for (var i = 0; i < countFiles; i++) 
                 {
                    var reader = new FileReader();
                    if(i==0){
                   reader.onload = function(e) {
                      imgFile_Suc_1.attr('src',e.target.result);
                      var imgOne = $('#imgFile_Suc_1').attr('src');
                      console.log(imgOne);
                          $('#imgOne').attr('value',imgOne);   
                   }
                    
                   }else if(i==1){
                      reader.onload = function(e) {
                         imgFile_Suc_2.attr('src',e.target.result);
                          var imgTwo = $('#imgFile_Suc_2').attr('src');
                          console.log(imgTwo);
                        $('#imgTwo').attr('value',imgTwo);
                      }
                   }else if(i==2){
                      reader.onload = function(e) {
                         imgFile_Suc_3.attr('src',e.target.result);
                          var imgThree = $('#imgFile_Suc_3').attr('src');
                          console.log(imgThree);
                        $('#imgThree').attr('value',imgThree);
                      }
                   }else if(i==3){
                      reader.onload = function(e) {
                         imgFile_Suc_4.attr('src',e.target.result);
                          var imgFour = $('#imgFile_Suc_4').attr('src');
                          console.log(imgFour);
                        $('#imgFour').attr('value',imgFour);
                      }
                   }else if(i==4){
                      reader.onload = function(e) {
                         imgFile_Suc_5.attr('src',e.target.result);
                          var imgFive = $('#imgFile_Suc_5').attr('src');
                          console.log(imgFive);
                        $('#imgFive').attr('value',imgFive);
                      }
                   }
                    
                    
                   reader.readAsDataURL($(this)[0].files[i]);

                 }
                 }
                 else{
                	 alert("사진은 5장까지");
                 } 
               } else {
                 alert("This browser does not support FileReader.");
               }
             } else {
               alert("Pls select only images");
             }             
           });
         });
       --> 
        
        /* 그림추가부분-step*/
   function readURL(input,stepImgNum) {

       if (input.files && input.files[0]) {
           var reader = new FileReader();
    
           reader.onload = function (e) {
        	   for(i = 0; i <= stepImgNum; i++){
                   if(stepImgNum == 0){
                       var imgFile_Suc_1 = $('#imgFile_Suc_1');
                       imgFile_Suc_1.attr('src',e.target.result);
                       var imgOne = $('#imgFile_Suc_1').attr('src');
                       console.log(imgOne);
                     $('#imgOne').attr('value',imgOne);
        		  
                   }else if(stepImgNum == 1){
              var imgFile_Suc_2 = $('#imgFile_Suc_2');
              imgFile_Suc_2.attr('src',e.target.result);
              var imgTwo = $('#imgFile_Suc_2').attr('src');
              console.log(imgTwo);
            $('#imgTwo').attr('value',imgTwo);
            
              }else if(stepImgNum ==2){
            	  var imgFile_Suc_3 = $('#imgFile_Suc_3');
                  imgFile_Suc_3.attr('src',e.target.result);
                  var imgThree = $('#imgFile_Suc_3').attr('src');
                  console.log(imgThree);
                $('#imgThree').attr('value',imgThree);
                
              }else if(stepImgNum ==3){
            	  var imgFile_Suc_4 = $('#imgFile_Suc_4');
                  imgFile_Suc_4.attr('src',e.target.result);
                  var imgFour = $('#imgFile_Suc_4').attr('src');
                  console.log(imgFour);
                $('#imgFour').attr('value',imgFour);
                
              }else if(stepImgNum == 4){
            	  var imgFile_Suc_5 = $('#imgFile_Suc_5');
                  imgFile_Suc_5.attr('src',e.target.result);
                  var imgFive = $('#imgFile_Suc_5').attr('src');
                  console.log(imgFive);
                $('#imgFive').attr('value',imgFive);
              }
           }
           }
           reader.readAsDataURL(input.files[0]);
          }
      };
    </script>
	<!-- 사진 업로드 끝-->
	<script>
        function check() {
            var bCategory = $("#bCategory option:selected").val();
            var bCategory = $("#bcategory option:selected").value;
            var sCategory = $("#sCategory option:selected").text();
            var productName = document.getElementById('productName').value;
            var number = $("#number option:selected").text();
            var grade = $("#grade option:selected").val();
            var price = document.getElementById('price').value;
            var detail = $("#detail").text();
            var fileUpload1 = $("#fileUpload1").val();
            var fileUpload2 = $("#fileUpload2").val();
            var fileUpload3 = $("#fileUpload3").val();
            var fileUpload4 = $("#fileUpload4").val();
            var fileUpload5 = $("#fileUpload5").val();


            if (bCategory == 0) {
                alert("카테고리를 선택해주세요");
                return false;
            } else if (sCategory == "소분류선택") {
                alert("소분류 선택");
                return false;
            } else if (!(/^[가-힣a-zA-Z0-9]+$/).test(productName)) {
                alert("제목입력");
                return false;
            } else if (grade == 0){
            	alert("상품 등급을 선택하세요");
            	return false;
                
            } else if (!(1 <= number || number <= 5)) {
                alert("수량선택");
                return false;
            
            } else if (!(/[0-9]+/).test(price)) {
                alert("가격을 입력하세요");
                return false;
            } else if (!(/[가-힣A-Za-z0-9]+/).test(detail)) {
                alert("상세설명을 입력하세요");
                return false;
            }
            return true;
        }
    </script>

	<script>
        //값 가져오기
        $(document).ready(function() {
            $('#bCategory').on("change", function() {
                console.log($("#bCategory option:selected").val());
                console.log($("#bCategory option:selected").text());
            });
            $('#sCategory').on("change", function() {
                console.log($("#sCategory option:selected").val());
                console.log($("#sCategory option:selected").text());
            });
            $('#grade').on("change", function() {
                console.log($("#grade option:selected").val());
                console.log($("#grade option:selected").text());
            });
            $('#number').on("change", function() {
                console.log($("#number option:selected").text());
                console.log($("#date").val());
            });
        });
    </script>

	<script>
        function Category(e) {
			var bCategory = $('#bCategory').val();
			$.ajax({
				url : "/productSmallCate",
				data : {
					bCategory : bCategory
				},
				type : "get",
				success : function(data){
					
					$('#sCategory').find("option").remove();
					for (var i = 0; i < data.length; i++){
						$("#sCategory").append("<option value = '"+data[i].ScateId+"'>"+data[i].ScateName+"</option");
					}
				}
			});
        }
    </script>
    
    <script>
    function readURL(input,stepImgNum) {
		
       };
    
    
    </script>




	<header>
	<div id="header">
		<%--
			<%@includefile="../../views/common/header.jsp" %>--%>
	</div>
	</header>
<body>


	<div id="allWrapper">
		<section class="bodyWrapper">
		<div class="shadow p-3 mb-5 bg-white rounded">
			<div class="insertTitle">
				<h2 id="mainTitle">상품 등록 페이지</h2>
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

								<div class="form-group col-md-5">
									<label id="subTitle">상품 이름</label> <input name="productName"
										type="text" id="productName" class="form-control"
										placeholder="상품명을 입력하세요">
								</div>

								<div class="form-group col-md-4">
									<label id="subTitle">상품 상태</label> <select name="grade"
										id="grade" class="form-control" onchange="grade">
										<option selected value="0">등급선택</option>
										<option value="S">최상</option>
										<option value="A">상</option>
										<option value="B">중</option>
										<option value="C">중하</option>
										<option value="D">하</option>
									</select>
								</div>






								<div class="form-group col-md-4">
									<label id="subTitle">상품 수량</label> <select name="productCount"
										id="number" class="form-control" onchange="number">
										<option selected>선택하세요</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>



								<div class="form-group col-md-5">
									<label id="subTitle">판매 가격</label> <input name="price"
										type="text" id="price" class="form-control"> <label
										id="subTitle">( 원 )</label>
								</div>


							</div>
							<!--사진 업로드-->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label id="subTitle">상품 사진 등록</label>
								</div>
								<div class="imgCon">
									<div id="wrapper">
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
															onclick="document.all.fileSucOne.click();"> <input
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
									<label id="detail">상세설명</label>
									<textarea name="detail" class="form-control" rows="20"
										style="resize: none;"></textarea>
								</div>

							</div>


							<div class="howSubmit">
								<div class="submitWrapper">

									<button type="reset" class="btn btn-outline-secondary">취소</button>

									<button type="submit" class="btn btn-outline-secondary"
										onclick="return check();">작성</button>

								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		</section>
	</div>
	<section class="ad">
	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-ride="carousel">

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-10" src="../../img/1.PNG" alt="첫번째 슬라이드">
			</div>
			<div class="carousel-item">
				<img class="d-block w-10" src="../../img/2.PNG" alt="두번째 slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-10" src="../../img/3.PNG" alt="세번째 slide">
			</div>
		</div>

		<a class="carousel-control-prev" href="#carouselExampleFade"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleFade"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>

	</div>
	</section>
</body>


<footer>
<h2>footer</h2>
</footer>
</body>

</html>