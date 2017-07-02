<%@ page language="java" import="java.sql.*" import="dbcn.OPSpec" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String Specid=request.getParameter("Specid");
if(OPSpec.DeleSpec(Specid))
{
	out.println(1);
}else{
	out.println(0);
}
%>
