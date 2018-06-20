<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="board.model.vo.*" import="member.model.vo.*" import="java.util.*" %>
<% 
	Notice n = (Notice)request.getAttribute("notice");
	ArrayList<NoticeComment> list = (ArrayList<NoticeComment>)request.getAttribute("comment"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script
  src="http://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 내부 링크건 CSS -->
<!-- <script type="text/javascript" src="../../JS/common/header.js?ver=1"></script> -->
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/header.css?ver=1">
<link rel="stylesheet"
	href="../../CSS/bootstrap/bootstrap.min.css?ver=1" />
<link rel="stylesheet" href="../../CSS/common/common.css?ver=1" />
<link rel="stylesheet" href="../../CSS/board/boardStyle.css?ver=1" />
<link rel="stylesheet" href="../../CSS/board/boardSelectStyle.css?ver=1" />
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<!-- 내부 js파일 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="../../JS/bootstrap/bootstrap.min.js?ver=1"></script>

<script src="../../JS/board/boardJs.js?ver=1"></script>

<!-- Header 링크파일 -->

<script type="text/javascript" src="../../JS/common/header.js?ver=1"></script>

<!--<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css?ver=1">-->
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/footer.css">

<title>게시판</title>

</head>
<body>
	<center>
		<!--  Wrraper    -->
		<div id="wrapper">
			<!--  Header -->
			<header id="header">
			<div style="background-color: gray; width: 100%; height: 200px;">
			</div>
			</header>
			<section id="content">
			<div id="topLeftLink">
				<a href="#">Test</a> <a href="#">게시판> </a> <a href="#">홈></a>
			</div>
			<div id="topMenu">
				<div class="menuBtn" onclick="boardTapChange(this,boardListArea);">
					<span>공지사항</span>
				</div>
				<div class="menuBtn" onclick="boardTapChange(this,answerListArea);">
					<span>자주 묻는 질문</span>
				</div>
				<div class="menuBtn" onclick="boardTapChange(this,reviewListArea);">
					<span>상품후기</span>
				</div>
			</div>
			<div class="hlLongBold"></div>
			<div id="boardContent">
				<div id="BoardList">
					<div class="noticeTab" id="boardListArea">
						<div id="bordTitle">
							<h3 style="float: left;">
								<strong>공지사항 > <span id="titleName"></span><%=n.getNotice_subject()%></strong>
							</h3>
						</div>
						<div class="hlLongBold"></div>
						<div id="boardContent">
							<div id="titleArea">
								<h3>
									<strong>
										<div><%=n.getNotice_pk()%></div>
										<div id="titleInfo"><%=n.getNotice_subject()%></div>
									</strong>
								</h3>
							</div>
							<div class="vlLongLIght"></div>
							<div id="writerInfoArea">
								<div style="width: 10%;">
									<strong>작성자</strong>
								</div>
								<div style="width: 30%;"><%=n.getNotice_pk()%></div>
								<div style="width: 10%;">
									<strong>등록일</strong>
								</div>
								<div style="width: 20%;"><%=n.getNotice_registration_date()%></div>
								<div style="width: 10%;">
									<strong>조회수</strong>
								</div>
								<div style="width: 20%;">15</div>
							</div>
							<div class="vlLongLIght"></div>
							<div id="answerContent">
								<h3>
									<%=n.getNotice_content()%>
								</h3>
							</div>
							<div class="vlLongLIght"></div>
							<div id="nextAndPrevArea">
								<div class="boardItemNP">
									<div class="listTitle">
										<a> <img src="../../img/btn_bbs_icon_prev.gif" /> 다음글 <span
											id="nextTitle">다음글이 없습니다.</span>
										</a>
									</div>
								</div>
								<div class="vlLongLIght"></div>
								<div class="boardItemNP">
									<div class="listTitle">
										<a> <img src="../../img/btn_bbs_icon_next.gif" /> 이전글 <span
											id="nextTitle">Test</span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="hlLongBold"></div>
					</div>
				</div>
				<div id="bottomBtnList">
					<div class="menuBtn" style="float: left;">목록</div>
					<div class="menuBtn" id="comment">댓글달기</div>
					<div class="menuBtn" style="float: right;">뒤로가기</div>
				</div>
			</div>
			<div id="commentArea">
			  
		<%for(NoticeComment nc : list){%>	
		작성자 : <%=nc.getNotice_comment_user_id_fk()%> / 작성일 : <%=nc.getNotice_comment_date()%> / <br> 
 		<label id=<%=nc.getNotice_comment_pk()%>><%=nc.getNotice_comment_content()%></label>
 		<%} %>
				<div id="newCommentArea">
				  	<div id="CommentWriterId"></div><br>
				  	<div id= "CommentContext"></div>
				</div>
				<textarea rows="6" cols="140" style="display:none" id="commentTextArea"> </textarea>
				<div id="commentBtn" style="display:none">작성완료<br></div>
			</div>
			</section>
		</div>
		<footer id="footer"> <%@include file="../../views/common/footer.jsp"%> <!--  <div id="footerTest" style="width:100%; height:300px; background-color:gray;"></div>-->
		</footer>
	</center>
	<script> 

	$(document).ready(function(){
		$('#comment').click(function(){
		 $('#commentTextArea').slideToggle(500);
		 $('#commentBtn').slideToggle(500);
			$('#commentTextArea:visible');
		});
		
		$('#commentBtn').click(function(){
			var writer =$('#CommentWriterId'); 
			var str = "";
			str = "테스트작성자이름"; 
			writer.html(str);
			$('#CommentContext').html($('#commentTextArea').val());
			$('#commentTextArea').val("");
			$('#commentTextArea').slideToggle(500);
			 $('#commentBtn').slideToggle(500);
		});
	});

</script>
<style> 
    #CommentWriterId
    {
    float:left;
    font-weight:800;
    }
	#CommentContext
    {
    float:left;
    }

</style>
</body>
</html>