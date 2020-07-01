<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="images/图标.png" />
<title>Library|Login</title>

<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<!--此处使用的是bootstrap1.min.css，（注意一）并不是bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap1.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/login_style2.css">


<!-- js文件 -->
<script src="js/modernizr-2.6.2.min.js"></script>

</head>
<body class="style-3">
	<div style="background-color: #AD0205; height: 100px; ">
		<div style="padding: 10px 0;">
			<h2 align="center" style="color: white;">Administrator</h2>
		</div>
    </div>
	
	<div class="container">
		
		<div class="row">
			<div class="col-md-5 col-md-push-4">


				<!-- 登录表单 -->
				<form class="fh5co-form animate-box"
					data-animate-effect="fadeInRight" method="post"
					onsubmit="return check()" action="LoginServlet1">
					<h2>Login</h2>

					<c:choose>
						<c:when test="${!allTrue}">
							<div class="form-group">
								<label for="username" class="sr-only">Name</label> <input
									type="text" class="form-control " id="username" name="username"
									required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="User Name">
							</div>
							<div class="form-group">
								<label for="password" class="sr-only">Password</label> <input
									type="password" class="form-control" id="password" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" name="password"
									placeholder="Password" autocomplete="off">
							</div>
						</c:when>
						<c:when test="${rNoError}">
							<div class="form-group">
								<label for="username" class="sr-only">Name</label> <input
									type="text" class="form-control red " id="username"
									name="username" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="User Name Error!">
							</div>
							<div class="form-group">
								<label for="password" class="sr-only">Password</label> <input
									type="password" class="form-control red " id="password"
									required="required" name="password" placeholder="Password" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" autocomplete="off">
							</div>
						</c:when>
						<c:when test="${rPassError}">
							<div class="form-group">
								<label for="username" class="sr-only">Name</label> <input
									type="text" class="form-control red " id="username"
									name="username" required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="User Name">
							</div>
							<div class="form-group">
								<label for="password" class="sr-only">Password</label> <input
									type="password" class="form-control red " id="password"
									required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" name="password"
									placeholder="Password Error!" autocomplete="off">
							</div>
						</c:when>
					</c:choose>
					<div class="form-group">
						<label for="remember"><input type="checkbox" id="remember">
							Save the password</label>
					</div>
					<div class="form-group">
						<input id="submit" type="submit" value="Login"
							class="btn btn-primary" onclick="setMyText()">
					</div>
				</form>


			</div>
		</div>
		<div class="row" style="padding-top: 60px; clear: both;">
			<div class="col-md-12 text-center">
				<p>
					<small>&copy; Technical support <a href="#" target="_blank">Library
							support team</a>
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
