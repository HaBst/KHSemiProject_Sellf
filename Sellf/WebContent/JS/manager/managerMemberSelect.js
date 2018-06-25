function memberSelect()
{
	
	var selInfo = $("#selInfo option:selected").val();
	var memberInfo = $('#selInfoVal').val();
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
		},
		  error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  }
	});
	}
