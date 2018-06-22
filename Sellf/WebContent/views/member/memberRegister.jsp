<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
.header {
	background-color: darkorange;
	height: 60px;
}

.container {
	width:1000px;
	margin-left: auto;
	margin-right: auto;
	overflow: auto;
}

.footer {
	background-color: darkorange;
	height: 60px;
}

.
.sign-up {
	display: block;
	margin-top: 30px;
	margin-bottom: 30px;
}

.sign-up>ul {
	padding: 0px;
	margin-bottom: 30px;
}

.sign-up>ul li {
	text-align: center;
	margin: 0 2px;
	display: inline-block;
	width: 24%;
	border-bottom: 3px solid gray;
}

.sign-up>ul li h3 {
	font-weight: 600;
	color: gray;
}

.sign-up>h4 {
	font-weight: 600;
	margin-top: 0px;
	margin-bottom: 20px;
}

.sign-up li.active {
	border-bottom: 3px solid black;
}

.sign-up li.active h3 {
	color: black;
}

.sign-up li.active h3 small {
	color: black;
}

.sign-up-title {
	display: inline-block;
	font-size: 18px;
	text-align: center;
	width: 100%;
	margin-top: 50px;
	position: relative;
}

.sign-up-title>p {
	font-size: 14px;
	color: gray;
}

.register>h4 {
	font-weight: 600;
	padding-bottom: 20px;
	border-bottom: 1px solid black;
	margin-bottom: 0px;
}

#regi-input {
	
}

.regi-tr {
	height: 40px;
}

.regi-tr>td:nth-of-type(1) {
	width: 200px;
}

.regi-tr>td:nth-of-type(2) {
	width: 600px;
}

.check-img {
	width: 12px;
	height: 12px;
}

.regist
{
	margin-bottom: 30px;
}
</style>
<meta charset="UTF-8">
<title>Sell:F 회원가입</title>
<link rel="stylesheet" href="/CSS/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">	
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">	
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="/JS/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
	<script type="text/javascript" src="../../JS/common/adv.js"></script>
	<header id="header"> <%@include
				file="/views/common/header.jsp"%> </header><br>
	<div class="container">
		<div class="sign-up-title">
			회원가입
			<p>회원이 되셔서 다양한 혜택을 누려보세요.
		</div>
		<div class="sign-up">
			<ul>
				<li><h3>
						STEP1 <small>가입방법 선택</small>
					</h3></li>
				<li><h3>
						STEP2 <small>이용약관 동의</small>
					</h3></li>
				<li class="active"><h3>
						STEP3 <small>회원정보 입력</small>
					</h3></li>
				<li><h3>
						STEP4 <small>회원가입 완료</small>
					</h3></li>
			</ul>
		</div>
		<div class="register">
			<h4>회원정보 입력</h4>
			<table id="regi-input" class="table table-bordered">
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 이름</td> 
					<td><input type="text" name="userName"></td>
				</tr>
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 아이디</td>
					<td><input type="text" name="userId"><button onclick="checkId();">중복확인</button> <span id="idcheck">공백 없는 영문,숫자 포함
						6-20자 </span></td>
				</tr>
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 비밀번호</td>
					<td><input type="password" name="userPwd"><span id="pwdcheck"> 공백 없는 영문,숫자
						포함 6-20자 </span></td>
				</tr>
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 비밀번호 확인</td>
					<td><input type="password" name="userPwdRe"> 비밀번호 확인을
						위해 한번 더 입력하세요. <span id="pwdrecheck"></span></td>
				</tr>
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 생년월일</td>
					<td><select id="year">
							<option>선택</option>
					</select> <select id="month">
							<option>선택</option>
					</select> <select id="day">
							<option>선택</option>
					</select>
					</td>
				</tr>
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 성별</td>
					<td><input type="radio" name="userGender" value="M">남자 
					<input type="radio" name="userGender" value="F">여자 </td>
				</tr>
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 이메일</td>
					<td><input type="text" name="emailFirst"> @ 
					<input type="text" name="emailSecond">
					<select id="emailSelect" onchange="$('input[name=emailSecond]').val(this.value);">
						<option>직접선택</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
					</select></td>
				</tr>
				
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 전화번호</td>
					<td><input type="text" name="phone1" size="3" maxlength="3" onkeydown="onlyNumber(this)"> - 
					<input type="text" name="phone2" size="4" maxlength="4" onkeydown="onlyNumber(this)"> - 
					<input type="text" name="phone3" size="4" maxlength="4" onkeydown="onlyNumber(this)"></td>
				</tr>
				
				<tr class="regi-tr">
					<td><img src="/img/check.png" class="check-img"> 주소</td>
					<td><input type="text" name="postNum" class="postcodify_postcode5" readonly="readonly"> <button id="postcodify_search_button">주소찾기</button><br>
					<input type="text" name="addrInfo" class="postcodify_address" size="50" readonly="readonly">
					<input type="text" name="addrDetail" class="postcodify_details" size="50"></td>
				</tr>
				<tr class="regi-tr">
					<td>&nbsp&nbsp 관심 분야</td>
					<td>
					<table>
					<tr>
						<td><input type="checkbox" name="userInter" value="M01"> 전자제품</td>
						<td><input type="checkbox" name="userInter" value="M02"> 패션의류</td>
						<td><input type="checkbox" name="userInter" value="M03"> 패션잡화</td>
						<td><input type="checkbox" name="userInter" value="M04"> 화장품/미용</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userInter" value="M05"> 스포츠/레저</td>
						<td><input type="checkbox" name="userInter" value="M06"> 완구/문구/취미</td>
						<td><input type="checkbox" name="userInter" value="M07"> 여행/문화</td>
						<td><input type="checkbox" name="userInter" value="M08"> 도서/음반/DVD</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userInter" value="M09"> 유아동/출산</td>
						<td><input type="checkbox" name="userInter" value="M10"> 가구/인테리어</td>
						<td><input type="checkbox" name="userInter" value="M11"> 생활/건강</td>
						<td><input type="checkbox" name="userInter" value="M12"> 자동차</td>
						
					</tr>
					<td><input type="checkbox" name="userInter" value="M13"> 해외명품</td>
					<tr>
					</tr>
						</table></td>
				</tr>
			</table>
			<div class="regist" align="center">
			<form  action="/memberJoin" name="signup" onsubmit="return register()" method="post">
			<input type="hidden" value="" name="memberName">
			<input type="hidden" value="" name="memberId">
			<input type="hidden" value="" name="memberPwd">
			<input type="hidden" value="" name="memberBirth">
			<input type="hidden" value="" name="memberGender">
			<input type="hidden" value="" name="memberEmail">
			<input type="hidden" value="" name="memberPhone">
			<input type="hidden" value="" name="memberAddr">
			<input type="hidden" value="" name="memberInter">
			<input type="submit" class="btn btn-primary btn-lg"
				style="background-color: black; border-radius: 0px; width: 200px" value="회원가입">
			<a href="" class="btn btn-default btn-lg "
				style="background-color: lightgray; border-radius: 0px; width: 200px">취소</a>
				</form>
		</div>
		</div>
		<!-- footer -->
		<div align="center">
		<footer>
			<%@include file="../../views/common/footer.jsp" %>
		</footer>
	</div>
	</div>

	<script type="text/javascript">
	var pwdCheck = false;
	var pwdReCheck = false;
	var birth = [0,0,0];
	var genderCheck = false;
	var email = [0,0];
	var phone = [0,0,0];
	var post = [0,0,0];
		$(document).ready(function appendYear() {
			var date = new Date();
			var year = date.getFullYear();
			var selectValue = document.getElementById("year");
			var optionIndex = 0;

			for (var i = year - 100; i <= year; i++) {
				selectValue.add(new Option(i + "년", i), optionIndex++);
			}
		});

		$(document).ready(function appendMonth() {
			var selectValue = document.getElementById("month");
			var optionIndex = 0;

			for (var i = 1; i <= 12; i++) {
				selectValue.add(new Option(i + "월", i), optionIndex++);
			}
		});

		$(document).ready(function appendDay() {
			var selectValue = document.getElementById("day");
			var optionIndex = 0;

			for (var i = 1; i <= 31; i++) {
				selectValue.add(new Option(i + "일", i), optionIndex++);
			}
		});
		
		var reg = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //검증용
		
		// ID 검증
		function checkId() {
			var id = $('input[name=userId]').val();
			//console.log(id);
			window.open("/views/member/checkId.jsp?checkId="+id,"ID 중복확인","width=700px, height=300px, left=100, top=100");
		}
		
		// PW 검증
		var userPwd = $("input[name='userPwd']");
		userPwd.blur(function(){
			var upwd = $("input[name='userPwd']").val();
			 if(!reg.test(upwd)){
				 $('#pwdcheck').text("  잘못된 입력입니다.");
				 $('#pwdcheck').css("color","red");
				 }
			 else{
			 $('#pwdcheck').text("  가능합니다.");
			 $('#pwdcheck').css("color","#00ff00");
			pwdCheck = true;
				}
		});
		
		// PWID 검증
		var userPwdRe = $("input[name='userPwdRe']");
		userPwdRe.blur(function(){
			var upwdre = $("input[name='userPwdRe']").val();
			var upwd = $("input[name='userPwd']").val();
			 if(upwd != upwdre){
				 $('#pwdrecheck').text("  일치하지 않습니다.");
				 $('#pwdrecheck').css("color","red");
				 $('input[name=memberPwd]').val('');
				 }
			 else{
			 $('#pwdrecheck').text("  일치합니다.");
			 $('#pwdrecheck').css("color","#00ff00");
			 $('input[name=memberPwd]').val(upwd);
			 pwdReCheck=true;
				}
		});
		
		$(document).on('change',"input[name=userName]",function (e) {	
			$('input[name=memberName]').val($('input[name=userName]').val());
			});
		
		$(document).on('change',"#year",function (e) {	
			birth[0] = $('#year').val();
			});
		
		$(document).on('change',"#month",function (e) {
			birth[1] = $('#month').val();
			});
		$(document).on('change',"#day",function (e) {
			birth[2] = $('#day').val();
			});
		
		$(document).on('change',"input[name=userGender]",function (e) {
			genderCheck=true;
			$('input[name=memberGender]').val($(':radio[name="userGender"]:checked').val());
			});
		
		$(document).on('change',"input[name=emailFirst]",function (e) {
			email[0] = $('input[name=emailFirst]').val();
			if(email[0]=='')
				{
				email[0]="0";
				}
			});
		
		$(document).on('change',"input[name=emailSecond]",function (e) {
			email[1] = $('input[name=emailSecond]').val();
			if(email[1]=='')
			{
			email[1]="0";
			}
			});
		
		$(document).on('change',"#emailSelect",function (e) {
			email[1] = $('input[name=emailSecond]').val();
			if(email[1]=='')
			{
			email[1]="0";
			}
			});
		
		$(document).on('change',"input[name=phone1]",function (e) {
			phone[0] = $('input[name=phone1]').val();
			if(phone[0]=='')
			{
				phone[0]="";
			}
			});
		
		$(document).on('change',"input[name=phone2]",function (e) {
			phone[1] = $('input[name=phone2]').val();
			if(phone[1]=='')
			{
				phone[1]="";
			}
			});
		
		$(document).on('change',"input[name=phone3]",function (e) {
			phone[2] = $('input[name=phone3]').val();
			if(phone[2]=='')
			{
				phone[2]="";
			}
			});
		
		
		// 숫자만 입력하게 제한하는 함수
		function onlyNumber(obj) {
		    $(obj).keyup(function(){
		         $(this).val($(this).val().replace(/[^0-9]/g,""));
		    }); 
		}
		
		function register() {
			birth[0] = $('#year').val();
			birth[1] = $('#month').val();
			birth[2] = $('#day').val();
			signup.memberBirth.value= birth[0]+"-"+birth[1]+"-"+birth[2];
			signup.memberEmail.value= email[0] +"@"+email[1];
			signup.memberPhone.value= phone[0] +"-"+phone[1] +"-"+phone[2];
			signup.memberAddr.value= $('input[name=postNum]').val() +"/"+$('input[name=addrInfo]').val()+"/"+$('input[name=addrDetail]').val();
			//signup.memberInter.value=
		      $('input:checkbox[name=userInter]').each(function() {
		         if($(this).is(':checked'))
		        	 signup.memberInter.value += ","+($(this).val());
		      });
			if(signup.memberName.value==""){
				alert("이름을 입력해주세요.");
				signup.memberName.focus();
				return false;
			}
			else if(signup.memberId.value==""){
				alert("아이디를 입력해주세요.");
				signup.memberId.focus();
				return false;
			}
			else if(signup.memberPwd.value=="")
				{
				alert("패스워드를 입력해주세요.");
				signup.memberPwd.focus();
				return false;
				}
			else if(signup.memberBirth.value.indexOf("선택") != -1 )
			{
			alert("생년월일을 입력해주세요.");
			signup.memberBirth.focus();
			return false;
			}
			else if(signup.memberGender.value=="" )
			{
			alert("성별을 입력해주세요.");
			signup.memberGender.focus();
			return false;
			}
			else if(signup.memberEmail.value=="" || email[0]=="0" || email[1]=="0" )
			{
			alert("이메일을 입력해주세요.");
			signup.memberEmail.focus();
			return false;
			}
			else if(signup.memberPhone.value=="" || phone[0]=="0" || phone[1]=="0" || phone[2]=="0")
			{
			alert("전화번호를 입력해주세요.");
			signup.memberPhone.focus();
			return false;
			}
			else if(signup.memberAddr.value=="//" || $('input[name=postNum]').val()=="" || $('input[name=addrInfo]').val()=="" || $('input[name=addrDetail]').val()=="")
			{
			alert("주소를 입력해주세요.");
			signup.memberAddr.focus();
			return false;
			}
			else
			{
			return true;
			}
		};
		
	</script>
	
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script> <!-- 주소 검색 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script> <!-- 주소 api -->

</body>
</html>