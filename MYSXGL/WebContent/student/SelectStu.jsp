<%@page import="java.sql.*"%>
<%@page import="dbcn.SearchStu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/One.css" type="text/css"  />
<script type="text/javascript">
function SeD(){
	var Vame = form1.ope.value;
	alert(Vame);
	//var add = '4'+Vname;
	//alert(add);
	// var url ="SelectStu2.jsp?ope="+add;
	// alert(url);
		//window.location.href=url;
}
</script>
</head>
<body>
<form  name="form1">
<input name="ope" type="text" value=""/><button onclick="SeD()" >学院名称</button>
</form>

<table>
<tr>
<th>学号</th><th>姓名</th><th>性别</th><th>手机号</th><th>班级名称</th><th>详细</th>
</tr>
<%
String ope = request.getParameter("ope");
//String Usc = SearchStu.retuSuc(ope);
ResultSet rs = null;
if(ope == null){
	rs = SearchStu.Search();
}else if(ope.charAt(0) == '2'){
	rs = SearchStu.SearchByClassname(ope);
}else if(ope.charAt(0) == '3'){
	rs = SearchStu.SearchBySpecname(ope);
}else if(ope.charAt(0) == '4'){
	rs = SearchStu.SearchByDname(ope);
}
try{
	while(rs.next()){
%>
<tr>
<td><%=rs.getString("学号") %></td><td><%=rs.getString("姓名") %></td><td><%=rs.getString("性别") %></td>
<td><%=rs.getString("手机号") %></td><td><%=rs.getString("班级名称") %></td><td><a href="Stable.jsp?Sid=<%=rs.getString("学号") %>">详情</a></td>
</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</body>
</html>