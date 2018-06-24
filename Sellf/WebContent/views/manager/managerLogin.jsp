<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<style>
    body {
        background: ;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }
    
</style>
<center>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">Sell:F관리자님! 환영합니다!</div>
            </div>
            <div class="panel-body">
                <form action="/managerLogin" method="POST" id="login-form">
                    <div>
                        <input type="text" class="form-control" name="userId" placeholder="Username" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="userPwd" placeholder="Password">
                    </div>
                    <div>
                        <input type="submit" class="form-control btn btn-outline-warning"value="로그인!"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</center>
</body>
</html>