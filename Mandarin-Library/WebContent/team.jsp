<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	window.onload = function init(){
		var pageNum = 1;
		turnToPost(pageNum);
		init1();
		initbookSearch();
	}
	</script>
	<script>
	function init1() {
		//document.write('aaa');
		$.ajax({
			type : "GET",
			async : "false",
			cache : false,
			contentType : "application/json; charset=UTF-8",
			url : "/Mandarin-Library/MemberServlet",
			data : {},
			traditional : true,
			success : function(data) {
				//alert(data.members);
				//$("#cardBody").css("display", "block");
				//$("#cardBody").css("background", "");

				//$("#listbody").empty();
				//返回的数据用data.rows获取内容
				$.each(data.members, function(i, item) {
					//alert(i+item.picture);
					/*var one = $("#cardBody").clone();
					one.find("#name").text(item.memberName);
					one.find("#des").text(item.describe);
					$("#mpicture").attr("src", item.prture);
					one.appendTo($("#main"));*/
					var body = ' <div  class="col-md-4 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s" '
								+ ' style="width: 16%; padding-right: 5px; padding-left: 5px;"> '
								+ ' <div class="team_pos"> '
								+ ' <div class="team_back"></div> '
								+ ' <img id="mpicture" class="img-responsive" src="' + item.picture + '"'
								+ ' alt=" "> '
								+ ' <div class="team_info"> '
								+ ' <a href="#" class="face_one"><i class=" so1 fa fa-facebook fc1" '
								+ '	aria-hidden="true"></i></a> <a href="#" class="face_one"><i '
								+ '	class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a> <a href="#" '
								+ '	class="face_one"><i class=" so3 fa fa-google fc3" '
								+ '	aria-hidden="true"></i></a> '
							    + ' </div> </div> '
							    + ' <h4 id="name"> ' + item.memberName 
							    + ' </h4> '
								+ ' <p id="des"> ' + item.describe  + ' </p> '
								+ ' </div> ';
					$("#main").append(body);
				});
			},
			error : function() {
				alert("connect failed!");
			}
		});
	}
</script>
</head>
<body>
	<!-- team -->
	<div class="team" id="team">
		<div class="container">
			<h3 class="title">
				Our <span>Team</span>
			</h3>
			<div id="main" class="team_gds"></div>
					
		</div>
		<div class="clearfix"></div> 
	</div>
	<!-- //team -->
</body>
</html>
