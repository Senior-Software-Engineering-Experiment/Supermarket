<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>
<!doctype html>
<html lang="en">
<style>
.biaoti {
	margin-left: 120px;
	margin-top: -25px;
	width: 560px;
}

.return {
	position: absolute;
	right: 30px;
	top: 149px;
}

.select {
	width: 20px;
}

.sousuo {
	right: 5px;
	top: 30px;
}

.logout {
	position: absolute;
	right: 5px;
	top: 30px;
}

.pg_header {
	height: 48px;
	top: 70px;
	left: 0;
	right: 0;
	background-color: #AD0205;
	line-height: 48px;
	vertical-align: bottom;
}

.pg_dl1 {
	font-family: inherit;
	margin-left: 100px;
	line-height: 20px;
	font-size: 40px;
	padding: 0 40px;
	color: #AD0205;
	height: 0px;
	margin-top: px;
}

.pg_dl2 {
	line-height: 2px;
	font-size: 20px;
	color: black;
	height: 0px;
	width: 19.5%;
	float: right;
	margin-top: 15px;
}

.word {
	padding: 9px 12px 5px;
	line-height: 40px;
	height: 40px;
	color: black;
	width: 20%;
	margin: 0 127px !important;
}

.tian {
	color: red;
	float: right;
	font-size: 12px;
	margin-right: -30px;
	margin-top: -25px;
}

.time {
	color: white;
	float: right;
	font-weight: bolder;
	font-size: 18px;
	margin-top: 10px;
	margin-right: 20px;
}
</style>
<head>

<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>经理</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/confirm.js"></script>
<script src="js/checkPass.js"></script>
<script src="js/fineCheck.js"></script>
<script src="js/jquery.js"></script>
<script src="js/highcharts.js"></script>
<script>
	$(function() {
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");
			;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
		$("#topAD").click(function() {
			$("#topA").toggleClass(" glyphicon-triangle-right");
			$("#topA").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topBD").click(function() {
			$("#topB").toggleClass(" glyphicon-triangle-right");
			$("#topB").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topCD").click(function() {
			$("#topC").toggleClass(" glyphicon-triangle-right");
			$("#topC").toggleClass(" glyphicon-triangle-bottom");
		});
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		})
	})
</script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
</head>

<body style="overflow: auto !important">

	<input type="hidden" name="admin" />
	<div id="wrap">

		<div id="logoDiv">
			<p id="logoP">
				<img id="logo" alt="" src="images/logo.jpg">
			</p>
			<!--此处的图片为logo-->
			<input type="image" src="images/标题.png" class="biaoti" />
			<p class="pg_dl2" id="welcome"></p>
			<form action="LogoutServlet" name="tuichuForm"></form>
			<input type="image" src="images/注销1.jpg" class="logout"
				onclick="disp_confirm()"
				style="border-style: none; width: 50px; height: 40px; background-repeat: no-repeat;" />

		</div>
		<div class="pg_header">
			<p class="time"></p>
			<p class="time" id="dateTime"></p>

			<style type="text/css">
a {
	text-decoration: none;
	color: #666;
}
</style>
			</style>
		</div>
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">

			<div id="personInfor">
				<div id="logo2">
					<img src="images/admin.jpg">
				</div>
				<p class="word" id="userName"></p>
				<!--实现从数据库读取名字写入-->
				<p>&nbsp;</p>
				<div class="meun-title">Management</div>
				<p>&nbsp;</p>
				<div class="meun-item" href="#user" id="clickH" aria-controls="user"
					role="tab" data-toggle="tab">
					<img src="images/icon_user_grey.png">售货员管理
				</div>
				<p>&nbsp;</p>
				<div class="meun-item" href="#chan" aria-controls="chan" role="tab"
					data-toggle="tab">
					<img src="images/icon_change_grey.png">修改密码
				</div>
				<p>&nbsp;</p>
				<div class="meun-item" href="#money" aria-controls="money"
					role="tab" data-toggle="tab">
					<img src="images/icon_rule_grey.png">查看收入
				</div>
				<p>&nbsp;</p>
				<div class="meun-item" href="#post" aria-controls="post" role="tab"
					data-toggle="tab">
					<img src="images/icon_rule_grey.png">公告管理
				</div>
			</div>
		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">

				<!--用户管理模块-->
				<div role="tabpanel" class="tab-pane" id="user">
					<div class="check-div form-inline">
						<div class="col-xs-3" style="padding-left: 2px">
							<button class="btn btn-yellow btn-xs" id="add"
								data-toggle="modal" data-target="#addUser">Add
								librarian</button>
						</div>
						<div class="col-xs-41">
							<select id="type">
								<option value="userName">UserName</option>
								<option value="name">Name</option>
							</select> <input type="text" class="form-control input-sm"
								id="searchBlank" placeholder="Enter to search"
								style="color: black">
							<form action="LogoutServlet" name="tuichuForm"></form>

							<input type="image" src="images/搜索.png" class="sousuo"
								style="width: 30px !important; float: right; margin-top: -45px !important; margin-left: 330px !important"
								onclick="search()" />

						</div>

					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-222 ">UserName</div>
							<div class="col-xs-223">Name</div>
							<div class="col-xs-224">Sex</div>
							<div class="col-xs-222">Telephone</div>
							<div class="col-xs-225">Email</div>
							<div class="col-xs-222">Operation</div>
						</div>

						<!-- 展示管理员列表 -->
						<div class="tablebody" id="displayLibrarian"></div>
						<!-- 搜索结果 -->
						<div class="tablebody" id="searchResult" style="display: none">

						</div>

						<!-- 传值用的昂 -->
						<div id="u" style="display: none"></div>
						<div id="n" style="display: none"></div>
						<div id="s" style="display: none"></div>
						<div id="e" style="display: none"></div>
						<div id="t" style="display: none"></div>
						<div id="divid" style="display: none"></div>

					</div>
					<!--页码块-->
					<footer class="footer">
						<ul class="pagination">
							<li><select id="librarianPageSelect"
								onchange="turnToPage(this.options[this.options.selectedIndex].value)"></select>
								Page</li>
						</ul>
					</footer>

					<!--弹出添加用户窗口-->
					<div class="modal fade" id="addUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">Add
										librarian</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">

										<form class="form-horizontal" onsubmit="return checkForm()">

											<div class="form-group">
												<label for="lUserName" class="col-xs-3 control-label">UserName：</label>
												<div class="col-xs-8 ">
													<input class="form-control input-sm duiqi" id="lUserName"
														name="lUserName" type="text" onblur="checklUserName()"
														oninput="checklUserName()"
														placeholder="Please input userName..." value=""> <span
														class="default" id="unameErr"></span>
												</div>
											</div>

											<div class="form-group">
												<label for="Name" class="col-xs-3 control-label">Name：</label>
												<div class="col-xs-8 ">
													<input class="form-control input-sm duiqi" id="Name"
														name="lName" type="text" onBlur="checkName()"
														oninput="checkName()" placeholder="Please enter name..."
														value=""> <span class="default" id="nameErr"></span>
												</div>
											</div>

											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">Sex：</label>
												<div class="kong">
													&nbsp; &nbsp; Male <input id="male" type="radio"
														style="margin-left: 5px; margin-top: 13px" name="lSex"
														value="male"> &nbsp; &nbsp; &nbsp; &nbsp;Female<input
														id="female" type="radio" style="margin-left: 5px;"
														name="lSex" value="female">
												</div>
											</div>

											<div class="form-group">
												<label for="userPhone" class="col-xs-3 control-label">Telephone：</label>
												<div class="col-xs-8">
													<input class="form-control input-sm duiqi" type="text"
														id="userPhone" name="lTel" onBlur="checkPhone()"
														oninput="checkPhone()"
														placeholder="Please enter telephone number..." value="">
													<span class="default" id="phoneErr"></span>
												</div>
											</div>

											<div class="form-group">
												<label for="userEmail" class="col-xs-3 control-label">Email：</label>
												<div class="col-xs-8">
													<input class="form-control input-sm duiqi" type="text"
														id="userEmail" name="lEmail" onBlur="checkEmail()"
														oninput="checkEmail()" placeholder="Please enter email..."
														value=""> <span class="default" id="emailErr"></span>
												</div>
											</div>

											<div class="modal-footer">
												<button type="button" class="btn btn-xs btn-white"
													data-dismiss="modal">Cancel</button>
												<input type="submit" onclick="addManager()" value="Finish"
													class="btn btn-xs btn-green">
											</div>

										</form>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出修改用户窗口-->
					<div class="modal fade" id="reviseUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">Edit
										librarian account</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">Name：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>


											<!--                              <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">Sex：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="form-control input-sm duiqi" id="sSex" placeholder="">
                                            </div>
                                        </div>
                                   
                                        
                                        
                                      <div class="form-group">
                    <label for="sLink" class="col-xs-3 control-label">Sex：</label>
				    <div class="kong" >
                        &nbsp; &nbsp; Male<input type="radio"  id="sSex" style="margin-left:5px; margin-top:13px" name="lSex" value="male">    &nbsp; &nbsp; &nbsp; &nbsp;Female<input type="radio"  id="sSex" style="margin-left:5px;" name="lSex" value="female">
                    </div>
                </div>  
                             -->

											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">Sex：</label>
												<div class="select">
													<select id="sSex" name="lSex" style="margin-top: 8px;">
														<option value='male'>male</option>
														<option value='female'>female</option>
													</select>
												</div>
											</div>


											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">Email：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sEmial" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">Telephone：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sTelep" placeholder="">
												</div>
											</div>

										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button id="closeEdit" type="button"
										class="btn btn-xs btn-white" data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-xs btn-green "
										onclick="edit()">Save</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
				</div>
				<!-- 修改密码模块 -->
				<div role="tabpanel" class="tab-pane" id="chan">

					<div
						style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 520px; margin: 50px auto;">

						<form class="form-horizontal">

							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Old
									Password：</label>
								<div class="col-xs-5">
									<input id="oldPassword" type="password" name="oPass"
										class="form-control input-sm duiqi" placeholder=""
										onBlur="checkold()" oninput="checkold()"> <span
										id="div1" class="tian" style="margin-top: -25px">*must
										be filled</span>
								</div>
							</div>


							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">New
									Password：</label>
								<div class="col-xs-5">
									<input id="newPassword1" type="password" name="Password"
										class="form-control input-sm duiqi" placeholder=""
										onBlur="checkpassword()" oninput="checkpassword()"> <span
										id="div2" class="tian" style="margin-top: -25px">*must
										be filled</span>
								</div>
							</div>

							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Repeat
									New Password：</label>
								<div class="col-xs-5">
									<input id="newPassword2" type="password" name="pass"
										class="form-control input-sm duiqi" placeholder=""
										onBlur="checkrepassword()" oninput="checkrepassword()">
									<span id="div3" class="tian" style="margin-top: -25px">*must
										be filled</span>
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<button type="button" class="btn btn-xs btn-white"
										onclick="delete1()" style="margin-right: 20px !important">Cancel</button>

									<button type="button" class="btn btn-xs btn-green"
										onclick="changeP()">OK</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!--查看收入模块-->
				<%@include file = "moneyManage.jsp" %>

				<!-- 公告管理模块 -->
				<div role="tabpanel" class="tab-pane" id="post">
					<div class="check-div form-inline">

						<div class="col-xs-3" style="padding-left: 2px">
							<button class="btn btn-yellow btn-xs" id="addPost"
								data-toggle="modal" data-target="#addNotice">添加公告</button>
						</div>

						<div class="col-xs-41">
							<select class=" form-control" name="sort" id="postsort">
								<option>PostNo</option>
								<option>Post Time First</option>
								<option>Recently Post First</option>
							</select> <input type="text" class="form-control input-sm"
								id="postcontent" placeholder="Enter to search"
								style="color: black"> <input type="image"
								src="images/搜索.png"
								style="width: 30px !important; float: right; margin-top: -45px !important; margin-left: 330px !important"
								onclick="postsearch()" />

						</div>

					</div>

					<div class="data-div">
						<div class="row tableHeader">
							<!--调整col-lg- 这里的数字可以实现宽度的变化-->
							<div class="col-xs-222 ">序号</div>
							<div class="col-xs-222 ">公告编号</div>
							<div class="col-xs-222 ">公告名称</div>
							<div class="col-xs-222 ">时间</div>
							<div class="col-xs-222 ">内容</div>
							<div class="col-xs-222 ">售货员</div>
						</div>
						<div class="tablebody" id="postbody">
							<div class="row">
								<!--这里的数字可以实现宽度的变化，与上面相对应-->
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">1</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Post 1</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									2019-9-14</div>
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">Content</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#changeNotice">Edit</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteNotice">Delete</button>
								</div>
							</div>
						</div>
					</div>

					<!--弹出窗口 添加公告-->
					<div class="modal fade" id="addNotice" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">Post
										Announcement</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">Name：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="nName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">Content：</label>
												<div class="col-xs-4 ">
													<textarea class="form-control input-sm duiqi"
														name="nContent" id="nContent" clos=",50" rows="5"
														warp="virtual"></textarea>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-xs btn-xs btn-green"
										data-dismiss="modal" data-target='#notice'
										onclick="addNotice()">Save</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>

					<!--修改公告信息弹出窗口-->
					<div class="modal fade" id="changeNotice" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">编辑公告</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">名称：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="eName" placeholder=""></input>
													<!--使用EL语言实现输入框有默认值-->
												</div>
												<input id="editPostNo" name="editPostNo" type="hidden"
													value="">
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">内容：</label>
												<div class="col-xs-4 ">
													<textarea class="form-control input-sm duiqi"
														name="eContent" id="eContent" clos=",50" rows="5"
														warp="virtual">nContent</textarea>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-xs btn-green"
										data-dismiss="modal" data-target='#notice'
										onclick="editNotice()">保存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>

					<!--弹出删除资源警告窗口-->
					<div class="modal fade" id="deleteNotice" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">Mention</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">Are you sure to delete?</div>
								</div>
								<input id="deletePostNo" name="deletePostNo" type="hidden"
									value="">
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal" id="cancel">Cancel</button>
									<button type="button" class="btn btn-xs btn-danger"
										onclick="deletepost()" data-dismiss="modal"
										data-target='#notice'>Save</button>
									<!--确定删除后结果存入数据库-->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>

				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.nouislider.js"></script>
	<script>
		function addManager() {
			var lUserName = document.getElementById("lUserName").value;
			var lName = document.getElementById("Name").value;
			var radios = document.getElementsByName('lSex');
			//var male = document.getElementById("male").value;
			//var female = document.getElementById("female").value;
			//alert(female);
			for (var i = 0, length = radios.length; i < length; i++) {
				if (radios[i].checked) {
					// 弹出选中值
					var lSex = radios[i].value;
					// 选中后退出循环
					break;
				}
			}

			var lTel = document.getElementById("userPhone").value;
			var lEmail = document.getElementById("userEmail").value;
			$("#addUser").toggle();
			add(lUserName, lName, lSex, lTel, lEmail);
		}
	</script>
	<script>
		function add(lUserName, lName, lSex, lTel, lEmail) {
			$.ajax({
				type : "post",
				async : false,
				contentType : "application/x-www-form-urlencoded",
				data : {
					"lUserName" : lUserName,
					"lName" : lName,
					"lSex" : lSex,
					"lTel" : lTel,
					"lEmail" : lEmail
				},
				dateType : "json",
				url : "RegistServlet",
				success : function(data) {
					var objs = eval(data);
					if (data.isOk) {
						alert("Register successfully!");
						a();
						document.getElementById("lUserName").value = "";
						document.getElementById("Name").value = "";
						document.getElementById("userPhone").value = "";
						document.getElementById("userEmail").value = "";
						document.getElementById("unameErr").innerHTML = "";
						document.getElementById("nameErr").innerHTML = "";
						document.getElementById("phoneErr").innerHTML = "";
						document.getElementById("emailErr").innerHTML = "";

					} else {
						alert("The UserName has been used!");
					}
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<!-- 页面请求数据 -->
	<!-- 页面请求数据 -->
	<script type="text/javascript">
	window.onload=function a() {
			postsearch();
			$('#clickH').trigger("click");
			$
					.ajax({
						type : "post",
						async : false,
						dataType : "json",
						url : "AdminServlet",
						data : {},
						success : function(data) {
							var objs = eval(data);
							var obj0 = objs[0];
							var obj1 = objs[1];
							var obj2 = objs[2];

							var wel = $("#welcome");
							wel.empty();
							var adminaccount = $("#userName");
							adminaccount.empty();
							var list = $("#displayLibrarian");
							list.empty();
							var bookFine = $("#bookFine");
							bookFine.empty();
							var securityDesposit = $("#securityDesposit");
							securityDesposit.empty();
							var returnPeriod = $("#returnPeriod");
							returnPeriod.empty();
							var select = $("#librarianPageSelect");
							select.empty();

							var admin = obj0.admin;
							var fine = obj1.fine;
							var librarians = obj2.Librarians;

							var bookF = fine.bookFine;
							var securityD = fine.securityDesposit;
							var returnP = fine.returnPeriod;

							wel
									.append("Welcome, admin ${sessionScope.userName}!");
							adminaccount.append("${sessionScope.userName}");
							bookFine.val(bookF);
							securityDesposit.val(securityD);
							returnPeriod.val(returnP);

							var len = librarians.length;
							var num = 7;
							var options = 0;
							if (len / num != 0) {
								options = (len / num) + 1;
							} else {
								options = len / num;
							}
							select.append('<option value="1">1</option>');
							//alert(options);
							for (var i = 0; i < num; i++) {
								var username = librarians[i].lUserName;
								var name = librarians[i].lName;
								var sex = librarians[i].lSex;
								var email = librarians[i].lEmail;
								var tel = librarians[i].lTel;

								var div = '<div class="row" id="d'
        					+i+'"><div class="col-xs-2 " id="dlUserName">'
										+ username
										+ '</div><div class="col-xs-2" id="dlName">'
										+ name
										+ '</div><div class="col-xs-2" id="dlSex">'
										+ sex
										+ '</div><div class="col-xs-2" id="dlTel">'
										+ tel
										+ '</div><div class="col-xs-2" id="dlEmail">'
										+ email
										+ '</div><div class="col-xs-2" onblur="getdiv(this.id)"><button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" id="b'
										+ i
										+ '" onclick="wdnmd(this.id)">Edit</button><button class="btn btn-danger btn-xs" id="de'
										+ i
										+ '" onclick="deleteL(\''
										+ username
										+ '\',this.id)">Delete</button></div></div>';
								list.append(div);

							}

							for (var j = 2; j < options; j++) {
								select.append('<option value="'+j+'">' + j
										+ '</option>');
							}

						}
					});
		}
	</script>

	<script type="text/javascript">
		function postsearch() {
			//alert(1);
			$
					.ajax({
						type : "POST", //请求方式  
						url : "DisplayNoticesServlet", //请求路径  
						cache : false,
						data : {//传参  
							"content" : $("#postcontent").val(),
							"sort" : $("#postsort").val(),
						},
						dataType : "json", //返回值类型  
						success : function(json) {
							var ht = "";
							for (var i = 0; i < json.length; i++) {
								if (json[i].postno == undefined) {
									json[i].postno = '';
								}
								if (json[i].title == undefined) {
									json[i].title = '';
								}
								if (json[i].posttime == undefined) {
									json[i].posttime = '';
								}
								if (json[i].content == undefined) {
									json[i].content = '';
								}
								if (json[i].librarian == undefined) {
									json[i].librarian = '';
								}
								ht = ht + "<div class='row'>";
								ht = ht
										+ "<div class='col-lg-1 col-md-1 col-sm-1 col-xs-1' style='height: 50px; overflow:hidden'>"
										+ json[i].postno + "</div>";
								ht = ht
										+ "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>"
										+ json[i].posterNo + "</div>";
								ht = ht
										+ "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>"
										+ json[i].title + "</div>";
								ht = ht
										+ "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>"
										+ json[i].posttime + "</div>";
								ht = ht
										+ "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>"
										+ json[i].content + "</div>";
								ht = ht
										+ "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><button class='btn btn-success btn-xs' data-toggle='modal' data-target='#changeNotice' onclick='toEditPost( "
										+ json[i].postno
										+ " ) '>Edit</button><button onclick='toDeletePost( "
										+ json[i].postno
										+ " )' class='btn btn-danger btn-xs' data-toggle='modal' data-target='#deleteNotice'>Delete</button></div>";
								ht = ht + "</div>";
							}
							$("#postbody").html(ht);

						},
						error : function(json) {
							alert("error!"); //弹出返回过来的List对象  
							//弹出返回过来的List对象
						}
					});
		}
	</script>

	<script type="text/javascript">
		function editNotice() {
			var postNo = document.getElementById("editPostNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				url : "EditNoticesServlet",
				data : {
					"editPostNo" : postNo,
					"title" : $("#eName").val(),
					"content" : $("#eContent").val(),
				},
				traditional : true,
				success : function(data) {
					alert("edit the post successfully!");
					postsearch();
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>

	<script type="text/javascript">
		function toEditPost(thisPostNo) {
			//alert(thisPostNo);
			$("#editPostNo").val(thisPostNo);
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				url : "DisplayGivenNoticesServlet",
				dataType : "JSON",
				data : {
					"editPostNo" : thisPostNo,

				},
				traditional : true,
				success : function(json) {
					//alert(json[0].title);
					//var data=eval('('+json+')');
					//alert(data);
					var title = json[0].title;
					var content = json[0].content;
					$("#eName").val(title);
					$("#eContent").val(content);
				},
				error : function(json) {
					//alert("(edit)connect failed!");
					alert(json);
				}
			});
		}
	</script>

	<script>
		function toDeletePost(thisPostNo) {
			$("#deletePostNo").val(thisPostNo);
		}
	</script>

	<script>
		function deletepost() {
			var postNo = document.getElementById("deletePostNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				url : "DeletePostServlet",
				data : {
					"deletePostNo" : postNo
				},
				traditional : true,
				success : function(data) {
					alert("delete the post successfully!");
					postsearch();
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>

	<script>
		Date.prototype.format = function(fmt) {

			var o = {

				"y+" : this.getFullYear, //年

				"M+" : this.getMonth() + 1, //月份

				"d+" : this.getDate(), //日

				"h+" : this.getHours(), //小时

				"m+" : this.getMinutes(), //分

				"s+" : this.getSeconds()
			//秒

			};

			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));

			for ( var k in o)

				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));

			return fmt;

		}

		setInterval(
				"document.getElementById('dateTime').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');",
				1000);
	</script>

	<script type="text/javascript">
		function change(obj) {
			obj.src = "${ctx}/Code?time=" + new Date().getTime();
		}

		function checkForm() {
			var lusername = checklUserName();
			var name = checkName();
			var tel = checkPhone();
			var email = checkEmail();
			return lusername && name && tel && email;
			//alert(nametip.value);
		}

		//验证用户名   
		function checklUserName() {
			var username2 = document.getElementById('lUserName');
			var errname = document.getElementById('unameErr');
			var pattern = /^\w{6,20}$/; //用户名格式正则表达式：用户名要求6-20位
			if (username2.value.length == 0) {
				errname.innerHTML = "UserName can not be null"
				errname.style.color = '#ff0000';
				errname.className = "error"
				return false;
			}
			if (!pattern.test(username2.value)) {
				errname.innerHTML = "Please enter userName of 6-20 digits"
				errname.style.color = '#ff0000';
				errname.className = "error"
				return false;
			} else {
				errname.innerHTML = "OK"
				errname.style.color = '#3CB371';
				errname.className = "success";
				return true;
			}
		}

		//验证姓名   
		function checkName() {
			var username3 = document.getElementById('Name');
			var errname3 = document.getElementById('nameErr');
			var pattern = /^[\xa0-\xff]{2,4}$/; //姓名格式正则表达式：姓名要求2-4位
			if (username3.value.length == 0) {
				errname3.innerHTML = "Name can not be null"
				errname3.style.color = '#ff0000';
				errname3.className = "error"
				return false;
			} else {
				nameErr.innerHTML = "OK"
				nameErr.style.color = '#3CB371';
				nameErr.className = "success";
				return true;
			}
		}

		//验证手机号 
		function checkPhone() {
			var userphone = document.getElementById('userPhone');
			var phonrErr = document.getElementById('phoneErr');
			var pattern = /^1[34578]\d{9}$/; //验证手机号正则表达式 
			if (userphone.value.length == 0) {
				phonrErr.innerHTML = "Telephone can not be null"
				phonrErr.style.color = '#ff0000';
				phonrErr.className = "error"
				return false;
			}
			if (!pattern.test(userphone.value)) {
				phonrErr.innerHTML = "Please enter valid telephone"
				phonrErr.style.color = '#ff0000';
				phonrErr.className = "error"
				return false;
			} else {
				phonrErr.innerHTML = "OK"
				phonrErr.style.color = '#3CB371';
				phonrErr.className = "success";
				return true;
			}
		}

		//验证邮箱
		function checkEmail() {
			var useremail = document.getElementById('userEmail');
			var emailErr = document.getElementById('emailErr');
			var pattern = /^\w+@[a-z0-9]+\.[a-z]{2,4}$/; //验证邮箱正则表达式 
			if (useremail.value.length == 0) {
				emailErr.innerHTML = "Email can not be null"
				emailErr.style.color = '#ff0000';
				emailErr.className = "error"
				return false;
			}
			if (!pattern.test(useremail.value)) {
				emailErr.innerHTML = "Please enter valid email"
				emailErr.style.color = '#ff0000';
				emailErr.className = "error"
				return false;
			} else {
				emailErr.innerHTML = "OK"
				emailErr.style.color = '#3CB371';
				emailErr.className = "success";
				return true;
			}
		}

		function test() {
			if (checkForm())
				alert("Register librarian successfully!!!");
			function b() {
				page = new Page(3, 'divtable',
						'group_one', "pageindex");
			}
	</script>

	<!-- 添加公告 -->
	<script>
		function addNotice() {
			$.ajax({
				type : "post",
				cache : false,
				url : "AddNoticesServlet",
				data : {
					"nname" : $("#nName").val(),
					"ncontent" : $("#nContent").val(),
				},
				traditional : true,
				success : function(data) {
					alert("add the notice successfully!");
					postsearch();
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>

</body>

</html>

