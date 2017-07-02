<%@page import="dbcn.OPSpec" import="java.sql.*" import="datainfo.*" %>
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
function UpdateSpec(SpecId){
	alert(SpecId);
	var newSpecid = form1.inp1.value;
	alert(newSpecid);
	var SpecName = form2.inp2.value;
	alert(SpecName);
	var SpecDirec = form3.inp3.value;
	alert(SpecDirec);
	var Did = form4.inp4.value;
	alert(Did);
	var url = "UpdateSpec_base.jsp?Specid="+SpecId+"&newSpecid="+newSpecid+"&SpecName="+SpecName+"&SpecDirec="+SpecDirec+"&Did="+Did;
	alert(url);
	loadXMLDoc(url,GetResultD);
}

</script>
</head>
<body>
<table>
<%
String Specid = request.getParameter("Specid");
ResultSet rs = OPSpec.GetSpecInf(Specid);
Spec sp = new Spec();
try{
	while(rs.next()){
		sp.setP_xueyuanid(rs.getString("学院ID"));
		sp.setP_zhuanyefangxiang(rs.getString("专业方向"));
		sp.setP_zhuanyeid(rs.getString("专业ID"));
		sp.setP_zhuanyemingcheng(rs.getString("专业名称"));
		
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<tr>
<th><%=sp.getP_zhuanyemingcheng() %></th><th></th><th>学院ID</th><th><%=sp.getP_xueyuanid() %></th><th><a href="Dtable.jsp" >返回</a></th><tr>
<tr><th>专业ID</th> <th>专业名称</th> <th>专业方向</th><th>学院ID</th><th>修改</th></tr>
<tr>
<td>
<form name ="form1"> <input name ="inp1" type ="text" value=<%=sp.getP_zhuanyeid()%> /> </form>
</td>
<td>
<form name ="form2"> <input name ="inp2" type ="text" value=<%=sp.getP_zhuanyemingcheng() %> /> </form>

</td>
<td>
<form name ="form3"> <input name ="inp3" type ="text" value=<%=sp.getP_zhuanyefangxiang() %> /> </form>

</td>
<td>
<form name ="form4"> <input name ="inp4" type ="text" value=<%=sp.getP_xueyuanid() %> /> </form>

</td>

<td><button onclick="UpdateSpec(<%=sp.getP_zhuanyeid()%>)">修改</button></td>
</tr>
</table>
</body>
</html>