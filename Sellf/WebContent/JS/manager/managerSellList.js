
function chan()
{
	var mainCtg = $("#productCategory").val();
	$.ajax({
		url : "/managerGetSubCtg",
		type : "POST",
		data : {"mainCtg":mainCtg},
		dataType : "json",
		success : function(data)
		{
			console.log(data);
			
		},
		error : function()
		{
			console.log("18");
		}
	
	});
}
	

































