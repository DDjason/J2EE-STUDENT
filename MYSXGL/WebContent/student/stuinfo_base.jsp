<%@ page language="java" import="java.sql.*" import="dbcn.OPS" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Sql=request.getParameter("sql");

if(OPS.Changestuinfo(Sql))
{
	out.println(1);
}else{
	out.println(0);
}
%>