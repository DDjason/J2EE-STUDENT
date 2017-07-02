<%@page import="java.sql.*"%>
<%@page import="dbcn.OPS"%>
<%@page import="dbcn.DbConnet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
}
table, td, th
  {
  border:1px solid green;
  }

th
  {
  background-color:green;
  color:white;
  }
  
a:link, a:visited {
color: #BBDDFF;
text-decoration: underline;
font-weight: bold;
}

a:hover {
color:#FF00FF;
text-decoration: none;
}

</style>
</head>
<body>
<table>
<%

String Sid = request.getParameter("Sid");
ResultSet rsl =null;
ResultSet rss = null;
rsl = OPS.GetColumn();
rss = OPS.GetSinfbyId(Sid);

String[] column = new String[80];
try{

while(rss.next()){
	for(int i =1 ; i < 65;i++){
		column[i] = rss.getString(i);
		System.out.println(rss.getString(i));
	}
}
}catch(Exception e){
e.printStackTrace();
}
String temp;
try{
	int i = 0;
	while(rsl.next()){
		i++;
		temp = rsl.getString(1);
		System.out.printf("%s == %s\n",rsl.getString(1),column[i]);
		if(i%4 == 1){
			%>
			<tr>
			<%
		}
		%>
		<th><%=rsl.getString(1) %></th><td><%=column[i] %></td>
		<%
		if(i%4 == 0){

			%>
			</tr>
			<%
		}
		
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</body>
</html>