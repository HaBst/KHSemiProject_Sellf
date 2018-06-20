var allCategory;
var allState;
var orderTypeArr;
var orderType = "updateOrder";
var category  = "";
window.onload = function(){
	allCategory = document.getElementsByClassName('category-btn')[0];
	selectCategory();
	allState = document.getElementsByClassName('productState-btn')[0];
	selectProductState();
	orderTypeArr = document.getElementsByClassName('sortBtn');
	var sortOrder = $_GET('orderType');
	orderType = sortOrder;
	selectOrderType();
	category = $_GET('category');
	loadSelectCategory();
}

var currentPage = 0;

$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    	loadSelectCategory();     
    }
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


var currentPageNum = 0;//현재 페이지 넘버.
function loadSelectCategory()
{
	var mainCategory  = "M01";//$("#userIndex2").val();// 입력값 가져오기
	var subCategory  = category;//$("#userIndex2").val();// 입력값 가져오기
	var onePageShowProduct = 8;//Number($("#perPageCount").val()); // 한페이지에 몇개 보여줄지.
//	var currentPage = Number(currentPageNum);// 현재 페이지.
	var totalProductSize = $("#entireProductTitleLabel");  // 제목 표시해줄때.
	var totalProductList = $(".productList");//$("#productLine");
	$.ajax({
		url:"/productSortCategory",
		data : {mainCategory : mainCategory,
				subCategory : subCategory,
				onePageShowProduct :onePageShowProduct,
				currentPage :currentPage,
				orderType : orderType
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
//			totalProductSize.html("전체상품 " +  keys.length + "개");
			
			for(var i = currentPage*onePageShowProduct; i<maxLength;i++)
			{
				var link = 'onclick="selectProduct('+data[keys[i]].product_entire_pk +');"';
				totalProductList.append(
				'<li class="productWrap">'+
				'<div class="productBg"' +link +'>'+
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
					'<font class="productExplainFont" text-overflow: ellipsis;>'+data[keys[i]].product_entire_user_entire_id_fk +'<br>'
						+data[keys[i]].product_detail +
					'</font>'+
				'</div>'+
//				'<div class="priceOrigin">'+
//					'<s>￦ 50,000</s>'+
//				'</div>'+
				'<div class="priceDiscount">￦ ' + numberWithCommas(data[keys[i]].product_price) + '</div>'+
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
	    	currentPage +=1;
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
function selectOnePageProduct()
{
	currentPageNum = 0;
	loadSelectCategory();
}

function selectProduct(productId)
{
	//"/productSelectOne?productId="+productId;
	location.href ="/productSelectOne?productId="+productId;//"/views/product/productSelect.jsp";
}


function selectSortType(selectOption)
{
	location.href="/views/main/productList.jsp?orderType="+selectOption+"&category="+category;
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

function selectOrderType()
{
	for(var i = 0; i<orderTypeArr.length;i++)
	{
		orderTypeArr[i].innerHTML = orderTypeArr[i].value;
		if(orderTypeArr[i].name==orderType)orderTypeArr[i].innerHTML = "<b>"+orderTypeArr[i].value+"</b>";
	}	
		
}


function $_GET(param) {
	var vars = {};
	window.location.href.replace( location.hash, '' ).replace( 
		/[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
		function( m, key, value ) { // callback
			vars[key] = value !== undefined ? value : '';
		}
	);
	if ( param ) {
		return vars[param] ? vars[param] : null;	
	}
	return vars;
}