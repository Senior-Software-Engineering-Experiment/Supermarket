//设置为默认值
function defaultSecurityDesposit(){
	document.getElementById('securityDesposit').value="300";
}

function defaultReturnPeriod(){
	document.getElementById('returnPeriod').value="30";
}

function defaultBookFine(){
	document.getElementById('bookFine').value="1";
}

//保存修改内容判定
function fineCheck(){
   
    if (checkSD()&& checkRP() &&checkBF()) {
    	return true;
	} 
    else { 
        return false;
    }
}

function complete(){
	 alert("Save successfully!!!");
 }

function checkSD(){
	var sd =document.getElementById("sd");
	sd.innerHTML="";
	var securitydesposit = document.fineEdit.securityDesposit.value;
	if (securitydesposit == "") { 
        sd.innerHTML = "Security deposit can not be null！"; 
        document.fineEdit.securityDesposit.focus(); 
        return false; 
	}
	return true;
}
function checkRP(){
	var rp =document.getElementById("rp");
	rp.innerHTML="";
	var returnperiod=document.fineEdit.returnPeriod.value;
	if (returnperiod == "") { 
        rp.innerHTML = "Return period can not be null！"; 
        document.fineEdit.returnPeriod.focus(); 
        return false; 
	}
	return true;
}
function checkBF(){
	var bf =document.getElementById("bf");
	bf.innerHTML="";
	var bookfine=document.fineEdit.bookFine.value;
	if (bookfine == "") { 
        bf.innerHTML = "Book fine can not be null！"; 
        document.fineEdit.bookFine.focus(); 
        return false; 
	}
	return true;
}
// JavaScript Document