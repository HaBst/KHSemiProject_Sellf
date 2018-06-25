var currentPage = 1;
function memberSelect()
{
	
	var selInfo = $("#selInfo option:selected").val();
	var memberInfo = $("#selInfoVal").val();
	var selGrade = $("#selGrade option:selected").val();
	var gender = $(':input:radio[name=gender]:checked').val();
	$.ajax({
		url:"/managerSelMember",
		data:{"selInfo":selInfo,"memberInfo":memberInfo,"selGrade":selGrade,"gender":gender},
		datatype:"json",
		type:"POST",
		success:function(data){
			console.log("success");
			console.log(data);
			var parent = $("#printMemberInfo");
			var naviarea = $("#naviArea");
			var result = "";
		var navi ="";
		result+='<tr><th>아이디</th><th>고객명</th><th>등급</th><th>휴대폰 번호</th><th>성별</th><th>가입일자</th></tr>';
		for(var i=0;i<data.list.length;i++)
			{
			result+='<tr>'+
					'<td>'+data.list[i].user_id+'</td>'+
					'<td>'+data.ist[i].user_entire_user_grade_id_fk+'</td>'+
					'<td>'+data.list[i].user_phone+'</td>'+
					'<td>'+data.list[i].user_gender+'</td>'+
					'<td>'+data.list[i].user_enrolldate+'</td>'+
				'</tr>';
			
			} parent.html(result);
            naviArea.html(data.pageNavi);
            console.log(data.pageNavi);
		},

		  error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  }
	});
	}
function cancel(){
	
	location.href="/views/manager/managerMemberSelect.jsp";
}
