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
			for(var i=0;i<data.length;i++)
				{
				var opt = $("<option value=")
				$("#productItem")
				}
			
		},
		error : function()
		{
			console.log("18");
		}
	
	});
}





























