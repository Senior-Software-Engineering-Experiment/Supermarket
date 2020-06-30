<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="dao.BookDAO"%>
<%@ page import="entity.Book"%>
<%@ page import="java.sql.*"%>
<%@ page import="utils.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
</head>
<body>
	<!-- 书籍管理模块 -->
	<div role="tabpanel" class="tab-pane active" id="book">
		<div class="check-div form-inline">
			<div class="col-xs-3">
				<button class="btn btn-blue btn-xs" data-toggle="modal"
					data-target="#addBook">添加商品信息</button>

<!-- 				<button class="btn btn-yellow btn-xs" data-toggle="modal" -->
<!-- 					data-target="#ISBN">ADD WITH ISBN</button> -->

			</div>

			<form>
				<div class="col-lg-2" style="text-align: right;">
					<label for="paixu">选择:&nbsp;</label> <select
						class=" form-control" name="bookSortSelect" id="bookSortSelect">
						<option value="title" selected="selected">名称</option>
						<option value="author">产商</option>
						<option value="category">类别</option>
						<option value="ISBN">商品码</option>
					</select>
				</div>
				<div class="col-xs-3">
					<input type="text" class="form-control input-sm"
						placeholder="请输入..." name="searchContent" id="searchContent">
					<button type="button" class="btn btn-white btn-xs "
						onclick="searchBook()">提交</button>
				</div>
				<div class="col-xs-3">
					<a class="linkCcc" href="#DeleteRecord" aria-controls="char"
						role="tab" data-toggle="tab">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							onclick="deletesearch()">删除记录</button>
					</a>
				</div>

			</form>

		</div>

		<div class="data-div">
			<div class="row tableHeader">
				<!--调整col-lg- 这里的数字可以实现宽度的变化-->
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">商品号</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">名称</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">产商</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">商品码</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">类别</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">位置</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">操作</div>
			</div>
			<div id="displayBookDiv" name="disPlayBookDiv"></div>
		</div>
		<!--Page码块-->
		<footer class="footer" id="bookPageFooter" name="bookPageFooter">
			<ul class="pagination">
				<li><select id="bookPageSelect" name="bookPageSelect"
					onchange="displayBook(this.options[this.options.selectedIndex].value)">
				</select> 页</li>
				<li class="gray" id="bookTotalPageLi" name="bookTotalPageLi"></li>
				<li><i class="glyphicon glyphicon-menu-left" id="bookPageDown"
					name="bookPageDown" onclick=bookPageDown()> </i></li>
				<li><i class="glyphicon glyphicon-menu-right" id="bookPageUp"
					name="bookPageUp" onclick=bookPageUp()> </i></li>
			</ul>
		</footer>

		<!--弹出窗口 添加书籍-->
		<div class="modal fade" id="addBook" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">添加商品信息</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<form class="form-horizontal" name="tijiao" method="post"
								action="AddBookServlet">
								<div class="form-group ">
									<label for="bName" class="col-xs-3 control-label">名称：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											name="bName" id="bName" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="form-group">
									<label for="text" class="col-xs-3 control-label">品牌：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											name="bAuthor" id="bAuthor" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">原产地：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi"
											name="bLanguage" id="bLanguage" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">价格：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi"
											name="bPrice" id="bPrice" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">生产日期：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi"
											name="bTime" id="bTime" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">生产商：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi"
											name="bPublish" id="bPublish" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">介绍：</label>
									<div class="col-xs-8">
										<textarea class="form-control input-sm duiqi"
											style="height: 170px" name="bBrief" id="bBrief"
											placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">类别：</label>
									<div class="col-xs-8">
										<select id="bCategory" name="bCategory"
											class="form-control input-sm duiqi">
										</select>

									</div>
								</div>

								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">位置：</label>
									<div class="col-xs-6">
										<select id="bLocation" name="bLocation"
											class="form-control input-sm duiqi">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">数量</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi"
											name="bNumber" id="bNumber" value="1" placeholder=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-xs btn-xs btn-green">保存</button>
									<!-- 点击保存后数据要保存到数据库中，待实现-->
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
		<!-- 输入ISBN -->
		<div class="modal fade" id="ISBN" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">添加商品</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<form class="form-horizontal" name="tijiao" method="post"
								action="InputISBNServlet">
								<div class="form-group ">
									<label for="bName" class="col-xs-3 control-label">商品码:</label>
									<div class="col-xs-5 ">
										<input type="text" class="form-control input-sm duiqi"
											name="bISBN" id="bISBN" placeholder=""
											pattern="^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$"
											oninvalid="setCustomValidity('please input the right ISBN');"
											oninput="setCustomValidity('')">
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-xs btn-xs btn-green">保存</button>
									<!-- 点击保存后数据要保存到数据库中，待实现-->
								</div>
							</form>

						</div>
					</div>


				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!--修改书籍信息弹出窗口-->
		<div class="modal fade" id="changeBook" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">修改商品信息</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<form class="form-horizontal" id="saveBookInfoForm"
								name="saveBookInfoForm" action="ChangeBookInfoServlet">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">名称：</label>
									<div class="col-xs-8 ">
										<input type="hidden" id="thisBookNo" name="thisBookNo"
											value=""> <input type="text"
											class="form-control input-sm duiqi" id="thisBookTitle"
											placeholder="" value="" name="thisBookTitle"
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>

									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">品牌：</label>
									<div class="col-xs-8 ">
										<input type="" class="form-control input-sm duiqi"
											id="thisBookAuthor" placeholder="" value=""
											name="thisBookAuthor"
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										<!--使用EL语言实现输入框有默认值-->
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">原产地：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi"
											id="thisBookLanguage" name="thisBookLanguage" placeholder=""
											value=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										<!--使用EL语言实现输入框有默认值-->
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">价格：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi"
											id="thisBookPrice" name="thisBookPrice" placeholder=""
											value=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										<!--使用EL语言实现输入框有默认值-->
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">生产日期：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi"
											id="thisBookDate" name="thisBookDate" placeholder="" value=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										<!--使用EL语言实现输入框有默认值-->
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">生产商：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi"
											id="thisBookPublisher" name="thisBookPublisher"
											placeholder="" value=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										<!--使用EL语言实现输入框有默认值-->
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">介绍：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi"
											id="thisBookBrief" name="thisBookBrief" placeholder=""
											value=""
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										<!--使用EL语言实现输入框有默认值-->
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">类别：</label>
									<div class="col-xs-8">
										<select id="displayCtgInBookSelect"
											name="displayCtgInBookSelect"
											class="form-control input-sm duiqi"
											oninvalid="setCustomValidity('Please fill in this field!')"
											oninput="setCustomValidity('')" required>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">位置：</label>
									<div class="col-xs-6">
										<select id="thisBookLocationSelect"
											name="thisBookLocationSelect"
											class="form-control input-sm duiqi">

										</select>
									</div>
								</div>


							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white"
							data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-xs btn-green"
							onclick="saveBookInfo()" data-dismiss="modal">保存</button>
						<!-- 点击保存后数据要保存到数据库中，待实现，与添加数据一样-->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!--弹出删除资源警告窗口-->
		<div class="modal fade" id="deleteBook" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">删除商品</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">确定要删除此商品吗?</div>
						<form id="deleteThisBookForm" name="deleteThisBookForm"
							action="DeleteBookServlet">
							<input id="deleteBookNo" name="deleteBookNo" type="hidden"
								value="">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white"
							data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-xs btn-danger"
							onclick="deleteThisBook()" data-dismiss="modal">删除</button>
						<!--确定删除后结果存入数据库-->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 书籍管理script-->

	<script>
		function displayCategoryInBook(){
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				data : {"pageNum": 1},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "DisplayCategoryInBookServlet",
				traditional : true,
				success : function(data) {
					var objs = eval('(' + data + ')');
					$("#displayCtgInBookSelect").empty();
					$("#bCategory").empty();
					$("#bCategorySelect").empty();
					for ( var num in objs) {
						var categoryName = objs[num].categoryName;
						var div = '<option value="'
							+ categoryName
							+'">'
							+ categoryName
							+ '</option>';
						$("#displayCtgInBookSelect").append(div);
						$("#bCategory").append(div);
						$("#bCategorySelect").append(div);
					}
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
		function displayLocationInBook(){
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				data : {"pageNum": 1},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "DisplayLocationInBookServlet",
				traditional : true,
				success : function(data) {
					var objs = eval('(' + data + ')');
					$("#thisBookLocationSelect").empty();
					$("#bLocation").empty();
					$("#bLocationSelect").empty();
					for ( var num in objs) {
						var locationName = objs[num].locationName;
						var div = '<option value="'
							+ locationName
							+'">'
							+ locationName
							+ '</option>';
						$("#thisBookLocationSelect").append(div);
						$("#bLocation").append(div);
						$("#bLocationSelect").append(div);
					}
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>

	<script>
		function displayBook(pageNum){
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				data : {"pageNum": pageNum},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "DisplayBookServlet",
				traditional : true,
				success : function(data) {
					displayCategoryInBook();
					displayLocationInBook();
					var objs = eval('(' + data + ')');
					$("#displayBookDiv").empty();
					if(pageNum == 1){
						$("#bookPageSelect").empty();
						var totalPageNum = objs[0].totalPage;
						$("#bookTotalPageLi").text('Total ' + totalPageNum + ' Page');
						for(var i = 1; i <= objs[0].totalPage; i++){
							var optionBar = '<option value="'
							+ i
							+'">'
							+ i
							+ '</option>';
							$("#bookPageSelect").append(optionBar);
						}
					}
					for ( var num in objs) {
						var bookName = objs[num].bookName;
						var bookAuthor = objs[num].bookAuthor;
						if(objs[num].bookISBN == null) var bookISBN = null;
						else var bookISBN = objs[num].bookISBN;
						var bookCategory = objs[num].bookCategory;
						var bookLocation = objs[num].bookLocation;
						var bookNo = objs[num].bookNo;
						var div = '<div class="tablebody"><div class="row" >'
							+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ bookNo
							+ '</div>'
					        + '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ bookName
							+ '</div>'
							+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ bookAuthor
							+ '</div>'
							+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ bookISBN
							+ '</div>'
							+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ bookCategory
							+ '</div>'
							+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ bookLocation
							+ '</div>'
							+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
							+ '<button class="btn btn-success btn-xs" data-toggle="modal"'
							+ 'data-target="#changeBook"'
							+ 'onclick="turnToThisBook('
							+ bookNo
							+ ')">编辑</button>'
							+ '<button class="btn btn-danger btn-xs" data-toggle="modal"'
							+ 'data-target="#deleteBook"'
							+ 'onclick="toDeleteThisBook('
							+ bookNo
							+ ')">删除</button>'
							+ '</div></div></div>';
						$("#displayBookDiv").append(div);
					}
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
		window.onload = displayBook(1);
	</script>

	<script type="text/javascript">
		function turnToThisBook(bookNo) {
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "TurnToThisBookServlet",
				data : {
					"thisBookNo" : bookNo
				},
				traditional : true,
				success : function(data) {
					var obj = eval('(' + data + ')');
					$("#thisBookNo").val(obj.bookNo);
					$("#thisBookTitle").val(obj.title);
					$("#thisBookAuthor").val(obj.author);
					$("#thisBookLanguage").val(obj.language);
					$("#thisBookPrice").val(obj.price);
					$("#thisBookDate").val(obj.date);
					$("#thisBookPublisher").val(obj.publisher);
					$("#thisBookBrief").val(obj.brief);
					$("#displayCtgInBookSelect").val(obj.category);
					$("#thisBookLocationSelect").val(obj.location);
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>

	<script>
		function saveBookInfo() {
			var bookNo = document.getElementById("thisBookNo").value;
			var bookTitle = document.getElementById("thisBookTitle").value;
			var bookAuthor = document.getElementById("thisBookAuthor").value;
			var bookLanguage = document.getElementById("thisBookLanguage").value;
			var bookPrice = document.getElementById("thisBookPrice").value;
			var bookDate = document.getElementById("thisBookDate").value;
			var bookPublisher = document.getElementById("thisBookPublisher").value;
			var bookBrief = document.getElementById("thisBookBrief").value;
			var bookCatebory = $("#displayCtgInBookSelect option:selected").val();
			var bookLocation = $("#thisBookLocationSelect option:selected").val();
			$.ajax({
				type : "POST",
				async : false,
				cache : true,
			    contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "ChangeBookInfoServlet",
				data : {"bookNo" : bookNo, "bookTitle" : bookTitle, "bookAuthor" : bookAuthor, 
					"bookLanguage" : bookLanguage, "bookPrice" : bookPrice, 
					"bookDate" : bookDate, "bookPublisher" : bookPublisher,
					"bookBrief" : bookBrief, "bookCategory" : bookCatebory,
					"bookLocation" : bookLocation},
				traditional : true,
				success : function(data) {
					alert("modify book successfully!");
					displayBook(1);
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
		function toDeleteThisBook(thisBookNo) {
			$("#deleteBookNo").val(thisBookNo);
		}
	</script>
	<script>
		function deleteThisBook() {
			var bookNo = document.getElementById("deleteBookNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
			    contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "DeleteBookServlet",
				data : {"deleteBookNo" : bookNo},
				traditional : true,
				success : function(data) {
					alert("delete the book successfully!");
					displayBook(1);
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>

	<script>
		function searchBook(){
			var bookSearch = document.getElementById("searchContent").value;
			var bookSort = $("#bookSortSelect option:selected").val();
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
			    contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				url : "BookSearchServlet",
				data : {"searchContent" : bookSearch, "sort" : bookSort},
				traditional : true,
				success : function(data) {
					var objs = eval('(' + data + ')');
					$("#displayBookDiv").empty();
					for ( var num in objs) {
						var bookName = objs[num].bookName;
						var bookAuthor = objs[num].bookAuthor;
						var bookISBN = objs[num].bookISBN;
						var bookCategory = objs[num].bookCategory;
						var bookLocation = objs[num].bookLocation;
						var bookNo = objs[num].bookNo;
						var div = '<div class="tablebody"><div class="row" >'
								+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ bookNo
								+ '</div>'
						        + '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ bookName
								+ '</div>'
								+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ bookAuthor
								+ '</div>'
								+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ bookISBN
								+ '</div>'
								+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ bookCategory
								+ '</div>'
								+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ bookLocation
								+ '</div>'
								+ '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'
								+ '<button class="btn btn-success btn-xs" data-toggle="modal"'
								+ 'data-target="#changeBook"'
								+ 'onclick="turnToThisBook('
								+ bookNo
								+ ')">Modify</button>'
								+ '<button class="btn btn-danger btn-xs" data-toggle="modal"'
								+ 'data-target="#deleteBook"'
								+ 'onclick="toDeleteThisBook('
								+ bookNo
								+ ')">Delete</button>'
								+ '</div></div></div>';
						$("#displayBookDiv").append(div);
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
			var options = $("#bookPageSelect option:selected");
			var page = options.val();
			var lastPage = $("#bookPageSelect > option:last").val();
			if(page != lastPage){
				$("#bookPageSelect")[0].selectedIndex = page;
				page++;
				displayBook(page);
			}
			else document.getElementById("bookPageUp").disabled = true;
		}
	</script>
	<script>
		function bookPageDown(){
			var options = $("#bookPageSelect option:selected");
			var page = options.val();
			if(page != 1){
				page--;
				displayBook(page);
				page--;
				$("#bookPageSelect")[0].selectedIndex = page;
			}
			else document.getElementById("bookPageDown").disabled = true;
		}
	</script>
</body>
</html>