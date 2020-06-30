<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<form action="PersonInformationServlet2" method="post">
	<input type="hidden" name="sno" value="">
</form>


<script type="text/javascript">
	if (
<%=request.getAttribute("iii")%>
	== null) {
		document.forms[0].submit();
	}
</script>

<script>
	function pass(email_address){
       var re=/^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
    	
    	if(document.getElementById('name').value.length==0){
    		alert("The name cannot be empty!")
    	}
    	else if(re.test(email_address)){
    	
	 $.ajax({
         type:"POST", //请求方式  
         url:"ChangeInformationServlet", //请求路径  
         cache: false,     
         data:{//传参  
             "email":$("#email").val(),
             "name":$("#name").val(),
         },
	 });
	 alert("change success");
	 location.reload();
    	                  	}
    		else  alert("Enter the correct email address.");
};
</script>

<head>

<meta charset="utf-8">
<link rel="icon" type="image/png" href="images/图标.png" />
<title>售货员|个人信息</title>

<!-- Bootstrap core CSS -->
<link href="css/person.bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet">
<link href="css/all.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/resume.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/page.css">
<!-- 二维码js -->
<script src="js/JsBarcode.all.min.js"></script>
</head>


<body id="page-top" style="display: none; overflow: auto !important;">
	<div id="nav"></div>

	<div class="container-fluid p-0" id="right">

		<div id="right1"></div>

		<hr class="m-0">

		<section class="resume-section p-3 p-lg-5 d-flex align-items-center"
			id="ing">
			<div class="w-100">
				<h2 class="mb-5">查看消费记录</h2>
				<div class="finishTaskList">
					<!--借阅中的书籍-->
					<table class="pendingTask" id="booking">

					</table>
				</div>
			</div>
		</section>

		<hr class="m-0">

		<section class="resume-section p-3 p-lg-5 d-flex align-items-center"
			id="compelet">
			<div class="w-100">
				<h2 class="mb-5">Returned:</h2>
				<div class="pendingTaskList">
					<table class="pendingTask" id="bookcompelet">


					</table>
				</div>
				<footer class="page" id="bookPageFooter">
					<ul class="pagecontent">
						<li><select id="bookPageSelect" name="bookPageSelect"
							onchange="turnToBook(this.options[this.options.selectedIndex].value)">
						</select> Page</li>
						<li class="pagegray" id="totalPageLi"></li>
						<li><a id="bookPageUp" onclick=bookPageDown()> p</a>&nbsp;&nbsp;</li>
						<li><a id="bookPageDown" onclick=bookPageUp()> L</a>&nbsp;&nbsp;</li>
					</ul>
				</footer>
			</div>
		</section>

		<hr class="m-0">

		<hr class="m-0">

		<section class="resume-section p-3 p-lg-5 d-flex align-items-center"
			id="awards">
			<div class="w-100">
				<h2 class="mb-5">Fine to be paid:</h2>
				<div class="finishTaskList">
					<!--已完成项目列表-->
					<table class="finishTask" id="bookover">

					</table>
				</div>
			</div>
		</section>
	</div>


	<div style="display: none">
		<nav class="navbar navbar-expand-lg navbar-dark  fixed-top"
			id="sideNav" style="background: #343a40;">
			<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span
				class="d-block d-lg-none" id="readerName1"></span> <!--界面缩小后生效--> <span
				class="d-none d-lg-block"> <img
					class="img-fluid img-profile rounded-circle mx-auto mb-2"
					src="images/profile.jpg" alt=""> <!--此处修改头像图片-->
			</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">个人信息</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						data-toggle="modal" data-target="#changeimformation">修改个人信息</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						data-toggle="modal" data-target="#changepassword">修改密码</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#ing">消费记录</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#compelet">Books Returned</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#awards">Fine</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="index.jsp">主页</a></li>
				</ul>
			</div>
		</nav>
		<section class="resume-section p-3 p-lg-5 d-flex align-items-center"
			id="about">
			<div class="w-100">
				<h1 class="mb-0" id="readerName2"></h1>
				<div class="subheading mb-5" id="readerNo"></div>

				<!-- 插入二维码 -->
				<img id="barcode" />
				<script>
                         JsBarcode("#barcode", ${userName});
                         JsBarcode(".barcode").init();
                     </script>

				<!--社交软件-->
				<div class="social-icons" style="margin-top: 80px;">
					<a href="#"> <i class="fab fa-linkedin-in"></i>
					</a> <a href="#"> <i class="fab fa-github"></i>
					</a> <a href="#"> <i class="fab fa-twitter"></i>
					</a> <a href="#"> <i class="fab fa-facebook-f"></i>
					</a>
				</div>


			</div>
		</section>
	</div>


	<div class="modal fade" id="changeimformation" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">编辑个人信息</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form class="form-horizontal">
							<div class="form-group ">
								<label for="sName" class="col-xs-3 control-label">姓名：</label>
								<div class="col-xs-8 ">
									<input type="text" class="form-control input-sm duiqi"
										placeholder="" id="name" name="name"
										value="${reader.readerName}"
										oninvalid="setCustomValidity('Please fill in this field!')"
										oninput="setCustomValidity('')" required>
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">电话：</label>
								<div class="col-xs-8 ">
									${reader.readerNo}
									<!--使用EL语言实现输入框有默认值-->
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">邮箱：</label>
								<div class="col-xs-8 ">
									<input type="email" class="form-control input-sm duiqi"
										placeholder="" id="email" name="email" value="${reader.email}"
										oninvalid="setCustomValidity('Please fill in this field!')"
										oninput="setCustomValidity('')" required>
									<!--使用EL语言实现输入框有默认值-->
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-xs btn-white"
						data-dismiss="modal" style="background: red; color: white;">取消</button>
					<button type="button" class="btn btn-xs btn-green"
						onclick="pass(document.getElementById('email').value)"
						data-dismiss="modal" style="background: green; color: white;">提交</button>
					<!-- 点击保存后数据要保存到数据库中，待实现，与添加数据一样-->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>



	<div class="modal fade" id="changepassword" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">修改密码</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form class="form-horizontal">
							<div class="form-group ">
								<label for="sName" class="col-xs-3 control-label">旧密码：</label>
								<div class="col-xs-8 ">
									<input type="password" class="form-control input-sm duiqi"
										placeholder="" id="oldpassword" name="oldpassword"
										oninvalid="setCustomValidity('Please fill in this field!')"
										oninput="setCustomValidity('')" required>
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">新密码：</label>
								<div class="col-xs-8 ">
									<input type="password" class="form-control input-sm duiqi"
										id="newpassword1" placeholder="" value="" name="newpassword1"
										oninvalid="setCustomValidity('Please fill in this field!')"
										oninput="setCustomValidity('')" required>
									<!--使用EL语言实现输入框有默认值-->
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">确认新密码：</label>
								<div class="col-xs-8 ">
									<input type="password" class="form-control input-sm duiqi"
										placeholder="" id="newpassword2" name="newpassword2" value=""
										oninvalid="setCustomValidity('Please fill in this field!')"
										oninput="setCustomValidity('')" required>
									<!--使用EL语言实现输入框有默认值-->
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-xs btn-white"
						data-dismiss="modal" style="background: red; color: white;">取消</button>
					<button type="button" class="btn btn-xs btn-green"
						onclick="password()" data-dismiss="modal"
						style="background: green; color: white;">提交</button>
					<!-- 点击保存后数据要保存到数据库中，待实现，与添加数据一样-->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>


	<script type="text/javascript">
	window.onload = function init(){
		document.getElementById("page-top").style.display = "block"; 
		turnToBook(1);
	};
</script>

	<!-- Bootstrap core JavaScript -->
	<script src="js/person.jquery.min.js"></script>
	<script src="js/person.bootstrap.bundle.min.js"></script>
	<!-- 我们用的js函数 -->
	<script src="js/personInformation.js"></script>
	<script src="js/resume.min.js"></script>
	<script src="js/JsBarcode.all.min.js"></script>

	<script>	
        function password(){
        	if(document.getElementById('oldpassword').value.length<6){
        		alert("oldpassword cannot less than 6!")
        	}
        	else if(document.getElementById('newpassword1').value.length<6){
        		alert("newpassword cannot less than 6!")
        	}
        	else if(document.getElementById('newpassword1').value!=document.getElementById('newpassword2').value){
        		alert("two newpassword should be the same!")
        	}
        	else if(document.getElementById('newpassword1').value==document.getElementById('oldpassword').value){
        		alert("the newpassword cannot be the same with oldpassword!")
        	}
        	else if(document.getElementById('oldpassword').value!=${reader.readerPassword}){
        		alert("error oldpassword");
        	}
        	else {
        		$.ajax({
        	         type:"POST", //请求方式  
        	         url:"Changepasswordservlet", //请求路径  
        	         cache: false,     
        	         data:{//传参  	
        	             "oldpassword":$("#oldpassword").val(),
        	             "newpassword":$("#newpassword1").val(),
        	         },
        	        
        		 });
        		 alert("修改成功!");
        		 location.reload();
            }
}
</script>
</body>

</html>
