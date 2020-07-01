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
<script>
		function lendBookPageUp(){
			var options = $("#lendBookPageSelect option:selected");
			var page = options.val();
			var lastPage = $("#lendBookPageSelect > option:last").val();
			if(page != lastPage){
				$("#lendBookPageSelect")[0].selectedIndex = page;
				page++;
				showLend(page);
			}
			else document.getElementById("lendBookPageUp").disabled = true;
		}
	</script>
<script>
		function lendBookPageDown(){
			var options = $("#lendBookPageSelect option:selected");
			var page = options.val();
			if(page != 1){
				page--;
				showLend(page);
				page--;
				$("#lendBookPageSelect")[0].selectedIndex = page;
			}
			else document.getElementById("lendBookPageDown").disabled = true;
		}
	</script>


<style>
.mytxt {
	color: #333;
	line-height: normal;
	font-family: "Microsoft YaHei", Tahoma, Verdana, SimSun;
	font-style: normal;
	font-variant: normal;
	font-size-adjust: none;
	font-stretch: normal;
	font-weight: normal;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding-top: 4px;
	padding-right: 4px;
	padding-bottom: 4px;
	padding-left: 4px;
	font-size: 15px;
	outline-width: medium;
	outline-style: none;
	outline-color: invert;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	text-shadow: 0px 1px 2px #fff;
	background-attachment: scroll;
	background-repeat: repeat-x;
	background-position-x: left;
	background-position-y: top;
	background-size: auto;
	background-origin: padding-box;
	background-clip: border-box;
	background-color: rgb(255, 255, 255);
	margin-right: 8px;
	border-top-color: #ccc;
	border-right-color: #ccc;
	border-bottom-color: #ccc;
	border-left-color: #ccc;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
}

.mytxt:focus {
	border: 1px solid #fafafa;
	-webkit-box-shadow: 0px 0px 6px #007eff;
	-moz-box-shadow: 0px 0px 5px #007eff;
	box-shadow: 0px 0px 5px #007eff;
}
</style>
<meta charset="UTF-8">
<title>bookLend</title>
</head>
<body>
	<script type="text/javascript">
$(document).ready(function(){
	//alert("success!");
    search();
});
</script>
	<script type="text/javascript">
function search(){
	//alert(1);
	 $.ajax({
         type:"POST", //request method  
         url:"SearchBookServlet", //reqest url  
         cache: false,     
         data:{//Biography  
             "searchContent":$("#lendsearchContent").val(),
             "sort":$("#sort").val(),    
         },
         dataType: "json",   //return type  
         success:function(json){
        
        	 var ht="";
        	 for (var i = 0; i < json.length; i++) {
                 if (json[i].bookNo == undefined) {
                     json[i].bookNo = '';
                 }
                 if (json[i].title == undefined) {
                	 json[i].title = '';
                 }
                 if (json[i].author== undefined) {
                	 json[i].author = '';
                 }
                 if (json[i].category == undefined) {
                	 json[i].category = '';
                 }
                 if (json[i].state == undefined) {
                	 json[i].state = '';
                 }
                 ht = ht + "<div class='row'>";
                 ht = ht + "<div class='colo-lg-1 col-md-1 col-sm-1 col-xs-3' style='height: 50px; overflow:hidden'>" + json[i].bookNo + "</div>";
                 ht = ht + "<div class='colo-lg-3 col-md-3 col-sm-3 col-xs-3' style='height: 50px; overflow:hidden'>" + json[i].title + "</div>";
                 ht = ht + "<div class='colo-lg-3 col-md-3 col-sm-3 col-xs-3' style='height: 50px; overflow:hidden'>" + json[i].author + "</div>";
                 ht = ht + "<div class='colo-lg-3 col-md-3 col-sm-3 col-xs-3' style='height: 50px; overflow:hidden'>" + json[i].category + "</div>";
                 if(json[i].state==1){ 
                	 ht = ht + "<div class='colo-lg-1 col-md-1 col-sm-1 col-xs-1'><button class='btn btn-danger btn-xs' data-toggle='modal' >Already Reserved</button></div>";
                 }else {ht = ht + "<div class='colo-lg-1 col-md-1 col-sm-1 col-xs-1'><button class='btn btn-success btn-xs' data-toggle='modal' >Can be lent</button></div>";}
                 ht = ht + "</div>";
             }
             $("#searchresult").html(ht);
         }, 
         error:function(json){        
             alert("Cannot find this book！");    
         }
     });  
}
</script>
	<script type="text/javascript">
$(document).ready(function(){
	//alert("成功!");
    search();
});
</script>

	<!-- Lendbook model-->
	<div role="tabpanel" class="tab-pane" id="lend">
		<div class="check-div form-inline" style="padding-left: 0px;">
			<div class="check-div form-inline">
				<div class="col-xs-3">
					<button class="btn btn-yellow btn-xs" data-toggle="modal"
						data-target="#lendbook">Information registration</button>
				</div>
				<div class="col-lg-2" style="text-align: right;">
					<label for="paixu">Field:&nbsp;</label> <select
						class=" form-control" name="sort" id="sort">
						<option value="title" selected="selected">title</option>
						<option value="author">author</option>
						<option value="category">category</option>
						<option value="ISBN">ISBN</option>
					</select>
				</div>
				<div class="col-xs-4">
					<input type="text" class="form-control input-sm"
						placeholder="Input Text To Search" name="searchContent"
						id="lendsearchContent">
					<button type="button" id="search" onclick="search()"
						class="btn btn-white btn-xs ">search</button>
				</div>



			</div>
			<div class="data-div">
				<div class="row tableHeader">
					<!--Adjust col-lg-the number here can change the width-->
					<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">BookNo</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Title</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Author</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Category</div>
					<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">State</div>
				</div>
				<div class="tablebody" style="margin: 0;">
					<div>
						<!--The numbers here can vary in width, corresponding to the above.-->
						<div class="tablebody" id="searchresult"></div>

					</div>
				</div>
			</div>

			<!--Page码块-->
			<footer class="footer" id="lendBookPageFooter"
				name="lendBookPageFooter">
				<ul class="pagination">
					<li><select id="lendBookPageSelect" name="lendBookPageSelect"
						onchange="showLend(this.options[this.options.selectedIndex].value)">
					</select> Page</li>
					<li class="gray" id="lendBookTotalPageLi"
						name="lendBookTotalPageLi"></li>
					<li><i class="glyphicon glyphicon-menu-left"
						id="lendBookPageDown" name="lendBookPageDown"
						onclick=lendBookPageDown()> </i></li>
					<li><i class="glyphicon glyphicon-menu-right"
						id="lendBookPageUp" name="lendBookPageUp" onclick=lendBookPageUp()>
					</i></li>
				</ul>
			</footer>


			<!--Pop-up window information registration-->
			<div class="modal fade" id="lendbook" role="dialog"
				aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="gridSystemModalLabel">Information
								registration</h4>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<form class="form-horizontal" action="LendBookServlet">
									<table>
										<tr>
											<td>bookNo:</td>
											<td><input type="text" class="mytxt" id="bookno"
												name="bookno" placeholder=""></td>
										</tr>

										<tr>
											<td>readerNo:</td>
											<td><input type="text" class="mytxt" id="readerno"
												name="readerno" placeholder=""></td>
										</tr>


									</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-xs btn-xs btn-white"
								data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-xs btn-xs btn-green">Submit</button>
							<!-- After clicking save data to save to the database, to be implemented-->
						</div>
						</form>
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