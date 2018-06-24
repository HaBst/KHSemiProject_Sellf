function unlock(){
	 var result = confirm("선택한 회원을 불량회원에서 해제하겠습니까??");
	var items = [];
	$("input:checkbox[id='unlock']:checked").each(function(){
		items.push($(this).val());
	});
	
	if(result){
	 $.ajaxSettings.traditional = true;

	 $.ajax({
		url:"/managerBadUnlock",
		data:{"items":items},
		type:"POST",
		success:function(data)
		{
			location.replace("/managerBlackList");
		},
		error:function()
		{
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	 });
    }else{
    	alert('취소되었습니다.');
    }
}
 