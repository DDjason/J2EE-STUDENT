<%@page import="dbcn.OPClass" import="test.Funx" import="dbcn.OPSpec" import="dbcn.OPD" import="java.sql.*" import="datainfo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/One.css" type="text/css"  />
<script src="../js/Ajax.js" type="text/javascript"></script>
<script type="text/javascript">
function Serfun(){
	var Specid = form1.Specid.value;
	//var Classid = form1.Specid1.value;
	if(Specid == '专业ID'){
		alert("请务必输入一项！");
		}else{
	var url;
		url ="ChuliSpec.jsp?=Specid"+Specid;
	window.location.href=url;
		}
}
function AddClass(){
	var Classid = form2.Classid.value;
	var ClassName = form2.ClassName.value;
	var Specid = form2.Specid .value;
	var Fdaoyu = form2.Fdaoyu.value;
	alert(Classid);alert(ClassName);alert(Specid);alert(Fdaoyu);
	var sql = "INSERT INTO `XSGL`.`Class`(`班级ID`,`班级名称`,`专业ID`,`辅导员`)VALUES('"+Classid+"','"+ClassName+"','"+Specid+"','"+Fdaoyu+"');";
	var url = "AddClassEX.jsp?sql="+sql;
	alert(url);
	loadXMLDoc(url,GetResultD);
}
function DeleClass(Classid){
	var sql = "DELETE FROM `XSGL`.`Class`WHERE 班级ID = '"+Classid+"';";
	var url = "AddClassEX.jsp?sql="+sql;
	alert(url);
	loadXMLDoc(url,GetResultD);
}
</script>
</head>
<body>
<form name="form1" >
<input name ="Specid" type="text" value='专业ID' /><button onclick="Serfun()">查询</button>

</form>
<%
String Specid = request.getParameter("Specid");


String Dname = OPD.SearchOneDname(OPSpec.GetDid(Specid));
String Specname = OPSpec.GetSpecName(Specid);
%>

<table>

<tr><th>学院名称</th><th><%=Dname %></th><th>专业名称</th><th><%=Specname %></th><th>功能</th></tr>
<tr><th>班级ID</th><th>班级名称</th><th>专业ID</th><th>辅导员</th><th>删除</th></tr>
<%
ResultSet rs=null;
if(Specid != null){
	 rs = OPClass.SearchClassByDid(Specid);
}else{
	rs = OPClass.SearchClassAll();
}
SClass cs = new SClass();

try{
	int t = -1;
	while(rs.next()){
		t++;
		cs.setC_banjiid(rs.getNString(1));
		cs.setC_banjimingcheng(rs.getString(2));
		cs.setC_fudaoyuan(rs.getString(4));
		cs.setC_zhuanyeid(rs.getString(3));
		System.out.println(rs.getString(3));
		
		%>
		<tr><td><%=cs.getC_banjiid() %></td><td><%=cs.getC_banjimingcheng() %></td>
		<td><%=cs.getC_zhuanyeid() %></td>
		<td><%=cs.getC_fudaoyuan()%></td>
		<td><a onclick="DeleClass(<%=cs.getC_banjiid() %>)">删除</a></td></tr>
		<%
		
	}
}catch(Exception e){
	e.printStackTrace();
}
System.out.println(Specid);
%>
</table>
<form name = "form2"  >
<input name="Classid" type="text" value=''/>
<input name="ClassName" type="text" value=''/>
<input name="Specid" type="text" value=''/>
<input name="Fdaoyu" type="text" value=''/><p>
<input name="bt" type="button" onclick="AddClass()" value = "添加">
</form>

</body>
</html>