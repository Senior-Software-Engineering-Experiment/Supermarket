<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteRecord</title>
</head>
<body>

<script type="text/javascript">
function deletesearch(){
	
	 $.ajax({
         type:"POST", //请求方式  
         url:"DisplayDeleteServlet", //请求路径  
         cache: false,     
         data:{//传参  
 
         },
         dataType: "json",   //返回值类型  
         success:function(json){
        	 var ht="";
        	 for (var i = 0; i < json.length; i++) {
                 if (json[i].bookNo == undefined) {
                     json[i].bookNo = '';
                 }
                 if (json[i].librarianUsername == undefined) {
                	 json[i].librarianUsername = '';
                 }
                 if (json[i].deleteTime== undefined) {
                	 json[i].deleteTime = '';
                 }
                 if (json[i].title== undefined) {
                	 json[i].title = '';
                 }
                 if (json[i].author== undefined) {
                	 json[i].author = '';
                 }
                 ht = ht + "<div class='row'>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].bookNo + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].title + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].author + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].librarianUsername + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].deleteTime + "</div>";
               
                 ht = ht + "</div>";
             }
             $("#deletebody").html(ht);
             
         }, 
         error:function(json){        
             alert("error!");    //弹出返回过来的List对象  
                 //弹出返回过来的List对象
         }
     });  
}
</script>

	<!--书籍删除记录模块-->
				<div role="tabpanel" class="tab-pane" id="DeleteRecord">
					<div class="check-div form-inline">
						<span href="#book" aria-controls="book" role="tab"
							data-toggle="tab" style="cursor: pointer;"><span
							class="glyphicon glyphicon glyphicon-chevron-left"></span>Back</span>

					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 " style="width:230px">BookNo</div>
								<div class="col-xs-2 " style="width:200px">Author</div>
								<div class="col-xs-2 " style="width:200px">Title</div>
								<div class="col-xs-2" style="width:230px">Librarian</div>
								<div class="col-xs-2" style="width:230px">Date</div>
                                
						</div>
						<div class="tablebody" id="deletebody">
						</div>

					</div>
					
					<!-- /.modal -->

				</div>
</body>
</html>