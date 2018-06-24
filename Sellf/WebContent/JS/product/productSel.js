
var tapBefore;
var infoTabArr =[];
window.onload = function()
{
	tapBefore = document.getElementById("li1");
	infoTabArr = document.getElementsByClassName("tabContents");
	
	hideAllTab();
	infoTabArr[0].style.display = "block";
	
	$('.magnify-image').magnify();
}
function hideAllTab()
{
	for(var i = 0; i<infoTabArr.length;i++)
	{
		infoTabArr[i].style.display = "none";
	}
}
function changeTab(tabInfo, name, sellerId)
{   
	 if(!tabInfo.classList.contains('active'))
	 {
	    tabInfo.classList.add('active');
	    tapBefore.classList.remove('active');
	    tapBefore = tabInfo;
	    hideAllTab();
//	    console.log(name);
	    name.style.display = "block";
//	    document.getElementById(name).style.display = "block";
	    console.log(sellerId);
	    if(name.id=="tab1")
    	{
//	    	console.log("첫번째 탭");
    	}
	    if(name.id=="tab2")
    	{
	    	getReviewList(sellerId);
    	}
	    if(name.id=="tab3")
    	{
//	    	console.log("세번째 탭");
    	}
	 }
}
	 
	 var currentPage = 1;
	 var reviewerID ="";
	 
	 function pageChange(pageNum)
	 {
		 currentPage = pageNum;
		 getReviewList(reviewerID,currentPage);
	 }
	 function getReviewList(sellerId,pageNum)
	 {
		 reviewerID = sellerId;
		 var productReviewList = $("#productReviewList");
		 var result = "";
		 if(pageNum!=null) currentPage = pageNum;
		 console.log("판매자 아이디 " + reviewerID);
			$.ajax({
				url:"/userReviewInProduct",
				data : {
							userId:reviewerID,
							currentPage:currentPage
						},
				type : "get",
				success : function(data){					 
//					console.log("길이 " + data.reviewList.length);
					 for(var i = 0; i<data.reviewList.length;i++)
					 {
						 var starRate = "";
						 for(var j = 0; j<data.reviewList[i].userReviewRating;j++){ starRate += "★"; }
						 for(var k = 0; k<5-data.reviewList[i].userReviewRating;k++){ starRate += "☆"; }
						 	result+=
							'<div class="reviewerCommnet">'+
							'<div class="imageCircle">'+
								'<img src="../../img/sellitMan.png" style="width:100%; height:100%;"/>'+
							'</div>'+
							'<div class="reviewerStarGroup">'+
								'<div class="reivewerId">'+
								data.reviewList[i].userReviewUserEntireReviewedIdFk+
								'</div>'+
								'<div class="reviewerStar">'+								
									'<h3 style="color:#ffd53d; display:inline-block">'+
								 starRate +'</h3>'+
								'</div>'+
							'</div>'+
							'<div class="reviewContent">'+
								'<div class="reviewTitle">'+
								data.reviewList[i].userReviewComment+
								'</div>'+
								'<div class="reviewComment">'+
								data.reviewList[i].userReviewDate+
								'</div>'+
							'</div>'+	
						'</div>';
					 }
					 result+=data.pageNavi;
					 productReviewList.html(result);
					 
					 currentPage +=1;
				},
			error : function(){
				console.log("실패");	
			}
		});
	 }
	 
	 function userReview(productId)
	 {
		 console.log("상품아이디 " + productId);
		 var starPoint = $("#starPointSelect").val();
		 var reviewCommentArea = $("#reviewCommentArea").val();
			$.ajax({
				url:"/userReview",
				data : {
					starPoint:starPoint,// 평점
					reviewCommentArea:reviewCommentArea,  // 유저 리뷰
					reviewerID:reviewerID,// 판매자 아이디
					productId:productId// 상품 아이디
					
				},
				type : "post",
				success : function(data){
					alert("댓글등록을 성공했습니다.");
					getReviewList(reviewerID,1);
//					reviewCommentArea.val("");
					$("#reviewCommentArea").val("");
				},
				error:function(){
					
				
				}
			});
	 }

function changeImage(imgTag)
{
	var bigImg  = document.getElementsByClassName("magnify-image")[0];
	var slideImg  = document.getElementsByClassName("zoom-tiny-image");
	console.log(imgTag);
	var tempImg = slideImg[imgTag].src;
	slideImg[imgTag].src = bigImg.src;
	bigImg.src = tempImg;
	firstImg = tempImg;
}



