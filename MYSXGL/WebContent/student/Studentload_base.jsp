<%@ page language="java" import="java.sql.*" import="dbcn.OPS" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loadid=request.getParameter("id");
String loadpass=request.getParameter("pass");

if(OPS.LoadCheck(loadid, loadpass))
{
	out.println(1);
}else{
	out.println(0);
}
%>