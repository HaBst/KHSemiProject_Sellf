
function chan()
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
			console.log("18");
		}
	
	});
}

function sellSearch(){
    var searchType = $("#searchType option:selected").val();   //상품검색을 위한 조건 선택한 값
    var getSearch = $("#getSearch").val();                    //조건에 맞게 입력한 값을 가져옴
    var MainCtg = $("#productCategory option:selected").val(); //대분류 선택한 값 가져옴.
    var subCtg = $("#productItem option:selected").val();      //소분류 선택한 값 가져옴
    var gradeStatus = $(':input:radio[name=status]:checked').val(); //상품 상태 값을 가져옴.
    $.ajax({
        url:"/managerProductSearch",
        type:"POST",
        data:{searchType:searchType,getSearch:getSearch,MainCtg:MainCtg,subCtg:subCtg,gradeStatus:gradeStatus},
        dataType:"json",
        success:function(data)
        {
            
        },
        error:function()
        {
            console.log("1818");
        }
    });

}
function reset()
{
    
    location.href="/views/manager/managerSellList.jsp";
}


































