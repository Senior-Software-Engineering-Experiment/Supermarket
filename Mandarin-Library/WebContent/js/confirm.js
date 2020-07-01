
  function disp_confirm() {
	var r = confirm("Sure to exit？");
	if (r == true) {
			document.forms["tuichuForm"].submit();
			alert("Exit successfully");
	  }
  }
  
  
  function cancel(){
	  document.getElementById('displayLibrarian').style.display = 'block';
	  document.getElementById('searchResult').style.display = 'none';
  }
  
  
  function search(){
	  var searchContent=document.getElementById("searchBlank").value;
	  var searchType=document.getElementById("type").value;
	  
	  if(searchContent.length==0){
		  alert("Please enter the key word!");
		  return;
	  }else{
		  //document.getElementById('searchResult').style.display = 'block';
		  //document.getElementById('displayLibrarian').style.display = 'none';
	  }
	  
	  $.ajax({
		  type:"POSt",
		  dataType:"json",
		  url:"LibrarianSearchServlet",
		  data:{"type":searchType,"searchContent":searchContent},
		  success:function(data,textStatus){
			  var objs=eval(data);
			  var obj=objs[0];
			  
			  var list = $("#displayLibrarian");
			  //var button = $("#add");
			  list.empty();
			  //$("displayLibrarian").empty;
			  var select=$("#librarianPageSelect");
			  select.empty();
			  if(obj==""){
				  list.append('No data!')
					return false;
				}
			  
			  var librarians =obj.librarianList;
			  var len = librarians.length;
			  var num =7;
			  var options=0;
			  if(len/num != 0){
				  options = (len/num)+1;
			  }else{
				  options =len/num;
			  }
			  select.append('<option value="1">1</option>');
			  list.append(' <input type="image" src="images/return1.jpg" class="return"  style="border-style:none;  width:25px; height:25px; margin-right:30px;background-repeat:no-repeat;" onclick=window.location.reload()>');
				  for(var i=0;i<num;i++){
    					var username = librarians[i].lUserName;
    					var name = librarians[i].lName;
    					var sex = librarians[i].lSex;
    					var email = librarians[i].lEmail;
    					var tel = librarians[i].lTel;					
    					
    					list.append('<div class="row" id="d'+i+'"><div class="col-xs-2 " id="dlUserName">'+ username+'</div><div class="col-xs-2" id="dlName">'+name+'</div><div class="col-xs-2" id="dlSex">'+sex+'</div><div class="col-xs-2" id="dlTel">'+tel+'</div><div class="col-xs-2" id="dlEmail">'+email+'</div><div class="col-xs-2" onblur="getdiv(this.id)"><button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" id="b'+i+'" onclick="wdnmd(this.id)">Edit</button><button class="btn btn-danger btn-xs" id="de'+i+'" onclick="deleteL(\''+ username+'\',this.id)">Delete</button></div></div>');

    					 //list.append(' <input type="image" src="images/return.jpg" class="return"  style="border-style:none;  width:50px; height:40px; background-repeat:no-repeat;" onclick=window.location.reload()>');
    				}
				  //document.getElementById("count").value=i;
			  	
			  
			  for(var j=2;j<options ; j++){
				  select.append('<option value="'+j+'">'+j+'</option>');
			  }

			  list.append(' <input type="image" src="images/return1.jpg" class="return"  style="border-style:none;  width:25px; height:25px; margin-right:30px ;background-repeat:no-repeat;" onclick=window.location.reload()>');
			  //button.style.display="none";
		  }
	  
	  })
	  
	  
  }
  
  function deleteL(id,bid){	  
	  var flag = confirm("Sure to delete this librarian?It is unrecoverable!");
	  var divid=document.getElementById(bid).parentElement.parentElement.id;
		if (flag){
			//var divid=document.getElementById("d").value;
			$.ajax({
					url:"LibrarianDeleteServlet",
					type:"post",
					async:false,
					data:{"dUserName":id},
					dataType: 'json',
					success:function(data){
						//$("#"+divid).remove();
						//window.location.reload();
						 if(data!= "0" ) { 
							 $("#"+divid).remove();
								window.location.reload();
							alert("Delete successfully");
						 }	
					}
				})
		}

  }

  function wdnmd(bid){
  	  var divid=document.getElementById(bid).parentElement.parentElement.id;
  	  
  	  var a = document.getElementById(divid).children;
  	  username=a[0].innerText;
        name=a[1].innerText;
        sex=a[2].innerText;
        tel=a[3].innerText;
        email=a[4].innerText;
        
        //alert(a[0].id);
  	  
  	  document.getElementById("u").value=username;
  	  document.getElementById("n").value=name;
  	  document.getElementById("s").value=sex;
  	  document.getElementById("e").value=email;
  	  document.getElementById("t").value=tel;
  	  document.getElementById("divid").value=divid;
  	  
  	  document.getElementById("sName").value=name;
  	  document.getElementById("sSex").value=sex;
  	  document.getElementById("sEmial").value=email;
  	  document.getElementById("sTelep").value=tel;
  	  
  	  
  	  
    }
  
  
  function edit(){
	  var id=document.getElementById("u").value;	  
	  var sName=document.getElementById("sName").value;
	  var sSex=document.getElementById("sSex").value;
	  var sEmail=document.getElementById("sEmial").value;
	  var sTelep=document.getElementById("sTelep").value;
	  var divid=document.getElementById("divid").value;
	  var pattern1 = /^1[34578]\d{9}$/; 
	  var pattern2 = /^\w+@[a-z0-9]+\.[a-z]{2,4}$/;
	  
	  if(sName=="" || sSex=="" || sEmail=="" || sTelep==""){
		  alert("Content can not be null！");
		
	  }
	   else if( !(pattern1).test(sTelep) ){
		  alert("Please enter valid telephone！");
		 
	  }else if(	!(pattern2).test(sEmail) ){
		  alert("Please enter valid email！");
		  return;
      }
	  
	     else
	  {  
		  $.ajax({
			  type:'post',
			  dataType:'json',
			  url:"LibrarianUpdateServlet",
			  data:{"eid":id,"newName":sName,"newSex":sSex,"newEmail":sEmail,"newTelep":sTelep},
			  success:function(data){
				  var obj=eval(data);		  
				  var Librarian=obj.newL;
				  
				  //var dlUserName=$("#dlUserName");
				  //dlUserName.empty();
				  //$("#"+divid).empty();  
				  //var dlName=$("#dlName");
				  //dlName.empty();
				  //var dlSex=$("#dlSex");
				  //dlSex.empty();
				  //var dlTel=$("#dlTel");
				  //dlTel.empty();
				  //var dlEmail=$("#dlEmail");
				  //dlEmail.empty();
				  
				  var list = $("#"+divid);
				  
			      var a = document.getElementById(divid).children;
			      a[0].innerHTML="";
			      a[1].innerHTML="";
			      a[2].innerHTML="";
			      a[3].innerHTML="";
			      a[4].innerHTML="";
				  
				  //dlUserName.append(Librarian.lUserName);
				  //dlName.append(Librarian.lName);
				  //dlSex.append(Librarian.lSex);
				  //dlTel.append(Librarian.lTel);
				  //dlEmail.append(Librarian.lEmail);
				  
				  var username = Librarian.lUserName;
				  var name = Librarian.lName;
				  var sex = Librarian.lSex;
				  var tel = Librarian.lTel;
				  var email = Librarian.lEmail;
				  
				  a[0].append(username);
				  a[1].append(name);
				  a[2].append(sex);
				  a[3].append(tel);
				  a[4].append(email);

				  if(data!= "0" ) { 
						alert("Edit successfully");
					 }
				  $('#closeEdit').trigger("click");

				  
			  }

		  })
	  
	  }
  }

  
  function complete(){
	  var securityDesposit=document.getElementById("securityDesposit").value;	  
	  var returnPeriod=document.getElementById("returnPeriod").value;
	  var bookFine=document.getElementById("bookFine").value;
	  
		  $.ajax({
			  type:'post',
			  dataType:'json',
			  url:"FineServlet",
			  data:{"SD":securityDesposit,"RP":returnPeriod,"BF":bookFine},
			  success:function(data){
				  var obj=eval(data);
				  				  
					 alert('Edit successfully!');
				  
			  }

		  })
	  
  }
  
  function turnToLib(type,searchContent,pageNum){
	  //alert("dff");
	  var start = (pageNum-1)*7;
	  var end = start+6;
	  if(searchContent==""){
		  $.ajax({
    		  type:"post",
    		  async:false,
    		  dataType:"json",
    		  url:"AdminServlet",
    		  data:{},
    		  success:function(data){
    			  var objs=eval(data);
    			  var obj2=objs[2];
    			  
    			  var list = $("#displayLibrarian");
    			  list.empty();
    			  
    			  var librarians=obj2.Librarians;
    			  
    				  for(var i=start;i<=end;i++){
        					var username = librarians[i].lUserName;
        					var name = librarians[i].lName;
        					var sex = librarians[i].lSex;
        					var email = librarians[i].lEmail;
        					var tel = librarians[i].lTel;					
        					
        					list.append('<div class="row" id="d'+i+'"><div class="col-xs-2 " id="dlUserName">'+ username+'</div><div class="col-xs-2" id="dlName">'+name+'</div><div class="col-xs-2" id="dlSex">'+sex+'</div><div class="col-xs-2" id="dlTel">'+tel+'</div><div class="col-xs-2" id="dlEmail">'+email+'</div><div class="col-xs-2" onblur="getdiv(this.id)"><button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" id="b'+i+'" onclick="wdnmd(this.id)">Edit</button><button class="btn btn-danger btn-xs" id="de'+i+'" onclick="deleteL(\''+ username+'\',this.id)">Delete</button></div></div>');

        				}
  			  	
    			      		 
    		}
    	});
	  }else{
		  $.ajax({
			  type:"POSt",
			  dataType:"json",
			  url:"LibrarianSearchServlet",
			  data:{"type":type,"searchContent":searchContent},
			  success:function(data,textStatus){
				  var objs=eval(data);
				  var obj=objs[0];
				  
				  var list = $("#displayLibrarian");
				  list.empty();
				  
				  var librarians =obj.librarianList;
				  for(var i=start;i<=end;i++){
						var username = librarians[i].lUserName;
						var name = librarians[i].lName;
						var sex = librarians[i].lSex;
						var email = librarians[i].lEmail;
						var tel = librarians[i].lTel;					
						
						list.append('<div class="row" id="d'+i+'"><div class="col-xs-2 " id="searchlUserName">'+ username+'</div><div class="col-xs-2" id="searchlName">'+name+'</div><div class="col-xs-2" id="searchlSex">'+sex+'</div><div class="col-xs-2" id="searchlTel">'+tel+'</div><div class="col-xs-2" id="searchlEmail">'+email+'</div><div class="col-xs-2"><button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" id="b'+i+'" onclick="wdnmd(this.id)">Edit</button><button class="btn btn-danger btn-xs" id="de'+i+'" onclick="deleteL('+ username+',this.id)">Delete</button></div></div>');

					}



			  }
		  
		  })
	  }
  }
  
  function turnToPage(pageNum){
	  	var type = document.getElementById("type").value;
		var searchContent = document.getElementById("searchBlank").value;
		turnToLib(type,searchContent,pageNum);
  }

