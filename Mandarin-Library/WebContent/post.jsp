<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Post</title>
<link href="css/post.css" rel="stylesheet" type="text/css" >
<link href="css/swiper.min.css" rel="stylesheet" type="text/css" >
  <style>
    .swiper-slide {
            height: 300px;
            width:500px;
            text-align: center;
            color:#eee;
            background: rgba(165, 163, 163, 0.32);
        }
  </style>
</head>
<body>
	<div id="post" class="review">
		<div id="lun"class="container"style="height:500px;width:100%;background: url(images/se2.jpg);">
			<h3 class="title-w3">Posts</h3>
			
		</div>
		<div id="postList" class="postList" style="display:none;">
			<table >
				<tr>
					<th class="postTitle">PostTitle</th>
					<th class="postContent">PostContent</th>
					<th class="postTime">PostTime</th>
					<th class="postMore">More</th>
				</tr>
			</table>
			<div id="postContent"></div>
			<div id="showPost"></div>
			<!--Page码块-->
			<footer class="page" id="postPageFooter" >
				<ul class="pagecontent">
					<li><select id="postPageSelect" name="postPageSelect"
						onchange="turnToPostOne(this.options[this.options.selectedIndex].value)">
					</select> Page</li>
					<li class="pagegray" id="totalPageLi" ></li>
					<li><i class="pageglyphicon glyphicon-menu-left" id="postPageUp"
						 onclick=postPageDown()> </i></li>
					<li><i class="pageglyphicon glyphicon-menu-right" id="postPageDown"
						 onclick=postPageUp()> </i></li>
				</ul>
			</footer>
		</div>
	</div>
</body>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/swiper.min.js"></script>
	<script>
		window.onload = function init(){
			var pageNum = 1;
			turnToPost(pageNum);
		}
	</script>
	<script>
		function turnToPostOne(pageNum){
			
			turnToPost(pageNum);
		}
	</script>
	<script src="js/personInformation.js"></script>
	<script>
		function turnToThisPost(postno){
			$.ajax({
				type:"GET",
				async:false,
				cache:false,
				data:{"postno":postno},
				dataType:"text",
				contentType:"application/x-www-form-urlencoded",
				url:"/Mandarin-Library/ReaderPostInitServlet",
				traditional:true,
				success:function(data){
					//alert(data);
					var objs = eval('(' + data + ')');
					//alert(objs[0].post.title);
					$("#showPost").empty();
					var time = date('Y-m-d H:i:s',objs[0].post.posttime.time);
					var div = '<div class="modal fade" id="deleteBook" role="dialog" aria-labelledby="gridSystemModalLabel" style="margin-top:100px;">'
							+ '<div class="modal-dialog" role="document">'
							+ '<div class="modal-content">'
							+ '<div class="modal-header">'
							+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
							+ '<span aria-hidden="true">&times;</span></button>'
							+ '<h4 class="modal-title" id="gridSystemModalLabel">'+ objs[0].post.title+'</h4>'
							+ '<h5 style="text-align:center;">' + time +'</h5></div>'
							+ '<div class="modal-body">'
							+ '<div class="container-fluid">'+ objs[0].post.content+'</div>'
							+ '<div class="modal-footer">'
							+ '<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">Close</button>'
							+ '</div></div></div></div>';
					$("#showPost").append(div);
					$('#deleteBook').modal();
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
	function turnToPost(pageNum){
		//alert("aaa");
		$.ajax({
					type : "POST",
					async : false,
					cache : false,
					data : {"pageNum":pageNum},
					dataType: "text",
					contentType : "application/x-www-form-urlencoded",
					url : "/Mandarin-Library/ReaderPostInitServlet",
					traditional : true,
					success : function(data) {
						var objs = eval('(' + data + ')');
						$("#postContent").empty();
						$("#owl-demo").empty();
						for(var post in objs){
							if(post==0) continue;
							if(post==1){
								var div = '<div class="swiper-container" id="swiper-container2" style="width:80%;height: inherit;">'
						        		+ '<div class="swiper-wrapper">'
						            	+ '<div class="swiper-slide active-slider" >'
						            	+ '<h3>' + objs[1].title +'</h3>'
						                + '<p>' + objs[1].content + '<p></div>'
						                + '<div class="swiper-slide" >'
						            	+ '<h3>' + objs[2].title +'</h3>'
						                + '<p>' + objs[2].content + '<p></div>'
						                + '<div class="swiper-slide ">'
						            	+ '<h3>' + objs[3].title +'</h3>'
						                + '<p>' + objs[3].content + '<p></div>'
						                + '<div class="swiper-slide" >'
					            		+ '<button onclick="showMore()"type="button" class="btn btn-xs btn-white" data-dismiss="modal"'
					            		+ 'style="width: 100px;height: 50px;background-color: #000000;border-radius: 15px;margin: 125px auto;font-size: x-large;"'
					            		+ '>more</button>'
					            		+ '</div></div>'
					            		+ '<div class="swiper-pagination swiper-pagination-white" style="bottom:150px;"></div><div class="swiper-button-prev swiper-button-white" style="top:30%;">'
					            		+ '</div><div class="swiper-button-next swiper-button-white" style="top:30%;"></div>'
					            		+ '</div>';
								$("#lun").append(div);
								var mySwiper2 = new Swiper('#swiper-container2', {
						            watchSlidesProgress: true,
						            watchSlidesVisibility: true,
						            slidesPerView: 1,
						            resistanceRatio: 0.5,
						            observer:true,
						            observeParents:true,
						            centeredSlides: true,
						            autoplay: {
						              delay: 2500,
						              disableOnInteraction: false,
						            },
						            pagination: {
						              el: '.swiper-pagination',
						              clickable: true,
						            },
						            speed: 600,
						            parallax: true,
						            pagination: {
						              el: '.swiper-pagination',
						              clickable: true,
						            },
						            navigation: {
						              nextEl: '.swiper-button-next',
						              prevEl: '.swiper-button-prev',
						            },
						        });
								
							}
							var div = '<tr><td class="postTitle">' + objs[post].title + '</td>'
									+ '<td class="postContent">' + objs[post].content + '</td>'
									+ '<td class="postTime">' + objs[post].posttime +'</td>'
									+ '<td class="postMore"><button onclick=turnToThisPost(' +objs[post].postno+')>More</button></td>'
									+ '</tr>';
							$("#postContent").append(div);
						}
						
						if(pageNum == 1){
							$("#postPageSelect").empty();
							var totalPageNum = objs[0].totalPageNum;
							$("#totalPageLi").text('Total ' + totalPageNum + ' Page');
							for(var i = 1; i <= objs[0].totalPageNum; i++){
								var optionBar = '<option value="'
								+ i
								+'">'
								+ i
								+ '</option>';
								$("#postPageSelect").append(optionBar);
							}
						}
					},
					error : function() {
						alert("connect failed!");
					}
				});
}
	</script>
	<script>
	function turnToPostTwo(pageNum){
		//alert("aaa");
		$.ajax({
					type : "POST",
					async : false,
					cache : false,
					data : {"pageNum":pageNum},
					dataType: "text",
					contentType : "application/x-www-form-urlencoded",
					url : "/Mandarin-Library/ReaderPostInitServlet",
					traditional : true,
					success : function(data) {
						var objs = eval('(' + data + ')');
						$("#postContent").empty();
						for(var post in objs){
							if(post==0) continue;
							var div = '<tr><td class="postTitle">' + objs[post].title + '</td>'
									+ '<td class="postContent">' + objs[post].content + '</td>'
									+ '<td class="postTime">' + objs[post].posttime +'</td>'
									+ '<td class="postMore"><button onclick=turnToThisPost(' +objs[post].postno+')>More</button></td>'
									+ '</tr>';
							$("#postContent").append(div);
						}
					},
					error : function() {
						alert("connect failed!");
					}
				});
}
	</script>
<script>
		function postPageUp(){
			var options = $("#postPageSelect option:selected");
			var page = options.val();
			var lastPage = $("#postPageSelect > option:last").val();
			if(page != lastPage){
				$("#postPageSelect")[0].selectedIndex = page;
				page++;
				turnToPostTwo(page);
			}
			else document.getElementById("postPageUp").disabled = true;
		}
	</script>
	<script>
		function postPageDown(){
			var options = $("#postPageSelect option:selected");
			var page = options.val();
			if(page != 1){
				page--;
				turnToPostTwo(page);
				page--;
				$("#postPageSelect")[0].selectedIndex = page;
			}
			else document.getElementById("postPageDown").disabled = true;
		}
	</script>
		<script type="text/javascript">
		function showMore(){
			$("#postList").toggle();
		}
		
	</script>
</html>