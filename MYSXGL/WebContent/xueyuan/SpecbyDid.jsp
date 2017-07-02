<%@page import="dbcn.ReturnDRs"%>
<%@page import="dbcn.OPSpec"%>
<%@page import="dbcn.OPD"%>
<%@page import="dbcn.DbConnet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="datainfo.*" 
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/One.css" type="text/css"  />
<script src="../js/Ajax.js" type="text/javascript"></script>
<script type="text/javascript">
function AddSpecRes(){
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200){
			alert("dfs");
			//alert("执行成功");
			//document.getElementById("toolTip").innerHTML=xmlhttp.responseText;
			var result = xmlhttp.responseText;
			alert( result );
			if( result == 1 ){
				alert( "执行成功" );
				//window.location.href = "Dtable.jsp";
			}
			else{
				alert( "执行失败" );
			}
			//document.getElementByld("toolTip").style.display="block";
		}else{
			//alert("你所请求的页面有错误!");
		}
	}
}
function AddSpec(Did){
	

	var Direc = form2.Direc.value;
	
	var SpecName = form2.SpecName.value;
	
	var Specid = form2.Specid.value;
	alert(Specid);
	alert(SpecName);
	alert(Direc);
	alert(Did);
	var url = "AddSpec.jsp?Did="+Did+"&Specid="+Specid+"&Specname="+SpecName+"&direc="+Direc;
	//var url = "AddSpec.jsp?Did="+Did+"&Direc="+Direc+"&Specname="+SpecName+"&Specid="Specid;
	alert(url);
	loadXMLDoc(url,AddSpecRes);
	location.reload(true);
}
function DeleSpec(Specid){
	alert(Specid);
	var url = "DeleteSpec.jsp?Specid="+Specid;
	alert(url);
	
	loadXMLDoc(url,AddSpecRes);
	location.reload(true);
}

function UpdateSpec(Specid){
	alert(Specid);
	var url = "UpdateSpec.jsp?Specid="+Specid;
	window.location.href=url
}

function Serfun(){
	var Specid = form1.Specid.value;
	alert(Specid);
	var url ="SpecbyDid.jsp?Specid="+Specid;
	alert(url);
	window.location.href=url
}
</script>
</head>
<body>
<form name="form1" >
<input name ="Specid" type="text" value='' /><button onclick="Serfun()">查询</button>

</form>
<table>

<%

String Did = request.getParameter("Did");
String SpecId = request.getParameter("Specid");
if(SpecId != null){
	Did = OPSpec.GetDid(SpecId);
	
}
System.out.print(Did);
String Dname = request.getParameter("Dname");
ResultSet rs = null;
if(Did == null && SpecId !=null)
{
	Did = "全校";
	Dname = "专业";
	rs = OPSpec.GetSpecAll();
}else if(SpecId==null){
rs = ReturnDRs.GetSpecbyDRs(Did);
}else
{
	Dname = OPD.GetDnameByDid(Did);
	rs = OPSpec.GetSpecInf(SpecId);
}
Spec  sp = new Spec();

%>
<tr><th><%=Dname %></th><th></th><th>学院ID</th><th><%=Did %></th><th><a href="Dtable.jsp" >返回</a></th><tr>
<tr><th>专业ID</th> <th>专业名称</th> <th>专业方向</th><th>修改</th><th>删除</th></tr>
<%
try{
	while(rs.next())
	{
		sp.setP_xueyuanid(rs.getString("学院ID"));
		sp.setP_zhuanyeid(rs.getString("专业ID"));
		sp.setP_zhuanyemingcheng(rs.getString("专业名称"));
		sp.setP_zhuanyefangxiang(rs.getString("专业方向"));
		System.out.printf("%s %s %s %s\n",sp.getP_xueyuanid(),sp.getP_zhuanyefangxiang(),sp.getP_zhuanyeid(),sp.getP_zhuanyemingcheng());
%>
<tr><td><a href="ChuliSpec.jsp?Specid=<%=sp.getP_zhuanyeid() %>"><%=sp.getP_zhuanyeid() %></a></td>
<td><%=sp.getP_zhuanyemingcheng() %></td><td><%=sp.getP_zhuanyefangxiang() %></td>
<td><button onclick="UpdateSpec(<%=sp.getP_zhuanyeid()%>)">修改</button></td>
<td><button onclick="DeleSpec(<%=sp.getP_zhuanyeid() %>)">删除</button>
</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>

<form name = "form2"  >
<input name="Specid" type="text" value=''/>
<input name="SpecName" type="text" value=''/>
<input name="Direc" type="text" value=''/>
<input name="bt" type="button" onclick="AddSpec(<%=Did %>)" value = "添加">
</form>


</body>
</html>