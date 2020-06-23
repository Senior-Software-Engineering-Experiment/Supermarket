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
		<%@include file="leftMeun.jsp"%>
		<!-- 左侧菜单栏目块 -->
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->

			<br /> <br />
			<form class="form-horizontal" name="tijiao" method="post"
				action="AddBookServlet">
				<div align=center>
					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">ISBN:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi" id="bISBN"
								name="bISBN" placeholder=""
								value="<%=request.getAttribute("ISBN")%>" style="margin-top: 7px;">
						</div>
					</div>

					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Title:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi" id="bName"
								name="bName" placeholder=""
								value="<%=request.getAttribute("title")%>"
								style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>

					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Author:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi"
								id="bAuthor" name="bAuthor" placeholder=""
								value="<%=request.getAttribute("author")%>"
								style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>

					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Language:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi"
								id="bLanguage" name="bLanguage" placeholder=""
								value="<%=request.getAttribute("language")%>"
								style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>

					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Price:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi"
								id="bPrice" name="bPrice" placeholder=""
								value="<%=request.getAttribute("price")%>"
								style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>

					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Publish
							Date:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi" id="bTime"
								name="bTime" placeholder=""
								value="<%=request.getAttribute("time")%>" style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>

					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Publisher:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi"
								id="bPublish" name="bPublish" placeholder=""
								value="<%=request.getAttribute("publisher")%>"
								style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>


					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Brief:</label>
						<div class="col-xs-2">
							<textarea class="form-control input-sm duiqi"
								style="height: 200px;" name="bBrief" id="bBrief" placeholder=""
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required><%=request.getAttribute("brief")%></textarea>

						</div>
					</div>


					<div class="form-group">
						<label for="sOrd" class="col-xs-5 control-label">Category：</label>
						<div class="col-xs-2">
							<%
								List<String> list = new ArrayList<String>();

								Connection con = null;

								ResultSet rs = null;

								Statement stmt = null;

								con = DBHelper.getInstance().getConnection();

								String sql = "select categoryname from category";

								stmt = con.createStatement();

								try {

									rs = stmt.executeQuery(sql);

									while (rs.next()) {

										list.add(rs.getString("categoryname"));

									}
									DBHelper.closeConnection(con, stmt, rs);
								} catch (SQLException ex) {

									System.out.println(ex.getMessage());

								}
							%>
							<select id="bCategory" name="bCategory"
								class="form-control input-sm duiqi">

								<%
									for (int i = 0; i < list.size(); i++) {
								%>



								<option><%=list.get(i)%></option>



								<%
									}
								%>

							</select>

						</div>
					</div>

					<div class="form-group">
						<label for="sOrd" class="col-xs-5 control-label">Location：</label>
						<div class="col-xs-2">
							<%
								List<String> list1 = new ArrayList<String>();

								Connection con1 = null;

								ResultSet rs1 = null;

								Statement stmt1 = null;

								con1 = DBHelper.getInstance().getConnection();

								String sql1 = "select locationname from location";

								stmt1 = con1.createStatement();

								try {

									rs1 = stmt1.executeQuery(sql1);

									while (rs1.next()) {

										list1.add(rs1.getString("locationname"));

									}
									DBHelper.closeConnection(con1, stmt1, rs1);
								} catch (SQLException ex) {

									System.out.println(ex.getMessage());

								}
							%>
							<select id="bLocation" name="bLocation" style="margin-top: 7px;"
								class="form-control input-sm duiqi">
								<%
									for (int i = 0; i < list1.size(); i++) {
								%>



								<option><%=list1.get(i)%></option>



								<%
									}
								%>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label for="sKnot" class="col-xs-5 control-label">Copy
							Number:</label>
						<div class="col-xs-2">
							<input type="text" class="form-control input-sm duiqi" value="1"
								id="bNumber" name="bNumber" placeholder=""
								style="margin-top: 7px;"
								oninvalid="setCustomValidity('Please fill in this field!')"
								oninput="setCustomValidity('')" required>
						</div>
					</div>

				</div>
				<div align=center>
					<button type="button" class="btn btn-xs btn-xs btn-yellow"
						data-toggle="modal"
						style="margin-bottom: 30px; height: 30px; width: 130px; font-size: 20px;"
						onclick="window.location='library.jsp'">Cancel</button>
					<button type="submit" class="btn btn-xs btn-xs btn-green"
						data-toggle="modal"
						style="margin-bottom: 30px; height: 30px; width: 130px; font-size: 20px;">Submit</button>

				</div>
			</form>

		</div>