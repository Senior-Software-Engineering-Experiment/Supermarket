<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="images/图标.png" />
<title>Supermarket|Login</title>

<link rel="shortcut icon" href="favicon.ico">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

<!--此处使用的是bootstrap1.min.css，（注意一）并不是bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap1.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/login_style.css">


<!-- js文件 -->
<script src="js/modernizr-2.6.2.min.js"></script>

</head>
<body class="style-3"> 

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<ul class="menu">
					<li><a href="retrieve.jsp">返回</a></li>
					<li><a href="index.jsp">主页</a></li>
					<li class="active"><a href="login.jsp">登录</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-push-8">


				<!-- 登录表单 -->
				<form action="LoginServlet" method="post"
					class="fh5co-form animate-box" data-animate-effect="fadeInRight"
					onsubmit="return check()">
					<h2>登录</h2>

					<c:choose>
						<c:when test="${!allTrue}">
							<div class="form-group">
								<label for="username" class="sr-only">用户名</label> <input
									type="text" class="form-control" id="username" name="username"
									required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="输入用户名" >
							</div>
							<div class="form-group">
								<label for="password" class="sr-only">密码</label> <input
									type="password" class="form-control" id="password" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" name="password"
									placeholder="输入密码" autocomplete="off">
							</div>
						</c:when>
						<c:when test="${rNoError}">
							<div class="form-group">
								<label for="username" class="sr-only">姓名</label> <input
									type="text" class="form-control red " id="username" name="username"
									required oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="用户名不正确">
							</div>
							<div class="form-group">
								<label for="password" class="sr-only">密码</label> <input
									type="password" class="form-control" id="password"
									required="required" name="password" placeholder="Password" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" autocomplete="off">
							</div>
						</c:when>
						<c:when test="${rPassError}">
							<div class="form-group">
								<label for="username" class="sr-only">姓名</label> <input
									type="text" class="form-control" id="username" name="username"
									required oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="Input UserName">
							</div>
							<div class="form-group">
								<label for="password" class="sr-only">密码</label> <input
									type="password" class="form-control red" id="password" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" name="password"
									placeholder="密码不正确" autocomplete="off">
							</div>
						</c:when>
					</c:choose>
					<div class="form-group">
						<label for="remember"> <input type="checkbox"
							id="remember">保存密码
						</label>
					</div>
					<div class="form-group">
						<p>
							新用户？ <span>联系经理注册</span>
						</p>
						<p>
							<a href="#"><span>忘记密码?</span></a>
						</p>
					</div>
					<div class="form-group">
						<input id="submit" type="submit" value="登录"
							class="btn btn-primary" onclick="setMyText()">
					</div>
				</form>


			</div>
		</div>
		<div class="row" style="padding-top: 60px; clear: both;">
			<div class="col-md-12 text-center">
				<p>
					<small>&copy; 技术支持 <a href="#" target="_blank">Marvel Supermarket team</a>
					</small>
				</p>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>
</body>
</html>
