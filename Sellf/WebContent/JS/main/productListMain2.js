var allCategory;
var allState;
window.onload = function(){
	allCategory = document.getElementsByClassName('category-btn')[0];
	selectCategory();
	allState = document.getElementsByClassName('productState-btn')[0];
	selectProductState();
	loadSelectCategory();
}

var page = 1;

$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      $(".productList").append();
      
    }
});



var currentPageNum = 0;//현재 페이지 넘버.
function loadSelectCategory()
{
	var mainCategory  = "M01";//$("#userIndex2").val();// 입력값 가져오기
	var subCategory  = "S0101";//$("#userIndex2").val();// 입력값 가져오기
	var onePageShowProduct = Number($("#perPageCount").val()); // 한페이지에 몇개 보여줄지.
	var currentPage = Number(currentPageNum);// 현재 페이지.
	var totalProductSize = $("#entireProductTitleLabel");  // 제목 표시해줄때.
	var totalProductList = $(".productList");//$("#productLine");
	var keys;
	totalProductList.html("");
	// 페이징 처리 부분.
	var pagingNav = $(".pagination");
	pagingNav.html("");
	
	$.ajax({
		url:"/productSortCategory",
		data : {mainCategory : mainCategory,
				subCategory : subCategory,
				onePageShowProduct :onePageShowProduct,
				currentPage :currentPage
				},
		type : "get",
		success : function(data){			
			var result = "";
			// JSON에서 MAP형태로 꺼내오려면
			// 키값을 먼저 추출해야함
			var result = "";
			keys = Object.keys(data);
			var maxLength = keys.length;	
			
			if(maxLength < currentPage*onePageShowProduct+ onePageShowProduct){
				maxLength =  keys.length;
			}
			else
			{
				maxLength =   currentPage*onePageShowProduct+ onePageShowProduct;
			}
//			console.log(currentPage*onePageShowProduct+ onePageShowProduct);
			totalProductSize.html("전체상품 " +  keys.length + "개");
			
			for(var i = currentPage*onePageShowProduct; i<maxLength;i++)
			{
				totalProductList.append(
				'<li class="productWrap">'+
				'<div class="productBg">'+
					'<div class="imgWrapper">'+
						'<img class="productImgMain" src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg">'+
						'<% if (discountRate > 0) { %>'+						
						'<div class="discountBg">10%</div>'+
						'<% }%>'+
						'<div class="productSideMenu">'+
						'<div class="display_newwin hide">'+
						'<img src="../../img/thumb_quickview.png" alt="">'+
						'</div>'+
						'<div class="display_quickview">'+
						'<img src="../../img/thumb_quickview.png" alt="미리보기">'+
						'</div>'+
						'<div class="display_option">'+
						'<img src="../../img/thumb_option.png" alt="옵션보기">'+
						'<div class="hide display_opt_bak" act=""></div>'+
						'</div>'+
						'<div class="display_send">'+
						'<img src="../../img/thumb_send.png" alt="SNS보내기">'+
						'</div>'+
						'<div class="display_zzim">'+
						'<img src="../../img/thumb_zzim_off.png" alt="찜하기"><img'+
						'src="../../img/thumb_quickview.png" style="display: none" alt="찜하기">'+
						'</div>'+
					'</div>'+
				'</div>'+

				'<div class="productTitle">'+data[keys[i]].product_name+'</div>'+
				'<div class="productExplain">'+
					'<font class="productExplainFont">'+data[keys[i]].product_entire_user_entire_id_fk +'<br>'
						+data[keys[i]].product_detail +
					'</font>'+
				'</div>'+
				'<div class="priceOrigin">'+
					'<s>￦ 50,000</s>'+
				'</div>'+
				'<div class="priceDiscount">￦ ' + data[keys[i]].product_price + '</div>'+
				'<div class="myCheck">'+
					'<center>'+
						'<ul>'+
							'<li><img src="../../img/icon_zzim_off.png"> 103</li>'+
						'</ul>'+
					'</center>'+
				'</div>'+
				'<div class="freeTransfor">무료배송</div>'+
				'</div></li>');	
			}			
			
			pagingNav.append(
					'<li class="page-item">'+
						'<a class="page-link-prev" href="#">'+ 
							'<span aria-hidden="false">&laquo;</span>'+
							'<span class="sr-only">Previous</span>'+
						'</a>'+
					'</li>'
			);		
			
			for(var i = 0; i<keys.length/ onePageShowProduct;i++){
				pagingNav.append('<li class="page-item"><a class="page-link" onclick="selectPage('+i+',this)">'+(i+1)+'</a></li>');
			}
			pagingNav.append(
					'<li class="page-item">'+
					'<a class="page-link-next" href="#">'+
						'<span aria-hidden="false">&raquo;</span>'+ 
						'<span class="sr-only">Next</span>'+
					'</a>'+
				'</li>'
			);
			
			var aArr = document.getElementsByClassName("page-link");
			aArr[currentPageNum].style = "color: #23527c; background-color: #eee; border-color: #ddd";
					
		},
		error : function(){
			console.log("실패");	
		}
	});
}

/* '<jsp:include page="/views/product/productItem.jsp" flush="false">'+
 	  '<jsp:param name="discountRate" value="10" />'+
 	  '<jsp:param name="middlename" value="Pratap" />'+
	  '<jsp:param name="lastname" value="Singh" />'+	
	'</jsp:include>';
* */
/*
   "인덱스 : " + data[keys[i]].product_entire_pk + "/" +
	"등록 유저 아이디 : " + data[keys[i]].product_entire_user_entire_id_fk + " / " + 
	"메인 상품 카테고리  : " + data[keys[i]].product_entire_category_main_id_fk +" / "
	"서브 상품 카테고리 : "+data[keys[i]].product_entire_category_sub_id_fk+" / " +  
	"상품 이름 : "+data[keys[i]].product_name+" / " +  
	"상품 가격 : "+data[keys[i]].product_price+" / " +  
	"상품 이미지 주소 : "+data[keys[i]].product_image+" / "
	"상품 수량 : "+data[keys[i]].product_amount+" / " +  
	"상품 상태 : "+data[keys[i]].product_state + "<br>";
*/

function selectPage(pageNum)
{
	currentPageNum = pageNum;
	loadSelectCategory();
}
function selectOnePageProduct(){
	currentPageNum = 0;
	loadSelectCategory();
}
function selectSortType(selectOption)
{
	loadSelectCategory();
}


function selectCategory()
{
	var categoryList = document.getElementsByClassName('category-btn');
	for(var i = 0; i<categoryList.length;i++)
	{
		categoryList[i].style.backgroundColor = "white";
	}
	allCategory.style.backgroundColor = "gray";	
	categoryArr =[];
}

var categoryArr = [];
function selectCategoryMulti(category)
{
	allCategory.style.backgroundColor = "white";	
	category.style.backgroundColor = "gray";	
	categoryArr.push(category);
}



function selectProductState()
{
	var stateList = document.getElementsByClassName('productState-btn');
	for(var i = 0; i<stateList.length;i++)
	{
		stateList[i].style.backgroundColor = "white";
	}
	allState.style.backgroundColor = "gray";	
	stateArr =[];
}


var stateArr = [];
function selectProductMulti(state)
{
	allState.style.backgroundColor = "white";
	state.style.backgroundColor = "gray";	
	stateArr.push(state);
}


function test()
{
	alert("테스트");
}