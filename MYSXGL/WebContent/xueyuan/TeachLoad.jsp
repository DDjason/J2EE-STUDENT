<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/Ajax.js" type="text/javascript"></script>
<script type="text/javascript">


function Load(){
	var Loadname = Loadjsp.loadname.value;
	 var Loadpassword = document.Loadjsp.loadpassword.value;
	 if(Loadname == ""){
		 alert("姓名未输入");
		 return false;
	 }else if(Loadpassword == ""){
		 alert("密码为空---请输入密码！");
		 Loadjsp.loadpassword.focus();
		 return false;
		 }
	 var url = "Load_Base.jsp?useid=" + Loadname + "&pass=" +Loadpassword;
	 alert(url);
	 loadXMLDoc(url,LoadFun);
}
</script>
</head>
<body>
<form name = "Loadjsp" action="">

<div align="center">
<div>
用户名：<input type="text" name="loadname" value = "" />
</div>
<br>
<div>
密码 ：<input type="password" name="loadpassword" value = ""/>
</div>
<br>
<div >
<input type="button" value="登录" onclick="Load()"/>
</div>
<div id = "toolTip"> </div>
</div>
</form>
</body>
</html>