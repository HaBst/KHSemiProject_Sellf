<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="/TradingAgency/WebContent/CSS/common.css" type="text/css"/>
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
     
    <script src="http://code.jquery.com/jquery-3.3.1.js"
      integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
      crossorigin="anonymous"></script>
    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="../../CSS/category.css" type="text/css"/>
    <script src="../../JS/common.js"></script>    

</head>
<body>
	 <div id="wrapper">
        <div id="header">
            헤더
        </div>
        <div id="nivigation">
            네비게이션
        </div>
        <div id="content">
            <div id="categoryTitle" class="dropdown">              
                 
            </div>
            <div id="categoryImageSlide">
                하위카테고리<br>
                이미지 슬라이드
            </div>
            <div id="categoryBtnList">
                
            </div>
            <div id="categorySortBtnList">
                
            </div>
            <div id="categoryItemList">
                
            </div>
             <%@ include file="category_title.html" %>
            
        </div>
    </div>
</body>
</html>