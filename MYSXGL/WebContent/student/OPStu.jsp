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


</script>
</head>
<body>
<%
String Sid = request.getParameter("Sid");
%>
<table>
<tr>
<th>学生学号</th><th><%=Sid %></th></tr>
</table>
<ul>
<li><a href="Stuinfochan.jsp?Sid=<%=Sid %>" >信息修改</a></li>
<li><a href="Stable.jsp?Sid=<%=Sid %>" >信息查询</a><li>
</ul>
</body>

</html>
