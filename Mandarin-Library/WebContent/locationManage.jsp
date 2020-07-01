<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Location</title>
</head>
<body>
	<div role="tabpanel" class="tab-pane" id="location">
		<div class="check-div form-inline">
			<div class="col-xs-3">
				<button class="btn btn-yellow btn-xs" data-toggle="modal"
					data-target="#addLocation">ADD LOCATION</button>
			</div>

		</div>
		<div class="row tableHeader">

			<div class="col-xs-5">Location No:</div>
			<div class="col-xs-5">Location Name:</div>
			<div class="col-xs-2">Operation:</div>
		</div>
		<div class="tablebody" name="displayLocationDiv"
			id="displayLocationDiv"></div>

		<!--Page码块-->
		<footer class="footer" id="locationPageFooter"
			name="locationPageFooter">
			<ul class="pagination">
				<li><select id="locationPageSelect" name="locationPageSelect"
					onchange="turnToLocation(this.options[this.options.selectedIndex].value)">
				</select> Page</li>
				<li class="gray" id="locationTotalPageLi" name="locationTotalPageLi"></li>
				<li><i class="glyphicon glyphicon-menu-left"
					id="locationPageDown" name="locationPageDown"
					onclick="locationPageDown()"> </i></li>
				<li><i class="glyphicon glyphicon-menu-right"
					id="locationPageUp" name="locationPageUp"
					onclick="locationPageUp()"> </i></li>
			</ul>
		</footer>
	</div>


	<!--弹出添加地址窗口-->
	<div class="modal fade" id="addLocation" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Add Location</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form class="form-horizontal">
							<div class="form-group ">
								<label for="Floor" class="col-xs-3 control-label">Floor：</label>
								<div class="col-xs-8 ">
									<input type="text" class="form-control input-sm duiqi"
										id="Floor" name="Floor" placeholder="e.g.Floor 1" 
											oninvalid="setCustomValidity('Please fill in this field!')"
													oninput="setCustomValidity('')" required>
								</div>
							</div>
							<div class="form-group ">
								<label for="Shelf" class="col-xs-3 control-label">Shelf：</label>
								<div class="col-xs-8 ">
									<input type="text" class="form-control input-sm duiqi"
										id="Shelf" name="Shelf" placeholder="e.g.Shelf 1" 
											oninvalid="setCustomValidity('Please fill in this field!')"
													oninput="setCustomValidity('')" required>
								</div>
							</div>
							<div class="form-group ">
								<label for="Area" class="col-xs-3 control-label">Area：</label>
								<div class="col-xs-8 ">
									<input type="text" class="form-control input-sm duiqi"
										id="Area" name="Area" placeholder="e.g.Area 1" 
											oninvalid="setCustomValidity('Please fill in this field!')"
													oninput="setCustomValidity('')" required>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-xs btn-white"
									data-dismiss="modal">Cancel</button>
								<button type="button" class="btn btn-xs btn-green"
								onclick="addLocation()" data-dismiss="modal">Submit</button>
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

	<!--弹出修改地址窗口-->
	<div class="modal fade" id="reviseLocation" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Modify Location</h4>
				</div>
				<form class="form-horizontal" id="saveLocationInfoForm"
					name="saveLocationInfoForm" action="ChangeLocationInfoServlet">
					<div class="modal-body">
						<div class="container-fluid">

							<div class="form-group ">
								<label for="thisName" class="col-xs-3 control-label">Name：</label>
								<div class="col-xs-8 ">
									<input type="hidden" id="thisLocationNo" name="thisLocationNo"
										value=""> 
									<input type="text"
											class="form-control input-sm duiqi" id="thisLocationName"
												name="thisLocationName"
													placeholder="e.g.Floor 1-Shelf 2-Area 3" 
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
							onclick="saveLocationInfo()" data-dismiss="modal">Submit</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!--弹出删除地址警告窗口-->
	<form>
		<input id="deleteLocationNo" name="deleteLocationNo" type="hidden"
			value="">
		<div class="modal fade" id="deleteLocation" role="dialog"
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
						<div class="container-fluid">Are you sure you want to delete
							this location?</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white"
							data-dismiss="modal">Cancel</button>
						<button type="button" id="deleteLocation" name="deleteLocation"
							class="btn  btn-xs btn-danger" data-dismiss="modal" onclick="deleteThisLocation()">Delete</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</form>
	</div>
	<!-- 地址管理script-->

	<script type="text/javascript">
		function turnToThisLocation(locationNo){
			$.ajax({
				type:"POST",
				async:false,
				cache:false,
				contentType:"application/x-www-form-urlencoded",
				url:"/Mandarin-Library/TurnToThisLocationServlet",
				data:{"thisLocationNo":locationNo},
				traditional:true,
				success:function(data){
					var obj = eval('(' + data + ')');
					$("#thisLocationNo").val(obj.locationNo);			
					$("#thisLocationName").val(obj.locationName);
				},
				error:function(){
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
	function turnToLocation(pageNum) {
		$.ajax({
					type : "POST",
					async : false,
					cache : false,
					data : {"pageNum": pageNum},
					contentType : "application/x-www-form-urlencoded",
					url : "/Mandarin-Library/DisplayLocationServlet",
					traditional : true,
					success : function(data) {
						var objs = eval('(' + data + ')');
						$("#displayLocationDiv").empty();
						if(pageNum == 1){
							$("#locationPageSelect").empty();
							var totalPageNum = objs[0].totalPage;
							$("#locationTotalPageLi").text('Total ' + totalPageNum + ' Page');
							for(var i = 1; i <= objs[0].totalPage; i++){
								var optionBar = '<option value="'
								+ i
								+'">'
								+ i
								+ '</option>';
								$("#locationPageSelect").append(optionBar);
							}
						}
						for ( var num in objs) {
							var locationName = objs[num].locationName;
							var locationNo = objs[num].locationNo;
							var div = '<div class="row">'
									+ '<div class="col-xs-5">'
									+ locationNo
									+ '</div>'
									+ '<div class="col-xs-5">'
									+ locationName
									+ '</div>'
									+ '<button class="btn btn-success btn-xs" data-toggle="modal"'
									+ 'data-target="#reviseLocation"'
									+ 'onclick="turnToThisLocation('
									+ locationNo
									+ ')">Modify</button>'
									+ '<button class="btn btn-danger btn-xs" data-toggle="modal"'
									+ 'data-target="#deleteLocation"'
									+ 'onclick="toDeleteThisLocation('
									+ locationNo
									+ ')">Delete</button>'
									+ '</div>';
							$("#displayLocationDiv").append(div);
						}
					},
					error : function() {
						alert("connect failed!");
					}
				});
}
	</script>
	<script>
		function saveLocationInfo(){
			var locationName = document.getElementById("thisLocationName").value;
			var locationId = document.getElementById("thisLocationNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : true,
			    contentType : "application/x-www-form-urlencoded",
				url : "/Mandarin-Library/ChangeLocationInfoServlet",
				data : {"thisLocationName" : locationName, "thisLocationNo" : locationId},
				traditional : true,
				success : function(data) {
					alert("edit location successfully!");
				},
				error : function() {
					alert("connect failed!");
				}
			});
			turnToLocation(1);
		}
	</script>
	<script>
		function toDeleteThisLocation(thisLocationNo){
			$("#deleteLocationNo").val(thisLocationNo)
		}
	</script>
	<script>
		function deleteThisLocation(){
			var locationNo = document.getElementById("deleteLocationNo").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : false,
			    contentType : "application/x-www-form-urlencoded",
				url : "/Mandarin-Library/DeleteLocationServlet",
				data : {"deleteLocationNo" : locationNo},
				traditional : true,
				success : function(data) {
					alert("delete location successfully!");
					turnToLocation(1);
				},
				error : function() {
					alert("connect failed!");
				}
			});
		}
	</script>
	<script>
		function locationPageUp(){
			var options = $("#locationPageSelect option:selected");
			var page = options.val();
			var lastPage = $("#locationPageSelect > option:last").val();
			if(page != lastPage){
				$("#locationPageSelect")[0].selectedIndex = page;
				page++;
				turnToLocation(page);
			}
			else document.getElementById("locationPageUp").disabled = true;
		}
	</script>
	<script>
		function locationPageDown(){
			var options = $("#locationPageSelect option:selected");
			var page = options.val();
			if(page != 1){
				page--;
				turnToLocation(page);
				page--;
				$("#locationPageSelect")[0].selectedIndex = page;
			}
			else document.getElementById("locationPageDown").disabled = true;
		}
	</script>
	<script>
		function addLocation(){
			var floor = document.getElementById("Floor").value;
			var shelf = document.getElementById("Shelf").value;
			var area = document.getElementById("Area").value;
			$.ajax({
				type : "POST",
				async : false,
				cache : true,
			    contentType : "application/x-www-form-urlencoded",
				url : "/Mandarin-Library/AddLocationServlet",
				data : {"Floor" : floor, "Shelf" : shelf, "Area" : area},
				traditional : true,
				success : function(data) {
					alert("add location successfully!");
				},
				error : function() {
					alert("connect failed!");
				}
			});
			turnToLocation(1);
		}
	</script>
</body>
</html>