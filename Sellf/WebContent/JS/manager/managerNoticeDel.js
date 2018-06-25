
function delNotice(){
	
	var result = confirm("체크한 공지사항을 삭제하시겠습니까??");
	var delItem = [];
	
	$("input:checkbox[id=delNotice]:checked").each(function(){
		delItem.push($(this).val());
	});
	
	if(result){
		$.ajaxSettings.traditional = true;
	
	$.ajax({
		url:"/managerDelNotice",
		data:{"delItem":delItem},
		type:"POST",
		success:function(data)
		{
			console.log(delItem);
			alert("삭제되었습니다.");
			location.reload("/managerNoticeboard");
		},
		error:function()
		{
			console.log("18");
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
	});
	}else
		{
		alert("삭제가 취소되었습니다.");
		}
	
}
function

