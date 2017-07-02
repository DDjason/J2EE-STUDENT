<%@ page language="java" import="java.sql.*" import="dbcn.OPSpec" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Specid=request.getParameter("Specid");
String newSpecid=request.getParameter("newSpecid");
String SpecName=request.getParameter("SpecName");
String SpecDirec=request.getParameter("SpecDirec");
String Did=request.getParameter("Did");
if(OPSpec.UpdateSpec(Specid, newSpecid, SpecName, SpecDirec, Did))
{
	out.println(1);
}else{
	out.println(0);
}
%>
