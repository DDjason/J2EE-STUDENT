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
function SeD(use){
	var name = use.value;
	 var url ="SelectStu.jsp?ope=1111&name="+name;
	 alert(url);
		window.location.href=url
}
</script>
</head>
<body>
<form action="" method="post" name="form1">
<input name="name1" type="text" value=""/><button onclick="SeD(form1.name1)" >学院名称</button>
</form>

<table>
<tr>
<th>学号</th><th>姓名</th><th>性别</th><th>手机号</th><th>班级名称</th><th>详细</th>
</tr>
<%

String ope = request.getParameter("ope");
String name = request.getParameter("name");
ResultSet rs = null;
if(ope == null){
	rs = SearchStu.Search();
}else if(ope.length() == 2){
	rs = SearchStu.SearchByClassname(name);
}else if(ope.length() == 3){
	rs = SearchStu.SearchBySpecname(name);
}else if(ope.length() == 4){
	rs = SearchStu.SearchByDname(name);
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