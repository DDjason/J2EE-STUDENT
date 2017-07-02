<%@ page language="java" import="java.sql.*" import="dbcn.OPD" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Did=request.getParameter("Did");
String Dname=request.getParameter("Dname");
if(OPD.ChanDinfo(Did, Dname))
{
	out.println(1);
}else{
	out.println(0);
}
%>
