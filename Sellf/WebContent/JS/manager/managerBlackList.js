
function unlock(){
	var items = [];
	$('input:checkbox[id=unlock]:checked').each(function(){
		items.push($(this).val());
	});
	jQuery.ajaxSettings.traditional = true;

	 $.ajax({
		url:"/managerBannedUnlock",
		data:items,
		type:"POST",
		success:function(data)
		{
			console.log(items);
		},
		error:function()
		{
			console.log("fail");
		}
	 });
    }
 