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
<title>Librarian</title>
<script src="js/library-jquery.min.js"></script>
<script src="js/library-bootstrap.min.js"></script>
<script src="js/libraryHead.js"></script>
<script src="js/jquery.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/JsBarcode.all.min.js"></script>

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

<body>

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
			<div align=center>
				<h6>
					<font color="red"> Successfully added Book(s)!</font>
				</h6>
			</div>
			<br /> <br />
			
			<h6 style="margin-left: 70px;font-size:18px">
				ISBN:<%=request.getAttribute("ISBN")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Title:<%=request.getAttribute("title")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Author:<%=request.getAttribute("author")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Language:<%=request.getAttribute("language")%>

			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Price:<%=request.getAttribute("price")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Publish Date:<%=request.getAttribute("time")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Publisher:<%=request.getAttribute("publisher")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Category:<%=request.getAttribute("category")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Location:<%=request.getAttribute("location")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">
				Brief:<br />&nbsp;&nbsp;<%=request.getAttribute("brief")%>
			</h6>
			<br /> <br />
			<h6 style="margin-left: 70px;font-size:18px">Bar Code(s):</h6>
     
			<%
			
				Object m1 = request.getAttribute("bookno");
			    Object m3 = request.getAttribute("location");
				Object n2 = request.getAttribute("number");
				
                
			%>
			<script>
			var nn = parseInt(
					<%=n2%>
						);
			
			for (var n = 1; n < nn+1; n++){
				var bn = n.toString();
	   var body = document.getElementById("rightContent");             //创建一个div	  
	   var div = document.createElement("div"); 
	   div.setAttribute('style',"position: relative;width: 150px; height: 120px;");
	   var br = document.createElement("br");
       div.appendChild(br); 
       var img=document.createElement('img');
       img.setAttribute('id', 'barcode'+bn);
       img.setAttribute('style',"position: relative;left:60px;width: 150px; height: 100px;");
       div.appendChild(img);
       var br = document.createElement("br");  
       div.appendChild(br); 
        var span=document.createElement("span");          //创建一个span
        span.innerText="<%=request.getAttribute("location")%>";
        span.setAttribute('style',"position: relative; bottom: 100px; left:60px; color:black;font-size:8px");
        div.appendChild(span); 
        body.appendChild(div);
      
			}
</script>

			<script>
			    
			    
				var n = parseInt(
			<%=n2%>
				);
				var m2 = parseInt(
			<%=m1%>
				);
				
				for (var i = 1; i < n + 1; i++) {
					var nn = i.toString();

					var a =  m2.toString();
					m2++;
					JsBarcode("#barcode"+nn, a, {
						marginTop: 40,
						width: 5,
						});
					
					
				}
				
			</script>
			<div align=center>
				<button class="btn btn-xs btn-xs btn-green" data-toggle="modal"
					onclick="window.location='library.jsp'"
					style="margin-bottom: 0px; height: 40px; width: 170px; font-size: 15px;">Return
					to Main Page</button>
			</div>
		</div>