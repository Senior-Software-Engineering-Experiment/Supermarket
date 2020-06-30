  //密码验证

        function checkold(){
        	 var pass1 = document.getElementById('oldPassword');
             var errname1 = document.getElementById('div1');
             if (pass1.value.length == 0) {
             	errname1.innerHTML = "Null!"
 				return false;
         }
             else {
 				errname1.innerHTML = ""
 				return true;
 			}
    }
        function checkpassword(){
            var pass2 = document.getElementById('newPassword1');
            var errname2 = document.getElementById('div2');
            if (pass2.value.length == 0) {
            	errname2.innerHTML = "Null!"
				return false;
        }
            else {
				errname2.innerHTML = "";
				return true;
			}
    }

        function checkrepassword(){
        	var pass2 = document.getElementById('newPassword1');
            var pass3 = document.getElementById('newPassword2');
            var errname3 = document.getElementById('div3');
        
    	if (pass3.value.length == 0) {
    		errname3.innerHTML = "Null!"
			return false;
		} else if((pass2.value) != (pass3.value)){
			errname3.innerHTML = "Different!"
			return false;
		} else{
			errname3.innerHTML = ""
			return true;
		}
    	
       }
        
	function check(){ 
		var oldpass = checkold();
		var pass = checkpassword();
		var pass2 = checkrepassword();
        return  oldpass&&pass&&pass2; 
    } 
	
	function delete1(){ 
		var pass1 = document.getElementById('oldPassword');
    	var pass2 = document.getElementById('newPassword1');
        var pass3 = document.getElementById('newPassword2');	
        var err1 = document.getElementById('div1');
        var err2 = document.getElementById('div2');
        var err3 = document.getElementById('div3');
        pass1.value="";
        pass2.value="";
        pass3.value="";
        err1.innerHTML="*must be filled";
        err2.innerHTML="*must be filled";
        err3.innerHTML="*must be filled";
    } 
	
	function changeP(){
		checkold();
		checkpassword();
		checkrepassword();
        //return  oldpass&&pass&&pass2;
        
		var oldP = document.getElementById('oldPassword').value;
		var newP1 = document.getElementById('newPassword1').value;
		var newP2 = document.getElementById('newPassword2').value;
		
		$.ajax({
			url:"ChangePwdServlet",
			type:"post",
			async:false,
			data:{"oldP":oldP,"newP":newP1},
			dataType: 'json',
			success:function(data){
				var obj=eval(data);
				
				var result=obj.result;
				var tip1=$('#div1');
				var tip2=$('#div2');
				var tip3=$('#div3');
				tip1.empty();
				tip2.empty();
				tip3.empty();
				var p1=$('#oldPassword');
				var p2=$('#newPassword1');
				var p3=$('#newPassword2');
				
				if(result == false){
					tip1.append("Wrong!");
				}else{
					tip1.append("*must be filled");
					tip2.append("*must be filled");
					tip3.append("*must be filled");
					p1.val("");
					p2.val("");
					p3.val("");
					alert('Change your password successfully！');
				}
				
			}
		})
		
	}
	

	 $(function(){
	    	$("#sSex").find("option[value='${sSex}']").attr("selected",'selected');
	    })   
