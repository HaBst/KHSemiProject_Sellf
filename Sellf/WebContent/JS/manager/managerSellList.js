function chan()
{
	var mainCtg = $("#searchProduct option:selected").val();
	$.ajax({
		url : "/managerSellListCtg",
		type : "POST",
		data : {mainCtg:mainCtg},
		dataType : "json",
		success : function(data)
		{
			console.log(data);
		},
		error : function()
		{
			console.log("18");
		}
	
	})
}





























