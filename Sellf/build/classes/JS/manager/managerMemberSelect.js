function memberSelect()
{
	$('#result').remove();
	var selInfo = $("#selInfo option:selected").val();
	var memberInfo = $("#memberInfo").val();
	var selGrade = $("#selGrade option:selected").val();
	var gender = $(':input:radio[name=gender]:checked').val();
	$.ajax({
		url:"/managerSelMember",
		type:"POST",
		data:{selInfo:selInfo,memberInfo:memberInfo,selGrade:selGrade,gender:gender},
		dataType:"json",
		success:function(data){
			console.log("success");
			for(var i=0;i<data.length;i++)
				{
					var tr = $("<tr>");
					var checkTd = $("<td><input type='checkbox' id='multi' />");
					var idTd = $("<td>").text(data[i].userEntireId);
					var nameTd = $("<td>").text(data[i].userEntireName);
					var gradeTd = $("<td>").text(data[i].userGrade);
					var phoneTd = $("<td>").text(data[i].userPhone);
					var genderTd = $("<td>").text(data[i].userGender);
					var enrollDateTd = $("<td>").text(data[i].userEnrollDate);
					var sellButTd = $("<td>").text("버튼");
					tr.append(checkTd);
					tr.append(idTd);
					tr.append(nameTd);
					tr.append(gradeTd);
					tr.append(phoneTd);
					tr.append(genderTd);
					tr.append(enrollDateTd);
					tr.append(sellButTd);
					$('#printMemberInfo').append(tr);
				}
			
		},
		  error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  }
	});
	}
