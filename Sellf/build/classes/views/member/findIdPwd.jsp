<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- jQuery 링크걸기 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>

<!-- ajax 링크걸기  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 내부 링크건 CSS -->
<link rel="stylesheet" href="../../CSS/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../../CSS/member/findIdPwd.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/common.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/footer.css">
<!-- 내부 js파일 -->
<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>
<script type="text/javascript" src="../../JS/member/findIdPwd.js"></script>
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<script type="text/javascript" src="../../JS/common/common.js"></script>
<script type="text/javascript" src="../../JS/bootstrap/bootstrap.min.js"></script>
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">

<title>아이디/비번찾기</title>
</head>
<body>
	<center>
		<!--wrapper -->
		<div id="wrapper">
			<!--header -->
			<header id="header"> <%@include
				file="../../views/common/header.jsp"%> </header>
			<br>
			<hr>
			<div id="content">
				<ul class="nav nav-tabs">
					<li><a href="#tab2" data-toggle="tab">&nbsp;아이디
							찾기&nbsp;&nbsp;&nbsp;</a></li>
					<li><a href="#tab3" data-toggle="tab">&nbsp;비밀번호
							찾기&nbsp;&nbsp;&nbsp;</a></li>
				</ul>
			
				<div class="tab-content">
					<div class="tab-pane active show" id="tab2">
						<div class="title">아이디 찾기</div>
						<br> <br>
							<form action="/findIdPwd" method="post">
						<div id="findIdContainer">
							<div>
								<h4>본인확인 이메일 인증</h4>
								<h6>등록한 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h6>
							</div>
							<br>
							<hr>
							<div id="inputContainer">
								
									<table>
										<tr>
											<td>이름</td>
											<td>
												<div class="input-group mb-3">
													<input type="text" class="form-control"
														placeholder="이름을 입력해주세요" aria-label="Username"
														aria-describedby="basic-addon1" name="memberName_id"
														id="memberName_id" style="width: 300px; height: 50px;">
												</div>
											</td>
										</tr>
										<tr>
											<td>이메일주소</td>
											<td>
												<div class="input-group mb-3">
													<input type="text" class="form-control"
														placeholder="메일 주소를 입력해주세요" aria-label="Username"
														aria-describedby="basic-addon1" name="memberEmail_id"
														id="memberEmail_id" style="width: 300px; height: 50px;">
												</div>
											</td>
											<td>

												<button type="button" class="btn btn-secondary"
													name="certificationBtn" id="IdcertificationBtn1"
													style="margin-bottom: 16px; height: 45px;"
													onclick="IdcertificationBtn();">인증번호받기</button>
											</td>
										</tr>
										<tr>
											<td></td>
											<td><div class="input-group mb-3">
													<input type="text" class="form-control" placeholder="인증번호"
														aria-label="Username" aria-describedby="basic-addon1"
														name="IDcertificationNum" id="IDcertificationNum"
														style="width: 300px; height: 50px;)">
												</div></td>
											<td></td>
										</tr>
									</table>
							
							</div>
							<br>
							<hr>
							<br>
							<script type="text/javascript">
								function findIDBtn() {
									var memberName = $("#memberName_id").val();
									var memberEmail = $("#memberEmail_id")
											.val();
									var IDcertificationNum = $(
											"#IDcertificationNum").val();
									if (memberName == "" || memberEmail == ""
											|| IDcertificationNum == "") {
										alert("입력 전체 안했어");
										location.reload();
										return false;
									} else {
										alert("입력 전체 다했어");
										return true;
									}
								}
							</script>
							<div>
								<button class="btn btn-secondary" id="nextBtn"
									onclick="return findIDBtn();">다음</button>
							</div>

							<br>
								</form>
						</div>
						

					</div>

					<div class="tab-pane" id="tab3">
						<div class="title">비밀번호찾기</div>
						<br> <br>
						<div id="findIdContainer">
							<div>
								<h4>본인확인 이메일 인증</h4>
								<h6>등록한 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h6>
							</div>
							<br>
							<hr>
							<div id="inputContainer">
								<table>
									<tr>
										<td>이름</td>
										<td>
											<div class="input-group mb-3">
												<input type="text" class="form-control"
													placeholder="이름을 입력해주세요" aria-label="Username"
													aria-describedby="basic-addon1" name="memberName_pwd"
													id="memberName_pwd" style="width: 300px; height: 50px;">
											</div>
										</td>
									</tr>
									<tr>
										<td>아이디</td>
										<td>
											<div class="input-group mb-3">
												<input type="text" class="form-control"
													placeholder="아이디을 입력해주세요" aria-label="Username"
													aria-describedby="basic-addon1" name="memberId_pwd"
													id="memberId_pwd" style="width: 300px; height: 50px;">
											</div>
										</td>
									</tr>
									<tr>
										<td>이메일주소</td>
										<td>
											<div class="input-group mb-3">
												<input type="text" class="form-control"
													placeholder="메일 주소를 입력해주세요" aria-label="Username"
													aria-describedby="basic-addon1" name="memberEmail_pwd"
													id="memberEmail_pwd" style="width: 300px; height: 50px;">

											</div>
										</td>
										<td>

											<button type="button" class="btn btn-secondary"
												name="certificationBtn" id="certificationBtn"
												style="margin-bottom: 16px; height: 45px;"
												onclick="PwdcertificationNum();">인증번호받기</button>
										</td>
									</tr>
									<tr>
										<td></td>
										<td><div class="input-group mb-3">
												<input type="text" class="form-control" placeholder="인증번호"
													aria-label="Username" aria-describedby="basic-addon1"
													name="PwdcertificationNum" id="PwdcertificationNum"
													style="width: 300px; height: 50px;">
											</div></td>
										<td></td>
									</tr>

								</table>
							</div>
							<br>
							<hr>
							<br>
							<script type="text/javascript">
								function resetPwdBtn() {
									var memberName = $("#memberName_pwd").val();
									var memberId = $("#memberId_pwd").val();
									var memberEmail = $("#memberEmail_pwd")
											.val();
									var IDcertificationNum = $(
											"#PwdcertificationNum").val();

									if (memberName == "" || memberId == ""
											|| memberEmail == ""
											|| IDcertificationNum == "") {
										alert("입력 전체 안했어");
										location.reload();
									} else {
										alert("입력 전체 다했어");
										location.href = "../../views/member/resetPwd.jsp";
									}
								}
							</script>
							<div>
								<button type="button" class="btn btn-secondary" id="PwdnextBtn"
									onclick="resetPwdBtn();">다음</button>

							</div>
							<br>
						</div>
					</div>
				</div>
			</div>
			<footer id="footer" style="background-color:white;"> <%@include
				file="../../views/common/footer.jsp"%> </footer>

		</div>
	</center>
</body>
</html>