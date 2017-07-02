<%@ page language="java" import="java.sql.*" import="dbcn.OPAdmin" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String useid=request.getParameter("useid");
String pass=request.getParameter("pass");
if(OPAdmin.CheckLoad(useid,pass))
{
	
	out.println(1);
	
}else
{
	out.println("<result>");
	out.println( "<repeat>flase</repeat>" );
	out.println("</result>");
}
%>
