	$(document).ready(function() {
		
		var pwd1 = $("#resetPwdNum1");
		var pwd2 = $("#resetPwdNum2");
		var memberId = $("#memberId").val();
		
		pwd2.blur(function() {
			var pwd1Text = pwd1.val();
			var pwd2Text = pwd2.val();
			// 정규식 영문,숫자 6-16자리
			var result = false;
			var pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,16}/;
			var patternPassResult1 = pattern.test(pwd1Text);
			var patternPassResult2 = pattern.test(pwd2Text);
			if (patternPassResult1 == true && patternPassResult2 == true) {
				result = true;
			} else {
				result = false;				
			}
			if(result){
				if (pwd1.val() == pwd2.val()) {
					console.log("같음");
					$("#result").text("비밀번호 동일.");
					$("#resetPwdBtn").click(function(){
						
					$.ajax({
							url:"/resetPwd",
							data:{pwd1:pwd1Text, memberId:memberId},
							type:"post",
							success: function(){
								alert("비밀번호 변경완료. 재로그인 해주세요");
								location.href="../../index.jsp";
								location.href ="../../index.jsp";
							},
							error: function(){
								alert("변경실패"); 
							}
							
							})
						/*location.href ="/resetPwd";*/
					});

				} else {
					console.log("다름");
					$("#result").text("비밀번호 다름");
					$("#resetPwdBtn").click(function(){
						alert("비밀번호가 맞지 않습니다.");
						window.location.reload();
					});
				}
			}else{
				alert("정규표현식 맞지않음");
			}	
		});
	});