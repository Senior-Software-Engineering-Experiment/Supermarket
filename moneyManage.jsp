<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#container {
	min-width: 310px;
	max-width: 400px;
	height: 400px;
	margin: 0 auto
}
</style>
<style type="text/css">
table.gridtable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}

table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}

table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>

<script src="js/JSPage.js" type="text/javascript"></script>
	
<script type="text/javascript">
function todayincome(){
	//alert(1);
	 $.ajax({
         type:"POST", //请求方式  
         url:"TodayIncomeServlet", //请求路径  
         cache: false,     
         data:{//传参  
                
         },
         dataType: "json",   //返回值类型  
         success:function(json){
        	 var income="交易次数:"+json[0].fine+" 次"+"<br>营业总额:"+json[0].deposit+" ￥";
             $("#todayincome").html(income);
         }, 
         error:function(data){        
             alert(data);
                 
         }
     });  
}
</script>

<script>
function yearincome(){
	 $.ajax({
         type:"POST",
         url:"IncomeHistoryServlet",
         cache : false,
         async : false,
         traditional : true,
         data:{"year":$("#year").val()},
         contentType: "application/x-www-form-urlencoded",   //返回值类型  
         success:function(data){
        	 var json = eval('(' + data + ')');
        	 var trans1=""; var trans2=""; var trans3="";
        	 var income=""; var incomestr="";
        	 var fine="";  var finestr="";
        	 var deposit=""; var depositstr="";
        	 var str1=""; var str2=""; var str3="";
        	 var table="<table class='gridtable' id='divtable'><tr><th>年</th><th>月</th><th>总收入（￥）</th><th>交易次数（次）</th><th>营业总额（￥）</th></tr><tbody id='group_one'>";
        	 for(var i in json){
        		 incomestr = json[i].income ;
        		 finestr = json[i].fine;
        		 depositstr = json[i].deposit;
        		 table=table+"<tr><td>"+$("#year").val()+"</td><td>"+json[i].month+"</td><td>"+incomestr+"</td><td>"+finestr+"</td><td>"+depositstr+"</td></tr>";
        		 if(i < json.length - 1){
        			 incomestr = incomestr + ",";
        			 finestr = finestr + ",";
        			 depositstr = depositstr + ",";
        		 }
        		 str1 = str1 + incomestr;
        		 str2 = str2 + finestr;
        		 str3 = str3 + depositstr;
        	 }
        	 trans1="["+str1+"]";
        	 trans2="["+str2+"]";
        	 trans3="["+str3+"]";
        	 table=table+"</tbody></table>"
        	// alert(trans);
        	 var income=JSON.parse(trans1);
        	 var fine=JSON.parse(trans2);
        	 var deposit=JSON.parse(trans3);
        	 //alert(income);
        	        $("#container").highcharts({
        	                			  "xAxis": [
        	                			    {
        	                			      "type": "category",
        	                			      "categories": [
        	                			        "一月",
        	                			        "二月",
        	                			        "三月",
        	                			        "四月",
        	                			        "五月",
        	                			        "六月",
        	                			        "七月 ",
        	                			        "八月",
        	                			        "九月",
        	                			        "十月",
        	                			        "十一月",
        	                			        "十二月"
        	                			      ],
        	                			      "index": 0,
        	                			      "isX": true
        	                			    }
        	                			  ],
        	                			  "series": [
        	                			    {
        	                			      "name": "总收入（￥）",
        	                			      "data": income ,
        	                			      "_colorIndex": 0,
        	                			      "_symbolIndex": 0
        	                			    },
        	                			    {
          	                			      "name": "交易次数（次）",
          	                			      "data": fine ,
          	                			      "_colorIndex": 1,
          	                			      "_symbolIndex": 1
          	                			    },
          	                			  {
            	                			      "name": "营业总额（￥）",
            	                			      "data": deposit ,
            	                			      "_colorIndex": 2,
            	                			      "_symbolIndex": 2
            	                			    },
        	                			  ],
        	                			  "yAxis": [
        	                			    {
        	                			      "title": {
        	                			        "text": "数目"
        	                			      },
        	                			      "index": 0
        	                			    }
        	                			  ],
        	                			  "chart": {
        	                			    "style": {
        	                			      "fontFamily": "\"微软雅黑\", Arial, Helvetica, sans-serif",
        	                			      "color": "#333",
        	                			      "fontSize": "12px",
        	                			      "fontWeight": "normal",
        	                			      "fontStyle": "normal"
        	                			    }
        	                			  },
        	                			  "title": {
        	                			    "text": "超市收入——— "+$("#year").val(),
        	                			    "x": -20
        	                			  },
        	                			  "subtitle": {
        	                			    "text": "",
        	                			    "x": -20
        	                			  },
        	                			  "tooltip": {
        	                			    "valueSuffix": ""
        	                			  },
        	                			  "legend": {
        	                			    "layout": "vertical",
        	                			    "align": "right",
        	                			    "verticalAlign": "middle"
        	                			  }
        	        });
        	        $("#showtable").html(table);
         }, 
         error:function(){        
             alert(2);   
         }
     }); 
}
</script>

<script type="text/javascript">
function monthincome(){
	//alert(1);
	 $.ajax({
         type:"POST", //请求方式  
         url:"MonthDayServlet", //请求路径  
         cache: false,     
         data:{//传参  
             "myear":$("#myear").val(),
             "month":$("#month").val(),
         },
         contentType: "application/x-www-form-urlencoded",   //返回值类型  
         success:function(data){
        	 var json = eval('(' + data + ')');
        	 var trans1=""; var trans2=""; var trans3=""; var trans4=""
        	 var income=""; var incomestr="";
        	 var fine="";  var finestr="";
        	 var deposit=""; var depositstr="";
        	 var day=""; var daystr="";
        	 var str1=""; var str2=""; var str3=""; var str4="";
        	 var table="<table class='gridtable' id='divtable'><tr><th>日期</th><th>总收入(￥)</th><th>交易次数(次)</th><th>营业总额(￥)</th></tr><tbody id='group_one'>";
        	 for(var i = 0; i < json.length; i++){
        		 incomestr = json[i].income ;
        		 finestr = json[i].fine;
        		 depositstr = json[i].deposit;
        		 daystr=json[i].day;
        		 table=table+"<tr><td>"+json[i].month+"-"+json[i].day+"</td><td>"+incomestr+"</td><td>"+finestr+"</td><td>"+depositstr+"</td></tr>";
        		 if(i < json.length - 1){
        			 incomestr = incomestr + ",";
        			 finestr = finestr + ",";
        			 depositstr = depositstr + ",";
        			 daystr = daystr + ",";
        		 }
        		 str1 = str1 + incomestr;
        		 str2 = str2 + finestr;
        		 str3 = str3 + depositstr;
        		 str4 = str4 + daystr;
        	 }
        	 trans1="["+str1+"]";
        	 trans2="["+str2+"]";
        	 trans3="["+str3+"]";
        	 trans4="["+str4+"]";
        	 table=table+"</tbody></table>"
        	 //alert(trans);
        	 var income=JSON.parse(trans1);
        	 var fine=JSON.parse(trans2);
        	 var deposit=JSON.parse(trans3);
        	 var day=JSON.parse(trans4);
        	 //alert(income);
        	        $('#container')
        	                .highcharts(
        	                		{
        	                			  "xAxis": [
        	                			    {
        	                			      "type": "category",
        	                			      "categories": day ,
        	                			      "index": 0,
        	                			      "isX": true,
        	                			      "title": {
        	                			          "text": "日期 "
        	                			        }
        	                			    }
        	                			  ],
        	                			  "series": [
        	                			    {
        	                			      "name": "总收入（￥）",
        	                			      "data": income ,
        	                			      "_colorIndex": 0,
        	                			      "_symbolIndex": 0
        	                			    },
        	                			    {
            	                			      "name": "交易次数（次）",
            	                			      "data": fine ,
            	                			      "_colorIndex": 1,
            	                			      "_symbolIndex": 1
            	                			    },
            	                			  {
              	                			      "name": "营业总额（￥）",
              	                			      "data": deposit ,
              	                			      "_colorIndex": 2,
              	                			      "_symbolIndex": 2
              	                			    },
        	                			  ],
        	                			  "yAxis": [
        	                			    {
        	                			      "title": {
        	                			        "text": "数目"
        	                			      },
        	                			      "index": 0
        	                			    }
        	                			  ],
        	                			  "chart": {
        	                			    "style": {
        	                			      "fontFamily": "\"微软雅黑\", Arial, Helvetica, sans-serif",
        	                			      "color": "#333",
        	                			      "fontSize": "12px",
        	                			      "fontWeight": "normal",
        	                			      "fontStyle": "normal"
        	                			    }
        	                			  },
        	                			  "title": {
        	                			    "text": "每日收入——— "+$("#myear").val()+"."+$("#month").val(),
        	                			    "x": -20
        	                			  },
        	                			  "subtitle": {
        	                			    "text": "",
        	                			    "x": -20
        	                			  },
        	                			  "tooltip": {
        	                			    "valueSuffix": ""
        	                			  },
        	                			  "legend": {
        	                			    "layout": "vertical",
        	                			    "align": "right",
        	                			    "verticalAlign": "middle"
        	                			  }
        	                			});
        	        $("#showtable").html(table);
       	         $(document).ready(function() {
       	               page = new Page(11, 'divtable', 'group_one', "pageindex");
       	         });
         }, 
         error:function(json){        
             alert(2);
                 
         }
     });  
}
</script>
<script type="text/javascript">
function weakincome(){
	//alert(1);
	 $.ajax({
         type:"POST", //请求方式  
         url:"WeekIncomeServlet", //请求路径  
         cache: false,     
         data:{//传参  
             "wyear":$("#wyear").val(),    
         },
         contentType: "application/x-www-form-urlencoded",   //返回值类型  
         success:function(data){
        	 var json = eval('(' + data + ')');
        	 var trans1=""; var trans2=""; var trans3=""; var trans4="";
        	 var income=""; var incomestr=""; 
        	 var fine="";  var finestr=""; 
        	 var week=""; var weekstr="";
        	 var deposit=""; var depositstr="";
        	 var str1=""; var str2=""; var str3=""; var str4="";
        	 var table="<table class='gridtable' id='divtable'><tr><th>年</th><th>周数</th><th>总收入(￥)</th><th>交易次数(次)</th><th>营业总额(￥)</th></tr><tbody id='group_one'>";
        	 for(var i = 0; i < json.length; i++){
        		 incomestr = json[i].income ;
        		 finestr = json[i].fine;
        		 depositstr = json[i].deposit;
        		 weekstr=json[i].week;
        		 table=table+"<tr><td>"+$("#wyear").val()+"</td><td>"+weekstr+"</td><td>"+incomestr+"</td><td>"+finestr+"</td><td>"+depositstr+"</td></tr>";
        		 if(i < json.length - 1){
        			 incomestr = incomestr + ",";
        			 finestr = finestr + ",";
        			 depositstr = depositstr + ",";
        			 weekstr = weekstr + ",";
        		 }
        		 str1 = str1 + incomestr;
        		 str2 = str2 + finestr;
        		 str3 = str3 + depositstr;
        		 str4 = str4 + weekstr;
        	 }
        	 trans1="["+str1+"]";
        	 trans2="["+str2+"]";
        	 trans3="["+str3+"]";
        	 trans4="["+str4+"]";
        	 table=table+"</tbody></table>"
        	 //alert(trans);
        	 var income=JSON.parse(trans1);
        	 var fine=JSON.parse(trans2);
        	 var deposit=JSON.parse(trans3);
        	 var week=JSON.parse(trans4);
        	 //alert(income);
        	        $('#container').highcharts(
        	                		{
        	                			  "xAxis": [
        	                			    {
        	                			      "type": "category",
        	                			      "categories":week ,
        	                			      "index": 0,
        	                			      "isX": true,
        	                			      "title": {
        	                			          "text": "周数"
        	                			        }
        	                			    }
        	                			  ],
        	                			  "series": [
        	                			    {
        	                			      "name": "总收入（￥）",
        	                			      "data": income ,
        	                			      "_colorIndex": 0,
        	                			      "_symbolIndex": 0
        	                			    },
        	                			    {
          	                			      "name": "交易次数（次）",
          	                			      "data": fine ,
          	                			      "_colorIndex": 1,
          	                			      "_symbolIndex": 1
          	                			    },
          	                			  {
            	                			      "name": "营业总额（￥）",
            	                			      "data": deposit ,
            	                			      "_colorIndex": 2,
            	                			      "_symbolIndex": 2
            	                			    },
        	                			  ],
        	                			  "yAxis": [
        	                			    {
        	                			      "title": {
        	                			        "text": "数目"
        	                			      },
        	                			      "index": 0
        	                			    }
        	                			  ],
        	                			  "chart": {
        	                			    "style": {
        	                			      "fontFamily": "\"微软雅黑\", Arial, Helvetica, sans-serif",
        	                			      "color": "#333",
        	                			      "fontSize": "12px",
        	                			      "fontWeight": "normal",
        	                			      "fontStyle": "normal"
        	                			    }
        	                			  },
        	                			  "title": {
        	                			    "text": "周收入——— "+$("#wyear").val(),
        	                			    "x": -20
        	                			  },
        	                			  "subtitle": {
        	                			    "text": "",
        	                			    "x": -20
        	                			  },
        	                			  "tooltip": {
        	                			    "valueSuffix": ""
        	                			  },
        	                			  "legend": {
        	                			    "layout": "vertical",
        	                			    "align": "right",
        	                			    "verticalAlign": "middle"
        	                			  }
        	                			});
        	        $("#showtable").html(table);
        	        $(document).ready(function() {
     	               page = new Page(11, 'divtable', 'group_one', "pageindex");
     	         });
         }, 
         error:function(json){        
             alert(2);
         }
     });  
}
</script>

<script>
	$(function() {
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");
			;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
		$("#topAD").click(function() {
			$("#topA").toggleClass(" glyphicon-triangle-right");
			$("#topA").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topBD").click(function() {
			$("#topB").toggleClass(" glyphicon-triangle-right");
			$("#topB").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topCD").click(function() {
			$("#topC").toggleClass(" glyphicon-triangle-right");
			$("#topC").toggleClass(" glyphicon-triangle-bottom");
		});
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		})
	})
</script>

	<!-- 资金管理模块 -->
	<div role="tabpanel" class="tab-pane" id="money">
		<div class="col-md-12" style="background: initial; padding-left:30px">
			<div class="box solid grey">
				<div class="box-title">
					<h4>
						<font color=black>每日收入</font>

					</h4>
				</div>
				<div>
					<button onclick="todayincome()" style="background-color: #5a9ce0;border: none;color: white;padding: 10px 32px;text-align: center;
    						text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;border-radius: 12px;">今日收入</button>
				</div>
				<div class="" id="todayincome"
					style="float: left; color: black; font-size: 30px"></div>
				<br>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-2">
					<input type="text" class="form-control input-sm"
						placeholder="输入年份(如:2020)" name="year" id="year" style="height: 47px; padding: 10px 0px;font-size: 16px; margin: 4px 2px;border-radius: 12px;">
				</div>
				<div>
					<button onclick="yearincome()" style="background-color: #5a9ce0;border: none;color: white;padding: 10px 32px;text-align: center;
    						text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;border-radius: 12px;">年度报表及统计图（年）</button>
				</div>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-2">
					<input type="text" class="form-control input-sm"
						placeholder="输入年份(如:2020)" name="wyear" id="wyear" style="height: 47px; padding: 10px 0px;font-size: 16px; margin: 4px 2px;border-radius: 12px;">
				</div>
				<div>
					<button onclick="weakincome()" style="background-color: #5a9ce0;border: none;color: white;padding: 10px 32px;text-align: center;
    						text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;border-radius: 12px;">年度报表及统计图（月）</button>
				</div>
				<div class="col-xs-12"></div>
				<br>
				<div class="col-xs-2">
					<input type="text" class="form-control input-sm"
						placeholder="输入年份(如:2020)" name="myear" id="myear" style="height: 47px; padding: 10px 0px;font-size: 16px; margin: 4px 2px;border-radius: 12px;">
				</div>
				
				<div class="col-xs-2">
					<input type="text" class="form-control input-sm"
						placeholder="输入月份(如:10)" name="month" id="month" style="height: 47px; padding: 10px 0px;font-size: 16px; margin: 4px 2px;border-radius: 12px;">
				</div>
				<div>
					<button onclick="monthincome()" style="background-color: #5a9ce0;border: none;color: white;padding: 10px 32px;text-align: center;
    						text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;border-radius: 12px;">每日报表及统计图</button>
				</div>
				<div class="col-xs-12"></div>
				<div class="col-xs-12"></div>
				
				<div id="container" name="container" 
					style="min-width: 900px; height: 500px; float: left;">
					<font size="4" color="red">鼠标悬停在折线图拐点处以查看具体数值</font>
				</div>
				<div id="showtable" style="position: relative;left: 70px;">
					<table id="divtable" class="gridtable">
						<tbody id="group_one">
							<tr>
								<th>年</th>
								<th>月</th>
								<th>总收入</th>
								<th>交易次数</th>
								<th>营业总额</th>
							</tr>
							<tr>
								<td>Text 1A</td>
								<td>Text 1B</td>
								<td>Text 1C</td>
								<td>Text 1D</td>
								<td>Text 1E</td>
							</tr>
							<tr>
								<td>Text 2A</td>
								<td>Text 2B</td>
								<td>Text 2C</td>
								<td>Text 1D</td>
								<td>Text 1E</td>
							</tr>
							<tr>
								<td>Text 2A</td>
								<td>Text 2B</td>
								<td>Text 2C</td>
								<td>Text 1D</td>
								<td>Text 1E</td>
							</tr>
							<tr>
								<td>Text 2A</td>
								<td>Text 2B</td>
								<td>Text 2C</td>
								<td>Text 1D</td>
								<td>Text 1E</td>
							</tr>
							<tr>
								<td>Text 2A</td>
								<td>Text 2B</td>
								<td>Text 2C</td>
								<td>Text 1D</td>
								<td>Text 1E</td>
							</tr>
						</tbody>
					</table>
				</div>
				<span id="s"></span>
				<div style="position: relative;left: 70px;display: none;">
				<button onclick="page.firstPage();" style="color: black">home
					page</button>

				<button onclick="page.prePage();" style="color: black">Previous
					page</button>

				<button onclick="page.nextPage();" style="color: black">next
					page</button>

				<button onclick="page.lastPage();" style="color: black">Tail
					page</button>
				</div>

				<span id="pageindex"></span>
				<br><br><br><br><br><br><br><br><br><br>
<script type="text/javascript">
         $(document).ready(function() {
               page = new Page(3, 'divtable', 'group_one', "pageindex");
         });
          
   </script>
			

			</div>
		</div>
	</div>