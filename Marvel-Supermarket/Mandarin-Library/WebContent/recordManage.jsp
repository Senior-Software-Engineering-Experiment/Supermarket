<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Records</title>
</head>
<body>
	<div role="tabpanel" class="tab-pane" id="record">
					<div class="check-div form-inline">
						<span href="#user" aria-controls="user" role="tab"
							data-toggle="tab" style="cursor: pointer;"><span
							class="glyphicon glyphicon glyphicon-chevron-left"></span>Back</span>
						userName;
						<button class="btn btn-yellow btn-xs " data-toggle="modal"
							data-target="#addRecord">Lend</button>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 ">Book No</div>
							<div class="col-xs-2">Title</div>
							<div class="col-xs-2">借阅时长</div>
							<div class="col-xs-2">状态</div>
							<div class="col-xs-3">操作</div>
						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-2 ">6426398978</div>
								<div class="col-xs-2">项目管理</div>
								<div class="col-xs-2">27天</div>
								<div class="col-xs-2">正常</div>
								<div class="col-xs-3">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#changeRecord">Return book</button>
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#penalty">Fine</button>
									<!--此书有逾期罚款时才显示-->
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteRecord">Delete</button>
								</div>
							</div>

						</div>

					</div>
					<!--Page码块-->
					<footer class="footer">
						<ul class="pagination">
							<li><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
							</select> Page</li>
							<li class="gray">Total 20Page</li>
							<li><i class="glyphicon glyphicon-menu-left"> </i></li>
							<li><i class="glyphicon glyphicon-menu-right"> </i></li>
						</ul>
					</footer>

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
</body>
</html>