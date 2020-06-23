<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="images/图标.png" />
<title>Library|Retrieve Password</title>

<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<!--此处使用的是bootstrap1.min.css，（注意一）并不是bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap1.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/login_style.css">


<!-- js文件 -->
<script src="js/modernizr-2.6.2.min.js"></script>

</head>
<body class="style-2">

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<ul class="menu">
					<li class="active"><a href="retrieve.jsp">Retrieve</a></li>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="login.jsp">Login</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 ">


				<!-- 提交表单 -->
				<form name="codeForm" id="codeForm"
					class="fh5co-form animate-box" data-animate-effect="fadeInRight">
					<h2>Retrieve Password</h2>
					<div class="form-group">
								<input  id="realCode" name="realCode" 
								type="hidden" value='<%=request.getSession().getAttribute("realCode")%>'>
								<label for="username" class="sr-only">Verification Code</label> <input
									type="text" class="form-control" id="userCode" name="userCode"
									required
									oninvalid="setCustomValidity('Please fill in this field!')"
									oninput="setCustomValidity('')" placeholder="Verification Code" >
							</div>
					<div class="form-group">
						<input id="recoverPass" type="button" value="Submit"
							class="btn btn-primary" onclick="checkTheCode()">
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
	<script>
		function checkTheCode(){
			var userCode = document.getElementById("userCode").value;
			var realCode = document.getElementById("realCode").value;
			if(userCode == realCode) window.location.href = "libRecoverPass.jsp";
			else alert('The verification code is wrong!Please check in your email!');
		}
	</script>
</body>

</html>