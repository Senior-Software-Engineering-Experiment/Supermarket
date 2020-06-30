<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>联系我们</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
</head>
<body>
	<!-- 导航栏 -->
	<%@include file="navbar.jsp"%>
	<!-- 导航栏 -->
	<!--contact-->
	<div class="contact-agile" id="contact">
		<div class="map">
			<h4>位置信息</h4>
			<iframe
				src="https://www.amap.com/search?query=%E8%A5%BF%E5%8C%97%E5%B7%A5%E4%B8%9A%E5%A4%A7%E5%AD%A6%E9%95%BF%E5%AE%89%E6%A0%A1%E5%8C%BA%E5%9B%BE%E4%B9%A6%E9%A6%86&city=610100&geoobj=108.763335%7C34.029158%7C108.769035%7C34.031546&zoom=19"
				style="border: 0; height: 550px;"></iframe>
			<div class="map-pos wow zoomIn" data-wow-duration="1.5s"
				data-wow-delay="0.1s"
				style="position: absolute; left: 75%; top: 27%; background: white; border-radius: 100%; width: 250px; height: 250px; text-align: center; border: 4px solid #01C6D7; padding: 2em 0 0;">
				<h4>地址</h4>
				<!--标题-->
				<p>陕西省西安市长安区</p>
				<!--详细地址-->
				<p>西北工业大学</p>
				<!--城市-->
				<p>Call : 123 456 7890</p>
				<!--电话-->
				<p>
					<a href="mailto:info@example.com">@nwpu.edu.cn</a>
				</p>
				<!--邮箱地址-->
			</div>
		</div>
		<h3>
			 <span>联系我们</span>
		</h3>
		<div class="container">

			<form action="#" method="post" class="wow fadeInLeft animated"
				data-wow-delay=".5s">
				<div class="contact-grids1 agileinfo">
					<div class="contact-me ">
						<h4>留言</h4>
						<textarea name="Message" placeholder="" required=""> </textarea>
					</div>
					<div class="col-md-5 contact-form1">
						<h4>姓名</h4>
						<input type="text" name="Name" placeholder="" required="">
					</div>
					<div class="col-md-5 contact-form1">
						<h4>邮箱</h4>
						<input type="email" name="Email" placeholder="" required="">
					</div>
					<div class="col-md-2 contact-form">
						<input type="submit" value="提交">
					</div>
					<div class="clearfix"></div>

				</div>
			</form>

		</div>
	</div>
	<!--//contact-->

	<!-- 底部 -->
	<%@include file="bottom.jsp"%>
	<!-- //footer -->
	
		<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->

	<!-- bottom-top -->
	<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
				};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //smooth scrolling -->
	<!--// bottom-top -->
</body>
</html>
