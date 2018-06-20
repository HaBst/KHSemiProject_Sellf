<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*" import="java.util.*"%>
<% 
	NoticePageData npd = (NoticePageData)request.getAttribute("NoticePageData");
	ArrayList<Notice> list = new ArrayList<Notice>();
	String pageNavi = "";
	if(npd!=null){
		list = npd.getNoticeList(); //현재 페이지리스트 
		pageNavi = npd.getNoticePageNavi();  //navi 리스트 
	}
   FaqPageData fpd = (FaqPageData)request.getAttribute("FaqPageData");
   ArrayList<Faq> f_list = new ArrayList<Faq>();
   if(fpd!=null){
	   f_list = fpd.getFaqList(); //현재 페이지 리스트 
	   pageNavi = fpd.getFaqPageNavi();
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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

<script src="../../JS/board/boardJs.js?ver=1"></script>


<!-- Header 링크파일 -->

<script type="text/javascript" href="../../JS/common/header.js?ver=1"></script>

<!--<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css?ver=1">-->
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/footer.css">


<script>
 	var currentTab = "boardListArea";
	window.onload = function()
	{	
	//	var noticeTabName = request.getAttribute("noticeTab");	
	//	var tabArr = document.getElementsByClassName("noticeTab");
		//var btnArr = document.getElementsByClassName("menuBtn");
		//for(var i = 0;i<tabArr.length;i++)
		//{
			//if(tabArr[i].id = currentTab)
		//	{
		//		boardTapChange(btnArr[i], tabArr[i]);	
		//		break;
		//	}
	//	}
	}
	function boardTapChange(btn, boardName)
	{
		if(boardName.id=="boardListArea") location.href="/notice";
		if(boardName.id=="answerListArea") location.href="/faq";
		clearAll();
		btn.style = selectStyle;
		boardName.style.display = "block";	
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
				<a href="#">게시판</a> <a href="#">홈></a>
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
			<div class="hlLong"></div>
			<div id="boardContent">
				<div id="BoardList">


					<div class="noticeTab" id="boardListArea">
						<% if(npd!=null){%>

						<div id="bordTitle">
							<h3 style="float: left;">
								<strong>공지사항</strong>
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
							<% for(Notice n : list){%>
							<tr>
								<td><%=n.getNotice_pk()%></td>
								<td><a href="/noticeSelect?notice_pk=<%=n.getNotice_pk()%>"><%=n.getNotice_subject()%></a></td>
								<td><%=n.getNotice_main_admin_id_fk()%></td>
								<td><%=n.getNotice_registration_date()%></td>
								<td></td>
							</tr>
							<%}%>

						</table>
						<%}%>
					</div>


					<div class="noticeTab" id="answerListArea">
						<% if(fpd!=null){%>
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
							<% for(Faq f : f_list){%>
							<tr>
								<td><%=f.getFaq_pk()%></td>
								<td><a href="#"><%=f.getFaq_subject()%></a></td>
								<td>관리자</td>
								<td>2018-06-19</td>
								<td></td>
							</tr>
							<% }%>
							<tr>
								<td>6</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>

						</table>
						<%}%>

					</div>
					<div class="noticeTab" id="reviewListArea">
						<div id="bordTitle">
							<h3 style="float: left;">
								<strong>상품후기</strong>
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
							<tr>
								<td>6</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="/views/board/boardSelect.jsp">TEST</a></td>
								<td>관리자</td>
								<td>2018-06-14</td>
								<td>15</td>
							</tr>


						</table>
					</div>


					<div class="hlLong"></div>
					<div id="pagingArea">
						<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li><%= pageNavi %></li>

							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
						</nav>
					</div>

					<div id="searchArea">
						<select>
							<option selected>제목</option>
							<option>제목+내용</option>
							<option>내용</option>
							<option>작성자</option>
						</select> <input type="text" style="size: 100" />
					</div>
				</div>

			</div>
			</section>

			<footer id="footer">
			<div id="footerTest"
				style="width: 100%; height: 300px; background-color: gray;"></div>
			</footer>
		</div>
	</center>

</body>
</html>