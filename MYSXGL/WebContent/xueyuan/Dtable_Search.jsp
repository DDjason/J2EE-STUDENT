<%@page import="dbcn.OPD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/One.css" type="text/css"  />
<script src="../js/Ajax.js" type="text/javascript"></script>
<script type="text/javascript">
function Update(Did){
	alert(Did);
	var Did = form1.input1.value;
	alert(Did);
	var DDname = form2.input2.value;
	alert(DDname);
	var url = "ChangeDinfo.jsp?Did="+Did+"&Dname="+DDname;
	//window.location.href=url; 
	alert(url);
	loadXMLDoc(url,GetResultD);
	location.reload(true);
}

</script>
</head>
<body>
<%
String Did = request.getParameter("Did");
String Dname = OPD.SearchOneDname(Did);
%>
<table >
<tr><th ><%=Dname %></th><th >学院</th><th><a href="Dtable.jsp" >返回</a></th></tr>
<tr><th>学院ID</th><th>学院名称</th><th>修改</th></tr>

<tr><td>
<form name = "form1"><input name="input1" value=<%=Did %> >
</form>
</td>
<td>
<form name = "form2">
<input name="input2" value=<%=Dname %> >
</form>
</td>

<td><button onclick="Update(<%=Did %>)">修改</button></td></tr>

</table>
</body>
</html>