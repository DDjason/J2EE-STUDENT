<%@ page language="java" import="java.sql.*" import="dbcn.OPD" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Did=request.getParameter("Did");
OPD.DeleteDid(Did);
%>
