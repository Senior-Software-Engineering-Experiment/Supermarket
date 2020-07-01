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
<title>Return Book</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	//alert("success!");
    lendedsearch();
});
</script>
<script type="text/javascript">
function lendedsearch(){
	//alert(1);
	 $.ajax({
         type:"POST", //请求方式  
         url:"SearchLendedBookServlet", //请求路径  
         cache: false,     
         data:{//传参  
             "searchContent":$("#lendedsearchContent").val(),
             "sort":$("#lendedsort").val(),    
         },
         dataType: "json",   //返回值类型  
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
                 ht = ht + "<div class='row'>";
                 ht = ht + "<div class='colo-lg-2 col-md-3 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].title + "</div>";
                 ht = ht + "<div class='colo-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].bookNo + "</div>";
                 ht = ht + "<div class='colo-lg-2 col-md-3 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].author + "</div>";
                 ht = ht + "<div class='colo-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].category + "</div>";
                 ht = ht + "<div class='colo-lg-2 col-md-2 col-sm-2 col-xs-2'><button class='btn btn-success btn-xs' data-toggle='modal' data-target='#lendBook'>Already Lent</button></div>";
                 ht = ht + "</div>";
             }
             $("#lendedsearchresult").html(ht);
         }, 
         error:function(json){        
             alert("未找到指定书籍!");    //弹出返回过来的List对象  
                 //弹出返回过来的List对象
         }
     });  
}
</script>
<style>
.mytxt {
    color:#333;
    line-height:normal;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    font-style:normal;
    font-variant:normal;
    font-size-adjust:none;
    font-stretch:normal;
    font-weight:normal;
    margin-top:0px;
    margin-bottom:0px;
    margin-left:0px;
    padding-top:4px;
    padding-right:4px;
    padding-bottom:4px;
    padding-left:4px;
    font-size:15px;
    outline-width:medium;
    outline-style:none;
    outline-color:invert;
    border-top-left-radius:3px;
    border-top-right-radius:3px;
    border-bottom-left-radius:3px;
    border-bottom-right-radius:3px;
    text-shadow:0px 1px 2px #fff;
    background-attachment:scroll;
    background-repeat:repeat-x;
    background-position-x:left;
    background-position-y:top;
    background-size:auto;
    background-origin:padding-box;
    background-clip:border-box;
    background-color:rgb(255,255,255);
    margin-right:8px;
    border-top-color:#ccc;
    border-right-color:#ccc;
    border-bottom-color:#ccc;
    border-left-color:#ccc;
    border-top-width:1px;
    border-right-width:1px;
    border-bottom-width:1px;
    border-left-width:1px;
    border-top-style:solid;
    border-right-style:solid;
    border-bottom-style:solid;
    border-left-style:solid;
}

.mytxt:focus {
     border: 1px solid #fafafa;
    -webkit-box-shadow: 0px 0px 6px #007eff;
     -moz-box-shadow: 0px 0px 5px #007eff;
     box-shadow: 0px 0px 5px #007eff;   
    
}
</style>	
	<!-- Return book module -->
				<div role="tabpanel" class="tab-pane" id="return">
					<div class="check-div form-inline">
						<div class="col-xs-3">
							<button class="btn btn-yellow btn-xs" data-toggle="modal"
								data-target="#returnBook">Return books</button>
						</div>
						<div class="col-lg-2"
							style=" text-align: right;">
							<label for="paixu">field:&nbsp;</label> <select
								class=" form-control" name="sort" id="lendedsort">
								<option value="title" selected="selected">title</option>
								<option value="author">author</option>
								<option value="category">category</option>
								<option value="ISBN">ISBN</option>
							</select>
						</div>
						<div class="col-xs-4">
							<input type="text" class="form-control input-sm"
								placeholder="Input Text Search" name="searchContent"
								id="lendedsearchContent">
							<button type="button" id="search" onclick="lendedsearch()"
								class="btn btn-white btn-xs ">search</button>
						</div>
						
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<!--Adjust col-lg-the number here can change the width-->
							<div class="col-lg-3 col-md-2 col-sm-2 col-xs-4">bookTitle</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-4">bookNo</div>
							<div class="col-lg-3 col-md-4 col-sm-4 col-xs-4">author</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-4">category</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">state</div>
						</div>
						<div class="tablebody">
							<div>
								<!--The numbers here can vary in width, corresponding to the above-->
								<div class="tablebody" id="lendedsearchresult">
									<div>
										<!--The numbers here can vary in width, corresponding to the above-->

										<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${book.title}</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-4">${book.author}</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">${book.category}</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-4">${book.ISBN}</div>
										<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
											<button class="btn btn-success btn-xs" data-toggle="modal"
												data-target="#lendBook">Search display data</button>

										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!--Page block-->
					<footer class="footer">
						<ul class="pagination">
							<li><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
							</select> page</li>
							<li class="gray">A total of 1 Pages<!--Here you need to read the number of books from the database and calculate them.-->
							</li>
							<li><i class="glyphicon glyphicon-menu-left"> <!--Left, to be realized-->
							</i></li>
							<li><i class="glyphicon glyphicon-menu-right"> <!--Left, to be realized-->
							</i></li>
						</ul>
					</footer>

					<!--Return pop-up window-->
					<div class="modal fade" id="returnBook" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">ReturnBook</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal" action="ReturnBookServlet">
											<div class="form-group ">
												<div for="sName" class="col-xs-12">bookNo：
										
													<input type="text" class="mytxt"
														id="bookno" name="bookno" placeholder="" >
													<!--Using EL Language to Implement Input Box with Default Value-->
												</div>
											</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">cancel</button>
									<input type="submit" class="btn btn-xs btn-green" value="submit"></input>
								</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>

</body>
</html>