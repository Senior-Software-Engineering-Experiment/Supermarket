<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<%@ page import="java.util.*"%>
<%@ page import="dao.BookDAO"%>
<%@ page import="entity.Book"%>
<%@ page import="java.sql.*"%>
<%@ page import="utils.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ch">

<head>
<meta charset="utf-8">
<title>售货员</title>
<script src="js/library-jquery.min.js"></script>
<script src="js/library-bootstrap.min.js"></script>
<script src="js/libraryHead.js"></script>
<script src="js/jquery.js"></script>
<script src="js/highcharts.js"></script>


<link href="css/library-bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/library-common.css" />
<link rel="stylesheet" type="text/css" href="css/library-slide.css" />
<link rel="stylesheet" type="text/css"
	href="css/library-bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/library-flat-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/library-jquery.nouislider.css">
</head>

<body style="overflow:auto!important;">

	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
			<%@include file = "leftMeun.jsp" %>
		<!-- 左侧菜单栏目块 -->
		
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 书籍管理模块 -->
					
					<%@include file = "bookManage.jsp" %>
				<!-- 书籍管理模块 -->
				
				<!--书籍删除记录模块-->
					<%@include file = "recordDelete.jsp" %>
				<!--书籍删除记录模块-->
				
				<!-- 借书模块 -->
					<%@include file = "bookLend.jsp" %>
				<!-- 借书模块 -->
				
				<!-- 还书模块 -->
					<%@include file = "bookReturn.jsp" %>
				<!-- 还书模块 -->


				<!-- 资金管理模块 -->
				<%@include file = "moneyManage.jsp" %>	
				<!-- 资金管理模块 -->

				<!--记录管理模块-->
					<%@include file = "recordManage.jsp" %>
				<!--记录管理模块-->

				<!--用户管理模块-->
					<%@include file = "userManage.jsp" %>
				<!--用户管理模块-->
				
				<!--公告模块-->
					<%@include file = "noticeManage.jsp" %>
				<!--公告模块-->
				
				<!-- 修改密码模块 -->
					<%@include file = "passwordManage.jsp" %>
				<!-- 修改密码模块 -->
				
				<!-- ISBN 管理 -->
					<%@include file = "isbnManage.jsp" %>
				<!-- ISBN 管理 -->
				
				<!-- 分类管理模块 -->
					<%@include file = "categoryManage.jsp" %>
				<!-- 分类管理模块 -->
				
				<!-- 地址管理模块 -->
					<%@include file = "locationManage.jsp" %>
				<!-- 地址管理模块 -->
			<script src="js/library-jquery.nouislider.js"></script>
		</div>
	</div>
  </div>
</body>

</html>
