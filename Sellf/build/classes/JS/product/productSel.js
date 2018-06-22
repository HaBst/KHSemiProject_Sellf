
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
	    	console.log("세번째 탭");
    	}
	 }
	 
	 function getReviewList(sellerId)
	 {
			$.ajax({
				url:"/userReviewInProduct",
				data : {
					userId:sellerId
						},
				type : "get",
				success : function(data){
					console.log(data);
					'<div class="reviewerCommnet">'+
					'<div class="imageCircle">'+
						'<img src="../../img/거실.JPG" style="width:100%; height:100%;"/>'+
					'</div>'+
					'<div class="reviewerStarGroup">'+
						'<div class="reivewerId">'+
							'<%=ur.getUserReviewUserEntireReviewedIdFk() %>'+
						'</div>'+
						'<div class="reviewerStar">'+								
							'<h3 style="color:#ffd53d; display:inline-block">'+
							'if(ur.getUserReviewRating()>1){★}else{>☆}</h3>'+
							'if(ur.getUserReviewRating()>2){★}else{>☆}</h3>'+
							'if(ur.getUserReviewRating()>3){★}else{>☆}</h3>'+
							'if(ur.getUserReviewRating()>4){★}else{>☆}</h3>'+
							'if(ur.getUserReviewRating()>=5){★}else{>☆}</h3>'+
						'</div>'+
					'</div>'+
					'<div class="reviewContent">'+
						'<div class="reviewTitle">'+
						'애플 아이패드 프로 10.5인치 256GB WiFi'+
						'</div>'+
						'<div class="reviewComment">'+
						'만족해요.'+
						'</div>'+
					'</div>'+	
				'</div>'+
				'<%} %>'+
				'<label><%=pageNavi %></label> --%>'
				},
			error : function(){
				console.log("실패");	
			}
		});
	 }
}

