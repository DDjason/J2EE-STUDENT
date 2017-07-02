<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/Load.css" type="text/css"  />
<script src="../js/Ajax.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload=function() 
{ 
var zhezhao=document.getElementById("zhezhao"); 
var login=document.getElementById("login"); 
zhezhao.style.display="block"; 
login.style.display="block"; 
}
function StuLoad(){
	var loadname = Load.loadname.value;
	var password = Load2.loadpassword.value;
	
	if(loadname==null || password==null){
		alert("填写信息！");
	}
	var url="Studentload_base.jsp?id="+loadname+"&pass="+password;
	loadXMLDoc(url,GetResultS);
	
}

function GetResultS(){
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200){
			//alert("执行成功");
			//document.getElementById("toolTip").innerHTML=xmlhttp.responseText;
			var result = xmlhttp.responseText;
			//alert( result );
			if( result == 1 ){
				 var zhezhao=document.getElementById("zhezhao"); 
				 var login=document.getElementById("login"); 
				  zhezhao.style.display="none"; 
				  login.style.display="none"; 
				  var loadname = Load.loadname.value;
				  var url ="OPStu.jsp?Sid="+loadname;
					window.location.href=url
			}
			else{
				alert( "登录名或密码错误！" );
			}
			//document.getElementByld("toolTip").style.display="block";
		}else{
			//alert("你所请求的页面有错误!");
		}
	}
}
</script>
</head>
<body>
<div class="zhezhao" id="zhezhao"  ></div> 
 <div class="login" id="login">
<div align="center">
<table>
<tr>
<td>
<form name = "Load" action="">
用户名：<input type="text" name="loadname" value = "" />
</form>
</td>
</tr>
<br>
<tr>
<td>
<form name = "Load2" action="">
密 &nbsp&nbsp 码 ：<input type="password" name="loadpassword" value = ""/>
</form>
</td>
</tr>
</table>
<br>
<input  type="button" value="登录" onclick="StuLoad()" />
<div id = "toolTip"> </div>
</div>
</div>

</body>

</html>
