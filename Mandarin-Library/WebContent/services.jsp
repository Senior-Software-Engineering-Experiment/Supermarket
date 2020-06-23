<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindBook</title>
<link rel="stylesheet" href="css/page.css">
<link rel="stylesheet" href="css/bookSearch.css">

</head>
<body>
	<!-- services -->
	<div class="services" id="services"
		style="background: url(images/te1.jpg) repeat 0px 0px; margin: 80px 0;">
		<div class="search" style="margin: 0 auto;">
			<h3>Find Books</h3>
			<form id="search"></form>
		</div>
		<!--横线-->
		<div class="bar"></div>
		<!--图片-->
		<div class="photo"></div>
		<form action="BookReserveServlet" method="post" name="accept">
			<input type="hidden" id="test" name="bookNo">
		</form>
		<div>
			<div id="searchBookContent" class="content"></div>
			<!--Page码块-->
			<footer class="page" id="bookPageFooter" style="display: none;">
				<ul class="pagecontent">
					<li><select id="bookPageSelect" name="bookPageSelect"
						onchange="turnToBookOne(this.options[this.options.selectedIndex].value)">
					</select> Page</li>
					<li class="pagegray" id="totalPageLi"></li>
					<li><i class="pageglyphicon glyphicon-menu-left"
						id="bookPageUp" onclick=bookPageDown()> </i></li>
					<li><i class="pageglyphicon glyphicon-menu-right"
						id="bookPageDown" onclick=bookPageUp()> </i></li>
				</ul>
			</footer>
		</div>
		<div class="clearfix"></div>

		<!-- bottom-top -->
		<!-- smooth scrolling -->


	</div>
	<!-- //services -->
	<!--弹出删除用户警告窗口-->
	<form action="BookReserveServlet" method="post">
		<input type="hidden" id="bookNo" name="bookNo" value="">
		<div class="modal fade" id="reserve" role="dialog"
			aria-labelledby="gridSystemModalLabel" style="margin-top: 100px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Booking</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">Are you sure to Booking?</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white"
							data-dismiss="modal">Cancel</button>
						<button type="submit" id="deleteReader" name="deleteReader"
							class="btn  btn-xs btn-danger">Save</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</form>

</body>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	function initbookSearch(){
		//alert("aaa");
		$.ajax({
					type : "GET",
					async : false,
					cache : false,
					data : {},
					dataType: "text",
					contentType : "application/x-www-form-urlencoded",
					url : "ReaderBookSearchInitServlet",
					traditional : true,
					success : function(data) {
						var objs = eval('(' + data + ')');
						
						$("#search").empty();
						var div='<select class="bookType" id="type1" name="type1"style="margin-bottom: 10px;">'
							+ '<option value="">Book Category</option>';
						for(var i in objs.categorys){
							div = div + '<option value="' + objs.categorys[i].categoryName + '">'+objs.categorys[i].categoryName+'</option>';	
						}
						
						div = div + '</select> <select class="bookType" id="type2" name="type2"style="margin-bottom: 10px;">'
							+ '<option value="title">Title</option>'
							+ '<option value="author">Author</option>'
							+ '</select> '
							+ '<input type="search" id="searchContent" name="searchContent"value=""> '
							+ '<input type="hidden" id="pageNum" name="pageNum" value="1"> '
							+ '<button type="button" id="submit" value="search"style="width: 20%;height: 30px;margin: 10px 0 10px 0;border-radius: 10px;border-color: #6a67ce;" onclick="turnToSearchBook()">Search</button>';
						$("#search").append(div);
					},
					error : function() {
						alert("connect failed!");
					}
				});
}
	</script>
<script>
	    function sc(bookNo) {
			  document.getElementById("bookNo").value = bookNo;
        }
	</script>
<script>
		function turnToSearchBook(){
			var type1 = document.getElementById("type1").value;
			var type2 = document.getElementById("type2").value;
			var searchContent = document.getElementById("searchContent").value;
			var pageNum = document.getElementById("pageNum").value;
			turnToBook(type1,type2,searchContent,pageNum);
		}
	</script>
<script>
		function turnToBookOne(pageNum){
			//alert(pageNum);
			var type1 = document.getElementById("type1").value;
			var type2 = document.getElementById("type2").value;
			var searchContent = document.getElementById("searchContent").value;
			turnToBook(type1,type2,searchContent,pageNum);
		}
	</script>
<script>
	function turnToThisBook(id,ISBN){
		//alert("aaa");
		$.ajax({
					type : "GET",
					async : false,
					cache : false,
					data : {"ISBN":ISBN},
					dataType: "text",
					contentType : "application/x-www-form-urlencoded",
					url : "ReaderBookSearchServlet",
					traditional : true,
					success : function(data) {
						var objs = eval('(' + data + ')');
						$(id).empty();
						$(id).toggle();
						
						for ( var num in objs ) {
							//alert(objs[num]);
							var bookNo = objs[num].bookNo;
							var bookTitle = objs[num].bookTitle;
							var bookAuthor = objs[num].bookAuthor ;
							var bookCategory = objs[num].bookCategory ;
							var bookBrief = objs[num].bookBrief ;
							var bookISBN = objs[num].bookISBN ;
							var bookLocation = objs[num].bookLocation ;
							var bookPrice = objs[num].bookPrice ;
							var bookPublish = objs[num].bookPublish ;
							var bookTime = objs[num].bookTime ;
							var bookPage = objs[num].totalPage ;
							var isReserve = objs[num].isReserve ;
							var div =  '<div class="more" style="margin: 10px 0;">'
									+ '<div class="col-lg-5" style="margin-left: 20px;">'+ bookNo 
									+ '</div><div class="col-lg-5">' + bookLocation
									+ '</div>';
							if(isReserve){
			            		div = div + '<button class="btn btn-danger btn-xs" data-toggle="modal" style="width:70px;">Reserved<tton>';
			            	}else{
			            		div = div + '<button class="btn-primary" data-toggle="modal" style="color: white;padding: 1px 5px;font-size: 12px;line-height: 1.5;border-radius: 3px;"'
										+ 'data-target="#reserve" onclick="sc('+bookNo+')">Reserve<tton>';
			            	}
							$(id).append(div);
						}
						
					},
					error : function() {
						alert("connect failed!");
					}
				});
}
	</script>
<script>
	function turnToBook(type1,type2,searchContent,pageNum){
		//alert("aaa");
		$.ajax({
					type : "POST",
					async : false,
					cache : false,
					data : {"type1":type1,"type2":type2,"searchContent":searchContent,"pageNum":pageNum},
					dataType: "text",
					contentType : "application/x-www-form-urlencoded",
					url : "ReaderBookSearchServlet",
					traditional : true,
					success : function(data) {
						var objs = eval('(' + data + ')');
						document.getElementById("bookPageFooter").style.display = "none";
						var total = objs.length;
						if(total==0){
							$("#searchBookContent").empty();
							var noone= '<h1 style=" text-align: center;">We are so sorry.There is no such book that you finding!</h1>';
							$("#searchBookContent").append(noone);
						}
						if(objs[0].totalPage>1){
							document.getElementById("bookPageFooter").style.display = "block";
							}
						if(total!=0){
						$("#searchBookContent").empty();
						if(pageNum == 1){
							$("#searchBookContent").empty();
							var totalPageNum = objs[0].totalPage;
							$("#totalPageLi").text('Total ' + totalPageNum + ' Page');
							for(var i = 1; i <= objs[0].totalPage; i++){
								var optionBar = '<option value="'
								+ i
								+'">'
								+ i
								+ '</option>';
								$("#bookPageSelect").append(optionBar);
							}
						}
						for ( var num in objs ) {
							//alert(objs[num]);
							var bookNo = objs[num].bookNo;
							var bookTitle = objs[num].bookTitle;
							var bookAuthor = objs[num].bookAuthor ;
							var bookCategory = objs[num].bookCategory ;
							var bookBrief = objs[num].bookBrief ;
							var bookISBN = objs[num].bookISBN ;
							var bookLocation = objs[num].bookLocation ;
							var bookPrice = objs[num].bookPrice ;
							var bookPublish = objs[num].bookPublish ;
							var bookTime = objs[num].bookTime ;
							var bookPage = objs[num].totalPage ;
							var isReserve = objs[num].isReserve ;
							var div =  '<div class="col-md-12 eve-agile e1" style="height: auto;border: solid;margin: 0 180px;background: rgba(0,0,0,0.6);margin-bottom: 30px;">'
										+ '<div class="content-sub1">'
										+ '<h3>'
			                            + '<a  data-toggle="modal">' + bookTitle + '</a> </h3>'
			                            + '<h6 style="margin-left: 20px;">Author:<span>' + bookAuthor + '</span></h6>'
			                            + '<h6 style="margin-left: 20px;">Category:<span>' + bookCategory + '</span> </h6>'
			                            + '<h6 style="margin-left: 20px;">ISBN:<span>' + bookISBN + '</span> </h6>'
			                            + '<h6 style="margin-left: 20px;">Publisher:<span>' + bookPublish + '</span> </h6>'
			                            + '<h6 style="margin-left: 20px;">Publish Time:<span>' + bookTime + '</span> </h6>'
			                            + '<h6 style="margin-left: 20px;overflow: hidden;">Describe:<span>' + bookBrief + '</span> </h6>'
			                            + '<button class="btn btn-danger btn-xs" data-toggle="modal" style="margin-left: 20px;width:70px;margin-bottom: 10px;" onclick="turnToThisBook(book'+num+','+bookISBN+')"><span>MORE↓</span></button>'
			                            + '</div>'+ '<div id="book'+num+'"style="width: 100%;float: left;border-top: solid;display:none;"></div>';
							$("#searchBookContent").append(div);
							
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
		function bookPageUp(){
			var type1 = document.getElementById("type1").value;
			var type2 = document.getElementById("type2").value;
			var searchContent = document.getElementById("searchContent").value;
			var options = $("#bookPageSelect option:selected");
			var page = options.val();
			var lastPage = $("#bookPageSelect > option:last").val();
			if(page != lastPage){
				$("#bookPageSelect")[0].selectedIndex = page;
				page++;
				turnToBook(type1,type2,searchContent,page);
			}
			else document.getElementById("bookPageUp").disabled = true;
		}
	</script>
<script>
		function bookPageDown(){
			var type1 = document.getElementById("type1").value;
			var type2 = document.getElementById("type2").value;
			var searchContent = document.getElementById("searchContent").value;
			var options = $("#bookPageSelect option:selected");
			var page = options.val();
			if(page != 1){
				page--;
				turnToBook(type1,type2,searchContent,page);
				page--;
				$("#bookPageSelect")[0].selectedIndex = page;
			}
			else document.getElementById("bookPageDown").disabled = true;
		}
	</script>
<script>
	function sq(bookNo) {
		var r = confirm("Are you sure？");
		if (r == true) {
			document.getElementById("test").value = bookNo;
			document.forms["accept"].submit();
			alert("Succssed!Please get the in 2 hours!");
		}
		//document.getElementById("demo").innerHTML=x;
	}
</script>
</html>