<%@page import="dbcn.ReturnDRs"%>
<%@page import="dbcn.OPD"%>
<%@page import="dbcn.DbConnet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="datainfo.*" 
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/Dtable.js" type="text/javascript"></script>
<script src="../js/Ajax.js" type="text/javascript"></script>
<link rel="stylesheet" href="../css/One.css" type="text/css"  />
<script type="text/javascript">
function Serfun(){
	var DDid = form1.Did.value;
	
	alert(DDid);
	var url ="Dtable.jsp?="+DDid;
	alert(url);
	window.location.href=url
}
function Add(){
	 var DDid = form2.Did.value;
	 var DDname = form2.Dname.value;
	 alert(DDid);
	 alert(DDname);
	 var url="AddD.jsp?Did="+DDid+"&Dname="+DDname;
	 alert(url);
	 loadXMLDoc(url,Res);
}
function Res(){
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
function Update(Did){
	alert(Did);
	var url = "Dtable_Search.jsp?Did="+Did;
	alert(url);
	window.location.href=url
}
</script>
</head>
<body>



<form name="form1" >
<input name ="Did" type="text" value='学院ID' /><button onclick="Serfun()">查询</button>

</form>
<table>
<tr><th>学院ID</th><th>学院名称</th><th>修改</th><th>删除</th></tr>
<%
//String D_id = "nn";
String D_id = request.getParameter("Did");
String Start = request.getParameter("Start");

int Begin;
System.out.print(D_id);
if(Start == null || Start == "0")
{
 Begin = 0;
}else
{
	char tempp = Start.charAt(0);
	Begin = tempp - '0';
	if(Begin > 2)
		Begin = 2;
	if(Begin < 0)
		Begin = 0;
}
ResultSet rs;
int ttt = 0;
if(D_id != null)
{
	char tempp = D_id.charAt(0); 
 ttt = (int)(tempp - 'n');
}
if(ttt == 0 || D_id == null)
{
 rs = OPD.SearchAllD();
}else
{
	rs = OPD.SearchByDid(D_id);
}
Sd temp = new Sd();	int tt = -1;
try{
	while(rs.next())
	{
		tt++;
		if(tt >= Begin*10 && tt < Begin*10+10)
		{
		temp.setD_xueyuanid(rs.getString("学院ID"));
		temp.setD_xueyuanmingcheng(rs.getString("学院名称"));
		System.out.printf("%s  %s\n",temp.getD_xueyuanid(),temp.getD_xueyuanmingcheng());
		String IID = temp.getD_xueyuanid();
		%>

<tr>
<td><a href="SpecbyDid.jsp?Did=<%=temp.getD_xueyuanid()%>&Dname=<%=temp.getD_xueyuanmingcheng() %>"><%=temp.getD_xueyuanid()%></a></td>
<td><input  name = <%=temp.getD_xueyuanid() %> type="text" value="<%=temp.getD_xueyuanmingcheng() %>" /></td>
<td><button onclick="Update(<%=temp.getD_xueyuanid()%>)">修改</button></td>
<td><button onclick="Dele(<%=temp.getD_xueyuanid() %>)">删除</button>
</tr>
		
		<%
		}
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
<form name = "form2">
<td><input name="Did" type="text" value=''/></td><td><input name="Dname" type="text" value=''></td>  
<input name="bt" type="button" onclick="Add()" value = "添加">
</form>
<a href="Dtable.jsp?Did=<%=D_id %>&Start=<%=Begin-1 %>" >上一页</a>
<a href="Dtable.jsp?Did=<%=D_id %>&Start=<%=Begin+1 %>" >下一页</a>
<a href="../student/SelectStu.jsp">学生信息</a>
</body>
</html>