<%@page import="exam.JDBCTest"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "setdetail.jsp?id=<%String id = request.getParameter("id");out.print(id);%>" method = post>
请选择题目：<br>
<%
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select pid, intro from problem;";
	rs = Link.select(sql);
	
	while (rs.next()){
		out.println("<br>" + rs.getString(1) + "." + rs.getString(2) + "<br>");
		out.println("<input name=\"problems\" type=\"checkbox\" value=\""+ rs.getString(1) +"\"/><br>");
	}
	
	Link.close();
%>
<input type = "submit" value = "确定">
</form>

<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>