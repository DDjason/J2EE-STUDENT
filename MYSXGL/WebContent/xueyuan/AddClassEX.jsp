<%@page import="dbcn.OPClass"%>
<%@ page language="java" import="java.sql.*" import="dbcn.OPSpec" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sql = request.getParameter("sql");
if(OPClass.AddClass(sql)){
	out.println(1);
}else{
	out.println(0);
}
%>
