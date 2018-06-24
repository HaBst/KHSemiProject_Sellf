$(document).ready(function(){
		$.ajax({
			url:"/managerBlackList",
			type:"POST",
			dataType:"json",
			success:function(data){
				for(var i=0;i<data.length;i++){
				var tr = $("<tr>");
				var checkTd = $("<td><input type='checkbox' name='unlock' value="+data[i].userEntireId+" />");
				var idTd = $("<td>").text(data[i].userEntireId);
				var nameTd = $("<td>").text(data[i].userEntireName);
				var gradeTd = $("<td>").text(data[i].userGrade);
				var phoneTd = $("<td>").text(data[i].userPhone);
				var genderTd = $("<td>").text(data[i].userGender);
				var enrollDateTd = $("<td>").text(data[i].userEnrollDate);
				tr.append(checkTd);
				tr.append(idTd);
				tr.append(nameTd);
				tr.append(gradeTd);
				tr.append(phoneTd);
				tr.append(genderTd);
				tr.append(enrollDateTd);
				$('#resultBlackList').append(tr);
				}
			},
			error:function(){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
});

function unlock(){
	var items =[];
	$('input:checkbox[name=unlock]:checked').each(function(){
		items.push($(this).val());
	});
	jQuery.ajaxSettings.traditional = true;

	 $.ajax({
		url:"/managerBannedUnlock",
		data:{"items":items},
		type:"POST",
		success:function(data)
		{
			console.log(items);
		},
		error:function()
		{
			
		}
	 });
    }
 