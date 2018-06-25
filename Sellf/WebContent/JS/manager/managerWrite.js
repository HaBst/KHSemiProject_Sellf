function cancel()
{
	var result = window.confirm("작성한 내용이 모두 사라집니다.작성을 취소하시겠습니까??");
	if(result)
		{
		alert("작성이 취소되었습니다.")
		location.href = "/managerNoticeBoard"
		}
	
}