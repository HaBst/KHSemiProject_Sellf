
function unlock(){
	var items = [];
	$("input:checkbox[id='unlock']:checked").each(function(){
		items.push($(this).val());
	});
	 
	$.ajaxSettings.traditional = true;

	 $.ajax({
		url:"/managerBadUnlock",
		data:{"items":items},
		type:"POST",
		success:function(data)
		{
			console.log(data);
		},
		error:function()
		{
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);

	
		}
	 });
    }
 