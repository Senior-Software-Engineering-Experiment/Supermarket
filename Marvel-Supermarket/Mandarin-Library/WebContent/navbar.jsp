<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch">
<head>
<meta charset="UTF-8" />
<title>Navigation</title>
<link rel="stylesheet" href="css/navbar.css">
</head>
<body>
	<div>
		<!--头部-->
		<div class="head">
			<div class="logo">
				<img src="images/NEWLOGO.png" alt="library_logo">
			</div>
			<div class="head-nav">
				<div class="head-nav-con clearFloat">
					<ul>
						<c:choose>
							<c:when test="${sessionScope.userName == null}">
								<li style="width:60px;margin-right: 30px;margin-left: 50px"><a href="index.jsp#home"
									class="hvr-underline-from-center ahome">主页</a></li>
								<li style="width:60px;margin-right: 30px;margin-left: 30px"><a href="index.jsp#post"
									class="hvr-underline-from-center apost">公告</a></li>
								<li style="width:60px;margin-right: 30px;margin-left: 30px"><a href="index.jsp#find"
									class="hvr-underline-from-center aservices">搜索</a></li>
								<li style="width:130px;margin-right: 30px;margin-left: 30px"> <a href="index.jsp#about"
									class="hvr-underline-from-center aabout">关于我们</a></li>
								<li style="width:130px;margin-right: 30px;margin-left: 30px"><a href="index.jsp#team"
									class="hvr-underline-from-center ateam">团队信息</a></li>
								<li style="width:130px;margin-right: 30px;margin-left: 30px"><a href="contact.jsp" class="hvr-underline-from-center"
									target="_blank">联系我们</a></li>
								<li style="width:60px;margin-right: 30px;margin-left: 30px"><a href="login.jsp"
									class="hvr-underline-from-center " >登录</a></li>
							</c:when>
							<c:when test="${sessionScope.userName != null}">
								<li style="width:100px"><a href="index.jsp#home"
									class="hvr-underline-from-center ahome">主页</a></li>
								<li style="width:100px"><a href="index.jsp#post"
									class="hvr-underline-from-center apost">公告</a></li>
								<li style="width:140px"><a href="index.jsp#find"
									class="hvr-underline-from-center aservices">搜索商品</a></li>
								<li style="width:140px"><a href="index.jsp#team"
									class="hvr-underline-from-center ateam">团队信息</a></li>
								<li style="width:140px"><a href="contact.jsp" class="hvr-underline-from-center"
									target="_blank">联系我们</a></li>
								<li style="width:140px"><a href="personInformation.jsp"
									class="hvr-underline-from-center " target="_blank">个人信息</a></li>
								<form action="LogoutServlet" name="tuichuForm"></form>
								<li style="width:100px"><a href="#"
									class="hvr-underline-from-center " data-toggle="modal"
									data-target="#logout">登出</a></li>
							</c:when>
						</c:choose>

					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="logout" role="dialog"
			aria-labelledby="gridSystemModalLabel" aria-hidden="true" style="margin-top: 100px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">登出</h4>
					</div>
						<div class="modal-body">
							<div class="container-fluid">确定退出系统吗 ?</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-xs btn-xs btn-white"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-xs btn-xs btn-green"
								value="Confirm" onclick="tc()" data-toggle="modal" data-target="#hasLogout">确定</button>
							<!-- 点击保存后数据要保存到数据库中，待实现-->
						</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="hasLogout" role="dialog"
			aria-labelledby="gridSystemModalLabel" >
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
						<div class="modal-body">
							<div class="container-fluid">Has etired !!!</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-xs btn-xs btn-white">OK</button>
							<!-- 点击保存后数据要保存到数据库中，待实现-->
						</div>
				</div>
			</div>
		</div>
</body>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	function tc() {
		$("#hasLogout").modal("show");
		document.forms["tuichuForm"].submit();
	}
</script>
</html>