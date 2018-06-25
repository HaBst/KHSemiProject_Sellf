
function chan() //대분류 선택에따라 소분류 를 dv에서 읽어와서 뿌려줌.
{
    $("#productItem").empty();
    var mainCtg = $("#productCategory option:selected").val();
    
	$.ajax({
		url : "/managerGetSubCtg",
		type : "POST",
		data : {"mainCtg":mainCtg},
		dataType : "json",
		success : function(data)
		{
			var keys = Object.keys(data);
			for(var i=0;i<keys.length;i++)
			{
				var opt = $("<option value="+[keys[i]]+">"+data[keys[i]]+"</option>");
				$("#productItem").append(opt);
			}
		},
		error : function()
		{
			console.log("fail");
		}
	
	});
}

var currentPage = 1;
function sellSearch(){
    var searchType = $("#searchType option:selected").val();   //상품검색을 위한 조건 선택한 값
    var getSearch = $("#getSearch").val();                    //조건에 맞게 입력한 값을 가져옴
    var MainCtg = $("#productCategory option:selected").val(); //대분류 선택한 값 가져옴.
    var subCtg = $("#productItem option:selected").val();      //소분류 선택한 값 가져옴
    var gradeStatus = $(':input:radio[name=status]:checked').val(); //상품 상태 값을 가져옴.
  
    $.ajax({
        url:"/managerProductSearch",
        type:"POST",
        data:{searchType:searchType,getSearch:getSearch,MainCtg:MainCtg,subCtg:subCtg,gradeStatus:gradeStatus,currentPage:currentPage},
        dataType:"json",
        success:function(data)
        {
//           console.log(data.productList.length);
            var parent = $("#searchResultTb");
            var naviArea = $("#naviArea");
            var result = "";
            var navi="";
            result+=
            	'<tr><th>상품명</th><th>상품가격</th><th>판매자</th><th>글 작성일</th></tr>';
            for(var i = 0; i<data.productList.length;i++)
        	{

            	result+=
						'<tr>'+
						'<td>'+data.productList[i].product_name +'</td>'+
						'<td>'+data.productList[i].product_price+'</td>'+
						'<td>'+data.productList[i].product_entire_user_id_fk+'</td>'+
						'<td>'+data.productList[i].product_enrolldate+'</td>'+
					'</tr>';
        	}
            parent.html(result);
            naviArea.html(data.pageNavi);
            console.log(data.pageNavi);
        },
        error:function()
        {
            console.log("1818");
        }
    });

}


function pageChange(pageNum)
{
	 currentPage = pageNum;
	 sellSearch(currentPage);
}

function reset()
{
    
    location.reload("/views/manager/managerSellList.jsp");
}


































