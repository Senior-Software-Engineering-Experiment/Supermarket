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


<link href="css/library-bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/library-common.css" />
<link rel="stylesheet" type="text/css" href="css/library-slide.css" />
<link rel="stylesheet" type="text/css"
	href="css/library-bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/library-flat-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/library-jquery.nouislider.css">
<body>
<div id="wrap">
		<!-- 左侧菜单栏目块 -->
			<%@include file = "leftMeun.jsp" %>
		<!-- 左侧菜单栏目块 -->
<form action="DeleteBorrowServlet" method="post" name="deleteborrow" id="deleteborrow">
	     <input type="hidden" id="borrowBookNo" name="borrowBookNo">
	     <input type="hidden" id="borrowData" name="borrowData">
	</form>
	
	<div role="tabpanel" class="tab-pane" id="record">
					<div class="check-div form-inline">
					<a href="library.jsp"><span class="glyphicon glyphicon glyphicon-chevron-left"></span>返回</a>
						<span  aria-controls="user" role="tab"
							data-toggle="tab" style="cursor: pointer;">返回</span>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 ">商品号</div>
							<div class="col-xs-2">名称</div>
							<div class="col-xs-2">品牌</div>
							<div class="col-xs-2">Data</div>
							<div class="col-xs-1">Fine</div>
							<div class="col-xs-1">Returned</div>
							<div class="col-xs-2">Operation</div>
						</div>
	<script>
		   function deleteBorrow(bookNo,data){
			      alert("111");
			      $("#borrowBookNo").val(bookNo);
			      $("#borrowData").val(data);
		          //document.getElementById("borrowBookNo").value = bookNo;
		          //document.getElementById("borrowData").value = data;
		          document.forms["deleteborrow"].submit();
		             //var i = $("#borrowReader").val();
		           
		          }
	</script>
						<c:forEach var="borrow" items="${borrows}">
						<div class="tablebody">
							<div class="row">
							
								<div class="col-xs-2 ">${borrow.bookNo}</div>
								<div class="col-xs-2">${borrow.title}</div>
								<div class="col-xs-2">${borrow.author}</div>
								<div class="col-xs-2">${borrow.borrowTime}</div>
								<div class="col-xs-1">${borrow.fine}</div>
								<div class="col-xs-1">${borrow.isReturned}</div>
								<div class="col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#penalty">Fine</button>
									<!--此书有逾期罚款时才显示-->
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										 onclick="deleteBorrow('${borrow.bookNo}','${borrow.borrowTime}')">Delete</button>
								</div>
								
							</div>

						</div>
						</c:forEach>

					</div>
					

					<!--弹出增加时间段窗口-->
					<div class="modal fade" id="addRecord" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">借书</h4>
								</div>
								<div class="modal-body">
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">书名：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm duiqi"
															id="bName" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sLink" class="col-xs-3 control-label">作者：</label>
													<div class="col-xs-8 ">
														<input type="" class="form-control input-sm duiqi"
															id="bAuthor" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-xs btn-green">Save</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--修改记录窗口-->
					<div class="modal fade" id="changeRecord" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">还书</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">正常还书？</label>
												<div class="col-xs-8 ">
													<!--<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">-->
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-green btn-xs">确 定</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出罚款模块-->
					<div class="modal fade" id="penalty" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定已提交罚款？</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-danger btn-xs">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>


					<!--弹出删除记录警告窗口-->
					<div class="modal fade" id="deleteRecord" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该记录？</div>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-danger btn-xs">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
</div>
				</div>
</body>
</html>