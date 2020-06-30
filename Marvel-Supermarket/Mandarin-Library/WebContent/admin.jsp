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
 .biaoti{
    margin-left:120px;
    margin-top:-25px;
    width:560px;
    }
	.return{
		position:absolute;
		right:30px;
		top:149px;
	}
    .select{
     width:20px;
    }
    .sousuo{
    right:5px;
	top:30px;
    }
	.logout{
		position:absolute;
		right:5px;
		top:30px;
	}
	.pg_header{
            height: 48px;
            top: 70px;
            left: 0;
            right: 0;
            background-color:#AD0205; 
            line-height: 48px;
			vertical-align: bottom;
	}
	.pg_dl1{
		    font-family: inherit;
			margin-left:100px;
	        line-height:20px;
			font-size:40px;
            padding: 0 40px;
            color: #AD0205;
			height:0px;
		margin-top: px;
        }
	.pg_dl2{
	        line-height:2px;
			font-size:20px;
            color: black;
			height:0px;
			width: 19.5%;
			float: right;
			margin-top:15px;
        }

	
	.word{
		padding: 9px 12px 5px;
		line-height: 40px;
		height: 40px;
		color: black;
		width: 20%;
		margin: 0 127px !important;
		
	}
 	.tian{
            color: red;
            float: right;
            font-size: 12px;
            margin-right: -30px;
            margin-top: -25px;
        }
	.time{
		    color: white;
            float: right;
            font-weight: bolder;
			font-size:18px;
            margin-top: 10px;
            margin-right:20px;
		
	}
	</style>
    <head>
    
        <meta charset="utf-8">
        <title>Admin</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
		<script src="js/confirm.js"></script>
		<script src="js/checkPass.js"></script>
		<script src="js/fineCheck.js"></script>
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

    <body onload="a()" style="overflow:auto!important">
    <input type="hidden" name="admin"/>
    <div id="wrap">
		
		 <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="" src="images/NEWLOGO.png"></p>
                    <!--此处的图片为logo-->
				  <input type="image" src="images/标题.png" class="biaoti" />
				   <p class="pg_dl2" id="welcome">  </p>  
				 <form action="LogoutServlet" name="tuichuForm"></form>
				 <input type="image" src="images/注销1.jpg" class="logout" onclick="disp_confirm()" style="border-style:none;  width:50px; height:40px; background-repeat:no-repeat;" />
			
              </div>
				 <div class = "pg_header" >
					<p class="time"></p>
					<p class="time" id="dateTime"></p>
		
					<style type="text/css">

        				a{text-decoration: none;color: #666;}

					</style>
					</style> 
    			</div>
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun">
             
                <div id="personInfor">
					<div id="logo2"><img   src="images/admin.jpg"></div>
                  <p class="word" id="userName"></p>
                    <!--实现从数据库读取名字写入-->
              <p>&nbsp;</p>
		      <div class="meun-title">管理</div>
		      <p>&nbsp;</p>
                <div class="meun-item" href="#user" id="clickH" aria-controls="user" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">管理售货员</div>
                <p>&nbsp;</p>
                <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">修改个人密码</div>
                <p>&nbsp;</p>
                <div class="meun-item" href="#regu" aria-controls="regu" role="tab" data-toggle="tab"><img src="images/icon_rule_grey.png">系统设置</div>
            </div>
			</div>
            <!-- 右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- Tab panes -->
                <div class="tab-content" >

            <!--用户管理模块-->
            <div role="tabpanel" class="tab-pane" id="user">
                <div class="check-div form-inline">
                    <div class="col-xs-3" style="padding-left:2px">
                        <button class="btn btn-yellow btn-xs" id="add" data-toggle="modal" data-target="#addUser">添加售货员</button>
                    </div>
                    <div class="col-xs-41">
                    	<select id="type">
							<option value="userName">用户名</option>
							<option value="name">姓名</option>
						</select> 
                        <input type="text" class="form-control input-sm" id="searchBlank" placeholder="搜索" style="color: black">
                       <form action="LogoutServlet" name="tuichuForm"></form>
                       
				        <input type="image" src="images/搜索.png" class="sousuo" style="width:30px!important; float:right; margin-top:-45px!important; margin-left:330px!important" onclick="search()" />
                        
                    </div>
                    
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-222 "  >
                             	用户名
                        </div>
                        <div class="col-xs-223" >
                            	姓名
                        </div>
                        <div class="col-xs-224" >
                            	性别
                        </div>
                        <div class="col-xs-222">
                            	电话
                        </div>
                        <div class="col-xs-225" >
                            	邮箱
                        </div>
                        <div class="col-xs-222" >
                            	操作
                        </div>
                    </div>
                    
					<!-- 展示管理员列表 -->
					<div class="tablebody" id="displayLibrarian">
							
                    </div>
                    <!-- 搜索结果 -->
                    <div class="tablebody" id="searchResult" style="display:none">
                    		
                    </div>
                    
                    <!-- 传值用的昂 -->
                    <div id="u" style="display:none"></div>
                    <div id="n" style="display:none"></div>
                    <div id="s" style="display:none"></div>
                    <div id="e" style="display:none"></div>
                    <div id="t" style="display:none"></div>
					<div id="divid" style="display:none"></div>

                </div>
                <!--页码块-->
               <footer class="footer">
                    <ul class="pagination">
                        <li>
                            <select id="librarianPageSelect"  onchange="turnToPage(this.options[this.options.selectedIndex].value)"></select>页
                        </li>
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
									<h4 class="modal-title" id="gridSystemModalLabel">添加售货员</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
									
	<form class="form-horizontal"  onsubmit="return checkForm()" >
	
				<div class="form-group">
					<label for="lUserName" class="col-xs-3 control-label">用户名：</label> 
					  <div class="col-xs-8 ">
				    	<input class="form-control input-sm duiqi" id="lUserName" name="lUserName" type="text" onblur="checklUserName()" oninput="checklUserName()" placeholder="Please input userName..." value="">
					    <span class="default" id="unameErr"></span> 
					  </div>
				</div>
				
				<div class="form-group">
                    <label for="Name" class="col-xs-3 control-label">姓名：</label>
                      <div class="col-xs-8 "> 
                        <input class="form-control input-sm duiqi" id="Name" name="lName" type="text" onBlur="checkName()" oninput="checkName()" placeholder="请输入姓名..." value="">
                        <span class="default" id="nameErr"></span>
                      </div>
				</div>
				
			    <div class="form-group">
                    <label for="sLink" class="col-xs-3 control-label">性别：</label>
				    <div class="kong" >
                        &nbsp; &nbsp; 男
                        <input  id ="male" type="radio" style="margin-left:5px; margin-top:13px" name="lSex" value="male">    &nbsp; &nbsp; &nbsp; &nbsp;女<input id="female" type="radio" style="margin-left:5px;" name="lSex" value="female">
                    </div>
                </div>
				
				<div class="form-group">
                    <label for="userPhone" class="col-xs-3 control-label">电话：</label> 
                       <div class="col-xs-8">
                        <input class="form-control input-sm duiqi" type="text" id="userPhone" name="lTel" onBlur="checkPhone()" oninput="checkPhone()" placeholder="请输入电话号码..." value="">
                        <span class="default" id="phoneErr"></span> 
				      </div>
				</div>
				
		    	<div class="form-group">
                    <label for="userEmail" class="col-xs-3 control-label">邮箱：</label> 
                       <div class="col-xs-8">           
                        <input class="form-control input-sm duiqi" type="text" id="userEmail" name="lEmail" onBlur="checkEmail()" oninput="checkEmail()" placeholder="请输入邮箱..." value="">
                        <span class="default" id="emailErr"></span> 
				      </div>
				</div>
				
				<div  class="modal-footer">
				    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>				
					<input type="submit" onclick="addManager()" value="完成"  class="btn btn-xs btn-green">
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
 <div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">编辑售货员信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">                                       
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">姓名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="" class="form-control input-sm duiqi" id="sName" placeholder="">
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
                             
          <div class="form-group" >
          <label for="sLink" class="col-xs-3 control-label">性别：</label>
           <div class="select">
                <select  id="sSex" name="lSex" style="margin-top:8px;">           
                    <option value='male'>男</option>
                    <option value='female'>女</option>
                </select>
            </div>
              </div>
        
                                        
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">邮箱：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="form-control input-sm duiqi" id="sEmial" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">电话：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="form-control input-sm duiqi" id="sTelep" placeholder="">
                                            </div>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button  id="closeEdit" type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-xs btn-green " onclick="edit()">保存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
		</div>
            <!-- 修改密码模块 -->
       	<div role="tabpanel" class="tab-pane" id="chan">

					<div style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 520px; margin: 50px auto;">
					 
						<form class="form-horizontal" >

                       <div class="form-group">
							<label for="sKnot" class="col-xs-4 control-label">旧密码：</label>
                            <div class="col-xs-5">
                                <input id="oldPassword" type="password"  name="oPass" class="form-control input-sm duiqi" placeholder="" onBlur="checkold()" oninput="checkold()">
                                <span id="div1" class="tian" style="margin-top: -25px">*必填</span>
                            </div>
                        </div>
						
						
                           <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">新密码：</label>
                            <div class="col-xs-5">
                                <input id="newPassword1" type="password" name="Password"  class="form-control input-sm duiqi"  placeholder="" onBlur="checkpassword()" oninput="checkpassword()">
								<span id="div2" class="tian" style="margin-top: -25px">*必填</span>
                            </div>
                        </div>
						
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">确认密码：</label>
                         <div class="col-xs-5">
                                <input id="newPassword2"  type="password"  name="pass" class="form-control input-sm duiqi"  placeholder="" onBlur="checkrepassword()" oninput="checkrepassword()" >
								   <span id="div3" class="tian" style="margin-top: -25px">*必填</span>
                            </div>					
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="button" class="btn btn-xs btn-white" onclick="delete1()" style="margin-right:20px !important">取消</button>
								
                               <button type="button" class="btn btn-xs btn-green" onclick="changeP()" >提交</button>
                            </div>
                        </div>
                   </form>
                </div>
            </div>

				<!--规则管理模块-->
				<div role="tabpanel" class="tab-pane" id="regu"
					style="padding-top: 50px;">
					<form name="fineEdit" action="FineServlet" method="post"
						onsubmit="return fineCheck()">
						<div class="data-div">
							<div class="tablebody col-lg-10 col-lg-offset-1">
								<div class="row">
									<div class="col-xs-3"
										style="padding-right: 0; width: 520px; font-size: 16px; margin-left: 100px">
										Security deposit:<input type="text" id="securityDesposit"
											name="changesecurityDesposit"
											value="${fine.securityDesposit}" onblur="fineCheck()"
											style="height: 30px; margin-left: 65px; width: 300px; border-radius: 5px" />
									</div>

									<div class="col-xs-2" style="margin-left: 40px">
										<button type="button" class="btn btn-xs btn-white"
											onclick="defaultSecurityDesposit()" style="width:67px!important">Default</button>
									</div>
									<span id="sd"> </span>
								</div>
								<div class="row">
									<div class="col-xs-3"
										style="padding-right: 0; width: 520px; font-size: 16px; margin-left: 100px">
										Return period:<input type="text" id="returnPeriod"
											name="changereturnPeriod" value="${fine.returnPeriod}"
											onblur="fineCheck()"
											style="height: 30px; margin-left: 80px; width: 300px; border-radius: 5px" />
									</div>

									<div class="col-xs-2" style="margin-left: 40px">
										<button type="button" class="btn btn-xs btn-white"
											onclick="defaultReturnPeriod()" style="width:67px!important">Default</button>
									</div>
									<span id="rp"> </span>
								</div>

								<div class="row" >
									<div class="col-xs-3"
										style="padding-right: 0; width: 520px; font-size: 16px; margin-left: 100px">
										Fine value:<input type="text" id="bookFine"
											name="changebookFine" value="${fine.bookFine}"
											onblur="fineCheck()"
											style="height: 30px; margin-left: 105px; width: 300px; border-radius: 5px" />
									</div>

									<div class="col-xs-2" style="margin-left: 40px">
										<button type="button" class="btn btn-xs btn-white"
											onclick="defaultBookFine()" style="width:67px!important">Default</button>
									</div>
									<span id="bf"> </span>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white1"
										data-dismiss="modal" onClick="location.reload()">Cancel</button>
									<button type="button" class="btn btn-xs btn-green1"
										onClick="complete()">Save</button>
								</div>
							</div>
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>
	
	<script src="js/jquery.nouislider.js"></script>
	 <script>
        function addManager(){
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
			add(lUserName,lName,lSex,lTel,lEmail);
		}
       
        </script>
        <script>
        	function add(lUserName,lName,lSex,lTel,lEmail){
        		$.ajax({
        			type:"post",
        			async:false,
        			contentType : "application/x-www-form-urlencoded",
        			data:{"lUserName":lUserName,"lName":lName,"lSex":lSex,"lTel":lTel,"lEmail":lEmail},
        			dateType:"json",
        			url:"RegistServlet",
        			success:function(data){
        				var objs = eval(data);
        				if(data.isOk){
        					alert("Register successfully!");
        					a();
        					document.getElementById("lUserName").value="";
        					document.getElementById("Name").value="";    			
        					document.getElementById("userPhone").value="";
        					document.getElementById("userEmail").value="";
        					document.getElementById("unameErr").innerHTML="";
        					document.getElementById("nameErr").innerHTML="";
        					document.getElementById("phoneErr").innerHTML="";
        					document.getElementById("emailErr").innerHTML="";
        					
        				}else{
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
        function a(){
        	$('#clickH').trigger("click");
    		$.ajax({
    		  type:"post",
    		  async:false,
    		  dataType:"json",
    		  url:"AdminServlet",
    		  data:{},
    		  success:function(data){
    			  var objs=eval(data);
    			  var obj0=objs[0];
    			  var obj1=objs[1];
    			  var obj2=objs[2];

    			  var wel = $("#welcome");
    			  wel.empty();
    			  var adminaccount=$("#userName");
    			  adminaccount.empty();
    			  var list = $("#displayLibrarian");
    			  list.empty();
    			  var bookFine=$("#bookFine");
    			  bookFine.empty();
    			  var securityDesposit=$("#securityDesposit");
    			  securityDesposit.empty();
    			  var returnPeriod=$("#returnPeriod");
    			  returnPeriod.empty();
    			  var select=$("#librarianPageSelect");
    			  select.empty();
    			  
    			  var admin=obj0.admin;
    			  var fine=obj1.fine;
    			  var librarians=obj2.Librarians;
    			  
    			  var bookF=fine.bookFine;
    			  var securityD=fine.securityDesposit;
    			  var returnP=fine.returnPeriod;
    			  
    			  wel.append("欢迎, admin ${sessionScope.userName}!");
    			  adminaccount.append("${sessionScope.userName}");
    			  bookFine.val(bookF);
    			  securityDesposit.val(securityD);
    			  returnPeriod.val(returnP);
    			  
    			  var len = librarians.length;
    			  var num =7;
    			  var options=0;
    			  if(len/num != 0){
    				  options = (len/num)+1;
    			  }else{
    				  options =len/num;
    			  }
				  select.append('<option value="1">1</option>');
    			  //alert(options);
    				  for(var i=0;i<num;i++){
        					var username = librarians[i].lUserName;
        					var name = librarians[i].lName;
        					var sex = librarians[i].lSex;
        					var email = librarians[i].lEmail;
        					var tel = librarians[i].lTel;					
        					
        					var div = '<div class="row" id="d'
        					+i+'"><div class="col-xs-2 " id="dlUserName">'
        					+ username+'</div><div class="col-xs-2" id="dlName">'
        					+name+'</div><div class="col-xs-2" id="dlSex">'
        					+sex+'</div><div class="col-xs-2" id="dlTel">'
        					+tel+'</div><div class="col-xs-2" id="dlEmail">'
        					+email+'</div><div class="col-xs-2" onblur="getdiv(this.id)"><button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" id="b'+i
        					+'" onclick="wdnmd(this.id)">Edit</button><button class="btn btn-danger btn-xs" id="de'+i
        					+'" onclick="deleteL(\''+ username+'\',this.id)">Delete</button></div></div>';
        					list.append(div);

        				}
    			  	
    			  
    			  for(var j=2;j<options ; j++){
    				  select.append('<option value="'+j+'">'+j+'</option>');
    			  }
    			 
    		 
    		}
    	});
    }

        	 </script>
    <script>

        Date.prototype.format = function (fmt) {

            var o = {

                "y+": this.getFullYear, //年

                "M+": this.getMonth() + 1, //月份

                "d+": this.getDate(), //日

                "h+": this.getHours(), //小时

                "m+": this.getMinutes(), //分

                "s+": this.getSeconds() //秒

            };

            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));

            for (var k in o)

                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));

            return fmt;

        }

        setInterval("document.getElementById('dateTime').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');", 1000);

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
		
		    function test(){
			    if(checkForm()) alert("已成功注册!!!");
			  }

	</script>
</body>

</html>

