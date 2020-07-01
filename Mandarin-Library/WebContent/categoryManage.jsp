<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage category</title>
</head>
<body>
	<!-- 分类管理模块 -->
	<div role="tabpanel" class="tab-pane" id="category" name="category">
		<div class="check-div form-inline">
			<div class="col-xs-3">
				<button class="btn btn-yellow btn-xs" data-toggle="modal"
					data-target="#addCategory">ADD CATEGORY</button>
			</div>

		</div>
		<div class="data-div">
			<div class="row tableHeader">

				<div class="col-xs-5">Category No:</div>
				<div class="col-xs-5">Category Name:</div>
				<div class="col-xs-2">Operation:</div>
			</div>



			<div class="tablebody" name="categoryDisplayDiv"
				id="categoryDisplayDiv" style="margin: 20px 0;"></div>

		</div>
		<!--Page码块-->
		<footer class="footer" id="categoryPageFooter"
			name="categoryPageFooter">
			<ul class="pagination">
				<li><select id="categoryPageSelect" name="categoryPageSelect"
					onchange="turnToCategory(this.options[this.options.selectedIndex].value)">
				</select> Page</li>
				<li class="gray" id="totalPageLi" name="totalPageLi"></li>
				<li><i class="glyphicon glyphicon-menu-left"
					id="categoryPageDown" name="categoryPageDown" onclick=categoryPageDown()>
				</i></li>
				<li><i class="glyphicon glyphicon-menu-right"
					id="categoryPageUp" name="categoryPageUp"
					onclick=categoryPageUp()> </i></li>
			</ul>
		</footer>


		<!--弹出添加分类窗口-->
		<div class="modal fade" id="addCategory" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Add
							Category</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<form class="form-horizontal" name="tijiao" id="tijiao" action="AddCategoryServlet">
								<div class="form-group ">
									<label for="cName" class="col-xs-3 control-label">Name：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											id="newCategoryName" name="newCategoryName" placeholder="" 
												oninvalid="setCustomValidity('Please fill in this field!')"
													oninput="setCustomValidity('')" required>
									</div>
								</div>
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-xs btn-green" onclick="newCategory()" data-dismiss="modal">Save</button>
								</div>
							
						</div>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!--弹出修改分类窗口-->
		<div class="modal fade" id="reviseCategory" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Modify
							Category</h4>
					</div>
					<form class="form-horizontal" id="saveCategoryInfoForm"
						name="saveCategoryInfoForm" action="ChangeCategoryInfoServlet">
						<div class="modal-body">
							<div class="container-fluid">

								<div class="form-group ">
									<label for="thisName" class="col-xs-3 control-label">Name：</label>
									<div class="col-xs-8 ">
										<input type="hidden" id="thisCategoryNo" name="thisCategoryNo"
											value=""> 
										<input type="text"
											class="form-control input-sm duiqi" id="thisName"
												name="thisName" placeholder="" 
													oninvalid="setCustomValidity('Please fill in this field!')"
														oninput="setCustomValidity('')" required>
									</div>
								</div>

							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-xs btn-white"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-xs btn-green"
								onclick="saveCategoryInfo()" data-dismiss="modal">Save</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!--弹出删除分类警告窗口-->
		<form>
			<input id="deleteCategoryNo" name="deleteCategoryNo" type="hidden"
				value="">
			<div class="modal fade" id="deleteCategory" role="dialog"
				aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="gridSystemModalLabel">Prompt</h4>
						</div>
						<div class="modal-body">
							<div class="container-fluid">Are you sure you want to
								delete this category?</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-xs btn-white"
								data-dismiss="modal">Cancel</button>
							<button type="button" id="deleteCategory" name="deleteCategory"
								class="btn  btn-xs btn-danger" onclick="deleteThisCategory()" data-dismiss="modal">Delete</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</form>
	</div>

	<!-- 分类管理script-->

	

	<script type="text/javascript">
		function turnToThisCategory(categoryNo) {
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				contentType : "application/x-www-form-urlencoded",
				url : "TurnToThisCategoryServlet",
				data : {
					"thisCategoryNo" : categoryNo
				},
				traditional : true,
				success : function(data) {
					var obj = eval('(' + data + ')');
					$("#thisCategoryNo").val(obj.categoryNo);
					$("#thisName").val(obj.categoryName);

				},
				error : function() {
					alert("connect failed!");
					alert(categoryNo);
				}
			});
		}
	</script>
	
	<script>
		function turnToCategory(pageNum) {
				$.ajax({
							type : "POST",
							async : false,
							cache : false,
							data : {"pageNum": pageNum},
							contentType : "application/x-www-form-urlencoded",
							url : "DisplayCategoryServlet",
							traditional : true,
							success : function(data) {
								var objs = eval('(' + data + ')');
								$("#categoryDisplayDiv").empty();
								if(pageNum == 1){
									$("#categoryPageSelect").empty();
									var totalPageNum = objs[0].totalPage;
									$("#totalPageLi").text('Total ' + totalPageNum + ' Page');
									for(var i = 1; i <= objs[0].totalPage; i++){
										var optionBar = '<option value="'
										+ i
										+'">'
										+ i
										+ '</option>';
										$("#categoryPageSelect").append(optionBar);
									}
								}
								for ( var num in objs) {
									var categoryname = objs[num].categoryName;
									var categoryNo = objs[num].categoryNo;
									var div = '<div class="tablebody">'
											  	+ '<div class="row">'
												+ '<div class="col-xs-5">' 
												+ categoryNo
												+ '</div>'
												+ '<div class="col-xs-5">'
												+ categoryname
												+ '</div>'
												+ '<button class="btn btn-success btn-xs" data-toggle="modal"'
												+ 'data-target="#reviseCategory"'
												+ 'onclick="turnToThisCategory('
												+ categoryNo
												+ ')">Modify</button>'
												+ '<button class="btn btn-danger btn-xs" data-toggle="modal"'
												+ 'data-target="#deleteCategory"'
												+ 'onclick="toDeleteThisCategory('
												+ categoryNo
												+ ')">Delete</button>'
												+ '</div>'
												+ '</div>';
									$("#categoryDisplayDiv").append(div);
								}
							},
							error : function() {
								alert("connect failed!");
							}
						});
		}
	</script>
	
	<script>
		function newCategory(){
			var cName = document.getElementById("newCategoryName").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : true,
			    contentType : "application/x-www-form-urlencoded",
				url : "AddCategoryServlet",
				data : {"newCategoryName" : cName},
				traditional : true,
				success : function(data) {
					alert("add successfully!");
				},
				error : function() {
					alert("connect failed!");
				}
			});
			turnToCategory(1);
		}
	</script>

	<script>
		function saveCategoryInfo() {
			var cName = document.getElementById("thisName").value;
			var cId = document.getElementById("thisCategoryNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : true,
			    contentType : "application/x-www-form-urlencoded",
				url : "ChangeCategoryInfoServlet",
				data : {"thisName" : cName, "thisCategoryNo" : cId},
				traditional : true,
				success : function(data) {
					alert("edit successfully!");
				},
				error : function() {
					alert("connect failed!");
				}
			});
			turnToCategory(1);
		}
	</script>
	<script>
		function toDeleteThisCategory(thisCategoryNo) {
			$("#deleteCategoryNo").val(thisCategoryNo)
		}
	</script>
	<script>
		function deleteThisCategory() {
			var categoryNo = document.getElementById("deleteCategoryNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
			    contentType : "application/x-www-form-urlencoded",
				url : "DeleteCategoryServlet",
				data : {"thisCategoryNo" : categoryNo},
				traditional : true,
				success : function(data) {
					alert("delete successfully!");
					turnToCategory(1);
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
		function categoryPageUp(){
			var options = $("#categoryPageSelect option:selected");
			var page = options.val();
			var lastPage = $("#categoryPageSelect > option:last").val();
			if(page != lastPage){
				$("#categoryPageSelect")[0].selectedIndex = page;
				page++;
				turnToCategory(page);
			}
			else document.getElementById("categoryPageUp").disabled = true;
		}
	</script>
	<script>
		function categoryPageDown(){
			var options = $("#categoryPageSelect option:selected");
			var page = options.val();
			if(page != 1){
				page--;
				turnToCategory(page);
				page--;
				$("#categoryPageSelect")[0].selectedIndex = page;
			}
			else document.getElementById("categoryPageDown").disabled = true;
		}
	</script>
</body>
</html>