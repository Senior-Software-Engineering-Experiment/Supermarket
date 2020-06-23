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
	<div id="loadingDiv" name="loadingDiv"></div>


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
				<form class="fh5co-form animate-box"
					data-animate-effect="fadeInRight" name="forgotPassForm"
					id="forgotPassForm" action="RecoverLibPassServlet" method="post">
					<h2>Retrieve Password</h2>
					<div class="form-group">
						<label for="username" class="sr-only">Name</label> <input
							type="text" class="form-control" id="username" name="username"
							required
							oninvalid="setCustomValidity('Please fill in this field!')"
							oninput="setCustomValidity('')" placeholder="UserName">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Email</label> <input
							type="email" class="form-control" id="email" required
							oninvalid="setCustomValidity('Please fill in this field!')"
							oninput="setCustomValidity('')" name="email" placeholder="Email">
					</div>
					<div class="form-group">
						<p>
							Old user？ <span><a href="login.jsp">Login</a></span>
						</p>
					</div>
					<div class="form-group">
						<input id="check" type="button" value="Submit"
							onclick="checkTheInfo()" class="btn btn-primary">
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
	<script src="js/Untitled-2.js"></script>
</body>
<script>
	function checkTheInfo() {
		var username = document.getElementById("username").value;
		var email = document.getElementById("email").value;
		$
				.ajax({
					type : "POST",
					async : true,
					cache : false,
					url : "ForgotPassServlet",
					contentType : "application/x-www-form-urlencoded",
					data : {
						"username" : username,
						"email" : email
					},
					traditional : true,
					beforeSend : function() {
						var html = '<div style="height: 100%;'
								+ 'opacity: 0.5;'
								+ 'position: fixed;'
								+ 'z-index:999;'
								+ 'width: 100%;" >'
								+ '<img src="images/loading.gif" width="100%" height="100%" />'
								+ '</div>';
						document.getElementById("loadingDiv").style.zindex = 999;
						$("#loadingDiv").append(html);
					},
					success : function(data) {
						$("#loadingDiv").empty();
						var objs = eval("(" + data + ")");
						var isRight = objs.allRight;
						var fit = objs.accountFitEmail;
						var type = objs.accountType;
						var code = objs.code;
						var userName = objs.userName;
						if (isRight && fit && type && code.length != 1) {
							$("#forgotPassForm").empty();
							var div = '<h2>Retrieve Password</h2>'
									+ '<div class="form-group">'
									+ '<input  id="realCode" name="realCode"' 
									+ 'type="hidden" value="'
									+ code
									+ '">'
									+ '<label for="username" class="sr-only">Verification Code</label> <input '
									+ 'type="text" class="form-control"'
									+ 'id="userCode" name="userCode"'
									+ 'required'
									+ 'oninvalid="setCustomValidity('
									+ '"Please fill in this field!"'
									+ ')"'
									+ 'oninput="setCustomValidity('
									+ '""'
									+ ')"'
									+ 'placeholder="Verification Code" >'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<input id="recoverPass" type="button" value="Submit"'
									+ 'class="btn btn-primary" onclick="checkTheCode('
									+ userName + ')">' + '</div>';
							$("#forgotPassForm").append(div);
						} else if (isRight && fit && type && code.length == 1) {
							alert("Send email successfully!");
							window.location.href = "login.jsp";

						} else if (isRight && fit == false && type == true)
							alert("email or username is wrong!");
						else if (isRight && fit && type == false)
							alert("your username does not exist!");
					},
					error : function() {
						alert("connect failed!");
					}
				});
	}
</script>
<script type="text/javascript">
	function checkTheCode(userName) {
		var realCode = document.getElementById("realCode").value;
		var userCode = document.getElementById("userCode").value;
		if (realCode == userCode) {
			$("#forgotPassForm").empty();
			var div = '<h2>Retrieve Password</h2>'
					+ '<div class="form-group">'
					+ '<input name="recoveringLibName" id="recoveringLibName"' 
						+ 'type="hidden" value="'
						+ userName
						+ '">'
					+ '<label for="username" class="sr-only">Your new password</label> <input '
					+ 'type="password" class="form-control" id="libNewPass" name="libNewPass"'
					+ 'required'
					+ 'oninvalid="setCustomValidity('
					+ '"Please fill in this field!"'
					+ ')"'
					+ 'oninput="setCustomValidity('
					+ '""'
					+ ')" placeholder="Password" >'
					+ '</div>'
					+ '<div class="form-group">'
					+ '<label for="password" class="sr-only">Input again</label> <input '
					+ 'type="password" class="form-control" id="againNewPass" required '
					+ 'oninvalid="setCustomValidity('
					+ '"Please fill in this field!"'
					+ ')"'
					+ 'oninput="setCustomValidity('
					+ '""'
					+ ')" name="againNewPass"'
					+ 'placeholder="Password" >'
					+ '</div>'
					+ '<div class="form-group">'
					+ '<input id="submitPass" type="button" value="Submit"'
					+ 'class="btn btn-primary" onclick="checkThePassAndSubmit()">'
					+ '</div>';
			$("#forgotPassForm").append(div);
		} else
			alert("The code is wrong, please try again!");
	}
</script>
<script>
	function checkThePassAndSubmit() {
		var username = document.getElementById("recoveringLibName").value;
		var fstPass = document.getElementById("libNewPass").value;
		var secPass = document.getElementById("againNewPass").value;
		if (fstPass == secPass)
			$
					.ajax({
						type : "POST",
						async : true,
						cache : false,
						url : "RecoverLibPassServlet",
						contentType : "application/x-www-form-urlencoded",
						data : {
							"recoveringLibName" : username,
							"libNewPass" : fstPass
						},
						traditional : true,
						success : function(data) {
							var objs = eval("(" + data + ")");
							if (objs.status == false)
								alert("Your new password should not be the same to your old password!");
							else {
								div = '<meta http-equiv="refresh" content=3;url=login.jsp>'
										+ '<div>'
										+ '<h2>'
										+ 'Change password successfully!<br>'
										+ 'Attention!!Page will redirect in<span id="num" style="display=inline;">3</span>seconds to login page!'
										+ '</h2>' + '</div>';
								$("#forgotPassForm").empty();
								$("#forgotPassForm").append(div);
							}
						},
						error : function() {
							alert("connect failed!");
						}
					});
		else
			alert("These two passwords are not the same!Please try again!");
	}
</script>
<script type='text/javascript'>
	var i = 3;
	function getTime() {
		document.getElementById('num').innerHTML = "<font color='red'>" + i
				+ "</font>";
		i -= 1;
		var x = setTimeout('getTime()', 1000)//1000毫秒=1秒
		if (i <= 0) {
			clearTimeout(x);
		}
	}
	window.οnlοad = getTime;//开始执行倒计时
</script>
</html>
