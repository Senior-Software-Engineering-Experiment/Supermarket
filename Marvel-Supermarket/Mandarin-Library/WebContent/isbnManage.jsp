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
<title>ISBN Manage</title>
</head>
<body>
	<!-- 输入ISBN -->
				<div role="tabpanel" class="tab-pane" id="ISBN">

					<div
						style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
						<form class="form-horizontal" name="tijiao" method="post"
							action="InputISBNServlet">
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">ISBN:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bISBN" name="bISBN" placeholder=""
										style="margin-top: 7px;" oninvalid="setCustomValidity('Please fill in this field!')"
												oninput="setCustomValidity('')" required>
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<a class="linkCcc" href="#book" aria-controls="char" role="tab"
										data-toggle="tab">
										<button type="reset" class="btn btn-xs btn-white">Cancel</button>
									</a>

									<button type="submit" class="btn btn-xs btn-xs btn-green">Submit</button>

								</div>
							</div>
						</form>
					</div>

				</div>
				<!-- 通过ISBN添加书籍模块 -->
				<div role="tabpanel" class="tab-pane" id="addBookISBN">

					<div
						style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
						<form class="form-horizontal" name="tijiao" method="post"
							action="AddBookServlet">
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">ISBN:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bISBN" name="bISBN" placeholder=""
										value=<%=request.getAttribute("ISBN")%>
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Title:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bName" name="bName" placeholder=""
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Author:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bAuthor" name="bAuthor" placeholder=""
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Language:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bLanguage" name="bLanguage" placeholder=""
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Price:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bPrice" name="bPrice" placeholder=""
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Publish
									Date:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bTime" name="bTime" placeholder=""
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Publisher:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bPublish" name="bPublish" placeholder=""
										style="margin-top: 7px;">
								</div>
							</div>

							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Brief:</label>
								<div class="col-xs-5">
									<textarea class="form-control input-sm duiqi"
										style="height: 170px" id="bBrief" name="bBrief" placeholder=""
										style="margin-top: 7px;"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Category：</label>
								<div class="col-xs-5">

									<select id="bCategorySelect" name="bCategorySelect"
										class="form-control input-sm duiqi">
									</select>

								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Location：</label>
								<div class="col-xs-5">

									<select id="bLocationSelect" name="bLocationSelect"
										class="form-control input-sm duiqi">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">Copy
									Number:</label>
								<div class="col-xs-5">
									<input type="text" class="form-control input-sm duiqi"
										id="bNumber" name="bNumber" placeholder="" value="1"
										style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">

									<button type="reset" class="btn btn-xs btn-white">Cancel</button>
									</a>

									<button type="submit" class="btn btn-xs btn-green">Save</button>
								</div>
							</div>
						</form>
					</div>

				</div>
</body>
</html>