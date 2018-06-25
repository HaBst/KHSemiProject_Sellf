<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.text.*" import="manager.model.vo.*" %>
<% ManagerBoardPageData mbpd = (ManagerBoardPageData)request.getAttribute("pageData");
	ArrayList<ManagerBoard> boardList = mbpd.getBoardList();
	String pageNavi = mbpd.getPageNavi();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<script src="/JS/manager/managerNoticeDel.js"></script>
<title>게시판 관리</title>

</head>

<body>
<%@ include file="/views/manager/managerBase.jsp" %>
		<main class="page-content">
		<div class="container-fluid">

			<div class="row">
				<div
					class="col-md-10 col-md-offset-1 col-md-11 col-md-offset-1 main"> <!-- 내용집어넣는 곳입니다. -->
					<br> <br>
					<h3>게시판</h3>
					<div id="noticePan">
						<ul class="nav nav-pills nav-fill" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" href="#noticeBoard" data-toggle="tab" role="tab" aria-controls="noticeBoard" aria-selected="true">공지사항</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#freeBoard" data-toggle="tab" role="tab" aria-controls="freeBoard" aria-selected="false">자유게시판</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#reviewBoard" data-toggle="tab" role="tab" aria-controls="reviewBoard" aria-selected="false">리뷰게시판</a>
							</li>

						</ul>
						<div class="tab-content" id="TabContent"><!-- 공지사항 -->
							<div id="noticeBoard" class="tab-pane fade show active">
								<table class="table">
									<tr>
										<th>글 번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>작성일</th>
										<th>조회수</th>
										<th>삭제</th>
									</tr> 
									<%for(ManagerBoard mb:boardList){%> 
									<tr>
									<td><%= mb.getBoardNo() %></td>
									<td><a href="/managerNoticeRead?noticeNo=<%=mb.getBoardNo()%>"><%= mb.getSubject() %></a></td>
									<td><%= mb.getWriteId() %></td>
									<td><%= mb.getWriteDate() %></td>
									<td><%= mb.getViewsCount() %></td>
									<td><input type="checkbox" id="delNotice" value="<%=mb.getBoardNo() %>" /%></td>
									</tr>
									<%} %>
								</table>
								<center><label><%=pageNavi%></label></center>
								<a type="button" class="btn btn-primary btn-sm" href="/views/manager/managerNoticeWrite.jsp">공지사항 작성</a>
							<button type="button" class="btn btn-danger btn-sm" onclick="delNotice();">공지사항삭제</button>
							</div>
							
							<!--  -->
							<div id="freeBoard" class="tab-pane fade"> <!-- 자유게시판 -->
								<table class="table">
									<tr>
										<th>글 번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>작성일</th>
										<th></th>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
							
							<!-- 리뷰게시판 -->
							<div id="reviewBoard" class="tab-pane fade">
								<table class="table">
									<tr>
										<th>글 번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>작성일</th>
										<th></th>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
</body>
</html>