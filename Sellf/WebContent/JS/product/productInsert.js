
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

        function check() {
        
            var bCategory = $("#bCategory option:selected").val();
            var sCategory = $("#sCategory option:selected").val();
            var productName = $("#productName").val();
            	
            var number = $("#number option:selected").val();
            var state = $("#state option:selected").val();
            var image = $("#imgOne").val();
            var price = $("#price").val();
            var detail = $("#detail").val();
            
            var grade = $("#productGrade").val();
            var scratch = $("#scratch").val();
            var refund = $("#refund").val();
            var extra = $("#extra").val();
            
            
            
            
            var fileUpload1 = $("#fileUpload1").val();
            var fileUpload2 = $("#fileUpload2").val();
            var fileUpload3 = $("#fileUpload3").val();
            var fileUpload4 = $("#fileUpload4").val();
            var fileUpload5 = $("#fileUpload5").val();


            if (bCategory == 0) {
                alert("카테고리를 선택해주세요");
                return false;
            } else if (sCategory == 0) {
                alert("소분류를 선택해주세요");
                return false;
            } else if (!(/[가-힣a-zA-Z0-9]+/).test(productName)) {
                alert("제목을 입력해주세요");
                return false;
            } else if (state == 0){
            	alert("상품 상태를 선택하세요");
            	return false;
            } else if (number == 0) {
                alert("수량을 선택해주세요");
                return false;
            } else if (!(/[0-9]+/).test(price)) {
                alert("가격을 입력하세요");
                return false;
            } else if(grade == 0){
            	alert("상품의 등급을 선택해주세요");
            	return false;
            } else if(scratch == 0){
            	alert("흠집의 유무를 선택해주세요");
            	return false;
            } else if(refund == 0){
            	alert("환불의 여부를 선택해주세요");
            	return false;
            } else if(extra == 0){
            	alert("구성품의 유무를 선택해주세요");
            	return false;
            } else if(image == ""){
            	alert("이미지를 최소1장을 올려야합니다.");
            	return false;
            }
            else if (!(/[가-힣A-Za-z0-9]+/).test(detail)) {
                alert("상세설명을 입력하세요");
                return false;
            }
            return true;
        }

        $(document).ready(function() {
            $('#bCategory').on("change", function() {
                console.log($("#bCategory option:selected").val());
                console.log($("#bCategory option:selected").text());
                console.log($("#imgFile_Suc_1").val());
            });
            $('#sCategory').on("change", function() {
                console.log($("#sCategory option:selected").val());
                console.log($("#sCategory option:selected").text());
            });
            $('#state').on("change", function() {
                console.log($("#state option:selected").val());
                console.log($("#state option:selected").text());
            });
            $('#number').on("change", function() {
            	console.log($("#number option:selected").val());
                console.log($("#number option:selected").text());
                
                
            });
            $('#imgFile_Suc_1').on("change",function(){
            	console.log($("#imgOne ").val());
            });
            $('#productGrade').on("change",function(){
            	console.log($("#productGrade option:selected").val());
            });
            $('#scratch').on("change",function(){
            	console.log($("#scratch option:selected").val());
            });
            $('#refund').on("change",function(){
            	console.log($("#refund option:selected").val());
            });
            $('#extra').on("change",function(){
            	console.log($("#extra option:selected").val());
            	console.log($("#detail").text());
            });
        });

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
