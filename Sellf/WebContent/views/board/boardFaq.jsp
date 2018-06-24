<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*" import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>  -->
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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<!-- 내부 js파일 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="../../JS/bootstrap/bootstrap.min.js?ver=1"></script>



<!-- Header 링크파일 -->

<script type="text/javascript" href="../../JS/common/header.js?ver=1"></script>

<!--<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css?ver=1">-->
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/footer.css">

<script type="text/javascript">
var btnArr = [];
var tabArr = [];
var selectStyle = "background-color: RGBA(216,85,161,1); color:white; border:1px solid RGBA(216,85,161,1);";
var nonSelectStyle = "background-color:white; color:black; border:1px solid lightgray;";

	window.onload = function() {

		btnArr = document.getElementsByClassName("menuBtn");
		btnArr[0].style = nonSelectStyle;
		btnArr[1].style = selectStyle;
		btnArr[2].style = nonSelectStyle;
		
		
		$('#answerListArea').css("display","block");
		$.ajax({
			url : "/faq",
			type : "get",
			success : function(result) {
				<%
				FaqPageData fpd = (FaqPageData) request.getAttribute("FaqPageData");
				ArrayList<Faq> f_list = new ArrayList<Faq>();
				String pageNavi ="";
				if (fpd != null) {
					f_list = fpd.getFaqList(); //현재 페이지 리스트 
					pageNavi = fpd.getFaqPageNavi();
					System.out.println("list : " + f_list.get(1).getFaq_content() +" , pageNavi : " + pageNavi +","+f_list.size());
				}
				else
				{
					fpd = null;
					System.out.println(fpd);
					f_list = new ArrayList<Faq>();
				}
			%>
			},
			error : function() {
				console.log("실패");
			}
		});
	}
	function moveNotice() {
		location.href="/notice";
	}
	function moveFaq() {
		location.href="/faq";
	}
	function moveReview() {
		location.href="/review";
	}
</script>
<title>게시판</title>

</head>
<body>
	<center>
		<!--  Wrraper    -->
		<div id="wrapper">
			<!--  Header -->
			<header id="header"> <%@include
				file="../../views/common/header.jsp"%> <!--<div style="background-color: gray; width: 100%; height: 200px;">
			</div>--> </header>
			<section id="content">
			<div id="topLeftLink">
				<a href="/notice">게시판</a> <a href="/index.jsp">홈></a>
			</div>
			<div id="topMenu">
				<button class="menuBtn" onclick="moveNotice()">
					<span>공지사항</span>
				</button>
				<button class="menuBtn" onclick="moveFaq()">
				자주 묻는 질문
				</button>
				<button class="menuBtn" onclick="moveReview()">
				상품 후기
				</button>
			</div>
			<div class="hlLong"></div>
			<div id="boardContent">
				<div id="BoardList">


					<div class="noticeTab" id="boardListArea">
					</div>


					<div class="noticeTab" id="answerListArea">
						<%
							if (fpd != null) {
						%>
						<div id="bordTitle">
							<h3 style="float: left;">
								<strong>자주 묻는 질문</strong>
							</h3>
						</div>
						<div class="hlLong"></div>
						<table id="boardTable">
							<tr>
								<th style="width: 5%;">NO</th>
								<th style="width: 65%;">SUBJECT</th>
								<th style="width: 10%;">게시자</th>
								<th style="width: 10%;">날짜</th>
							</tr>
							
							<%
							for(int i=0;i<f_list.size();i++)
							{
								System.out.println(f_list.get(i).getFaq_pk());
							%>
							<tr>
								<td><%=f_list.get(i).getFaq_pk()%></td>
								<td><a href="/faqSelect?faq_pk=<%=f_list.get(i).getFaq_pk()%>"><%=f_list.get(i).getFaq_subject()%></a></td>
								<td>관리자</td>
								<td>2018-06-19</td>
							</tr>
							<%
								}
							%>
							
						</table>
						<%
							}else if (fpd == null) {
						%>
						<div id="bordTitle">
							<h3 style="float: left;">
								<strong>자주 묻는 질문</strong>
							</h3>
						</div>
						<div class="hlLong"></div>
						<table id="boardTable">
							<tr>
								<th style="width: 5%;">NO</th>
								<th style="width: 65%;">SUBJECT</th>
								<th style="width: 10%;">게시자</th>
								<th style="width: 10%;">날짜</th>
								<th style="width: 10%;">조회수</th>
							</tr>
						</table>
						<%
							}
						%>

					</div>
					<div class="noticeTab" id="reviewListArea">
					</div>


					<div class="hlLong"></div>
					<div id="pagingArea">
						<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li><%=pageNavi%></li>

							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
						</nav>
					</div>

				</div>

			</div>
			</section>

			<div align="center">
	<footer>
					<%@include file="../../views/common/footer.jsp" %>
	</footer>
	</div>
		</div>
	</center>

</body>
</html>