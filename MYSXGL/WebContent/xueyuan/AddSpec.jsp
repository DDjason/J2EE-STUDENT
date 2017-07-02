<%@ page language="java" import="java.sql.*" import="dbcn.OPSpec" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Did=request.getParameter("Did");
String SpecName=request.getParameter("Specname");
String direc=request.getParameter("direc");
String Specid=request.getParameter("Specid");
if(OPSpec.AddSpec(Specid, SpecName, direc, Did))
{
	out.println(1);
}else{
	out.println(0);
}
%>
