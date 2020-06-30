<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公告管理</title>
</head>
<body>

<script type="text/javascript">
$(document).ready(function(){
	//alert("success!");
    postsearch();
});
</script>
<script type="text/javascript">
function postsearch(){
	//alert(1);
	 $.ajax({
         type:"POST", //请求方式  
         url:"DisplayNoticesServlet", //请求路径  
         cache: false,     
         data:{//传参  
        	 "content":$("#postcontent").val(),
             "sort":$("#postsort").val(),    
         },
         dataType: "json",   //返回值类型  
         success:function(json){
        	 var ht="";
        	 for (var i = 0; i < json.length; i++) {
                 if (json[i].postno == undefined) {
                     json[i].postno = '';
                 }
                 if (json[i].title == undefined) {
                	 json[i].title = '';
                 }
                 if (json[i].posttime== undefined) {
                	 json[i].posttime = '';
                 }
                 if (json[i].content == undefined) {
                	 json[i].content = '';
                 }
                 if (json[i].librarian == undefined) {
                	 json[i].librarian = '';
                 }
                 ht = ht + "<div class='row'>";
                 ht = ht + "<div class='col-lg-1 col-md-1 col-sm-1 col-xs-1' style='height: 50px; overflow:hidden'>" + json[i].postno + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].posterNo + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].title + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].posttime + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].content + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style='height: 50px; overflow:hidden'>" + json[i].librarianno + "</div>";
                 ht = ht + "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'><button class='btn btn-success btn-xs' data-toggle='modal' data-target='#changeNotice' onclick='toEditPost( "+json[i].postno+" ) '>Edit</button><button onclick='toDeletePost( "+ json[i].postno+ " )' class='btn btn-danger btn-xs' data-toggle='modal' data-target='#deleteNotice'>删除</button></div>";
                 ht = ht + "</div>";
             }
             $("#postbody").html(ht);
             
         }, 
         error:function(json){        
             alert("错误!");    //弹出返回过来的List对象  
                 //弹出返回过来的List对象
         }
     });  
}
</script>


	<div role="tabpanel" class="tab-pane" id="notice">
					<div class="check-div form-inline">
						<div class="col-xs-3">
							<button class="btn btn-yellow btn-xs" data-toggle="modal"
								data-target="#addNotice">发布公告</button>
						</div>
						<div class="col-xs-4">
							<!--此处搜索没有可删除-->
							<input type="text" class="form-control input-sm"
								placeholder="请输入..." id="postcontent">
							<button class="btn btn-white btn-xs " onclick="postsearch()">搜索</button>
						</div>
						<div class="col-lg-3 col-lg-offset-2 col-xs-4"
							style="padding-right: 40px; text-align: right;">
							<label for="paixu">排序:&nbsp;</label> <select
								class=" form-control" name="sort" id="postsort">
								<option>公告序号</option>
								<option>发布时间</option>
								<option>最近发布</option>
							</select>
						</div>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<!--调整col-lg- 这里的数字可以实现宽度的变化-->
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">序号</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">发布人</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">标题</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">时间</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">内容</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">售货员</div>
						</div>
						<div class="tablebody" id="postbody">
							<div class="row">
								<!--这里的数字可以实现宽度的变化，与上面相对应-->
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">1</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Post 1</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									2020-6-30</div>
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">内容</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#changeNotice">编辑</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteNotice">删除</button>
								</div>
							</div>
						</div>
					</div>
					
					<!--弹出窗口 添加公告-->
					<div class="modal fade" id="addNotice" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">发布公告</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">姓名：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="nName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">内容：</label>
												<div class="col-xs-4 ">
													<textarea class="form-control input-sm duiqi"
														name="nContent" id="nContent" clos=",50" rows="5"
														warp="virtual"></textarea>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-xs btn-white"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-xs btn-xs btn-green" data-dismiss="modal" data-target='#notice' onclick="addNotice()">保存</button>
									<!-- 点击保存后数据要保存到数据库中，待实现-->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--修改公告信息弹出窗口-->
					<!--如果不需要修改可以删除-->
					<div class="modal fade" id="changeNotice" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">编辑公告</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">姓名：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="eName" placeholder="" ></input>
													<!--使用EL语言实现输入框有默认值-->
												</div>
												<input id="editPostNo" name="editPostNo" type="hidden"
								value="">
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">内容：</label>
												<div class="col-xs-4 ">
													<textarea class="form-control input-sm duiqi"
														name="eContent" id="eContent" clos=",50" rows="5"
														warp="virtual">nContent</textarea>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-xs btn-green" data-dismiss="modal" data-target='#notice' onclick="editNotice()">保存</button>
									<!-- 点击保存后数据要保存到数据库中，待实现，与添加数据一样-->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					<!--弹出删除资源警告窗口-->
					<div class="modal fade" id="deleteNotice" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">Mention</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">Are you sure to delete?</div>
								</div>
								<input id="deletePostNo" name="deletePostNo" type="hidden"
								value="">
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal" id="cancel">Cancel</button>
									<button type="button" class="btn btn-xs btn-danger" onclick="deletepost()" data-dismiss="modal" data-target='#notice'>Save
										</button>
									<!--确定删除后结果存入数据库-->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>
				
<script>
		function toDeletePost(thisPostNo) {
			$("#deletePostNo").val(thisPostNo);
		}
</script>
<script type="text/javascript">
	function toEditPost(thisPostNo){
		//alert(thisPostNo);
		$("#editPostNo").val(thisPostNo);
		$.ajax({
			type : "POST",
			async : false,
			cache : false,
			url : "DisplayGivenNoticesServlet",
			dataType: "JSON",
			data : {"editPostNo" : thisPostNo,
				    
			},
			traditional : true,
			success : function(json) {
				//alert(json[0].title);
				//var data=eval('('+json+')');
				//alert(data);
				var title=json[0].title;
				var content = json[0].content;
				$("#eName").val(title);
				$("#eContent").val(content);
			},
			error : function(json) {
				//alert("(edit)connect failed!");
				alert(json);
			}
		});
	}
</script>
<script type="text/javascript">
	function editNotice(){
		var postNo = document.getElementById("editPostNo").value;
		$.ajax({
			type : "POST",
			async : false,
			cache : false,
			url : "EditNoticesServlet",
			data : {"editPostNo" : postNo,
				    "title" : $("#eName").val(),
				    "content" : $("#eContent").val(),
			},
			traditional : true,
			success : function(data) {
				alert("edit the post successfully!");
				postsearch();
			},
			error : function() {
				alert("connect failed!");
			}
		});
	}
</script>
<script>

		function deletepost() {
			var postNo = document.getElementById("deletePostNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
				url : "DeletePostServlet",
				data : {"deletePostNo" : postNo},
				traditional : true,
				success : function(data) {
					alert("delete the post successfully!");
					postsearch();
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
	function addNotice(){
		$.ajax({
			type : "post",
			cache : false,
			url : "AddNoticesServlet",
			data : {
				"nname" : $("#nName").val(),
				"ncontent" : $("#nContent").val(),
			},
			traditional : true,
			success : function(data){
				alert("add the notice successfully!");
				postsearch();
			},
			error : function(){
				alert("connect failed!");
			}
		});
	}
	</script>
</body>
</html>