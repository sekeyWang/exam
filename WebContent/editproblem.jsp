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
<%
	String id = request.getParameter("id");
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select pid, intro from problem;";
	rs = Link.select(sql);
	
	while (rs.next()){
		out.println("<br>" + rs.getString(1) + "." + rs.getString(2) + "<br>");
		out.println("<a href = \"updateproblem.jsp?id=" + id + "&pid="+ rs.getString(1) + "\">编辑</a>");
		out.println("<a href = \"deleteproblem.jsp?id=" + id + "&pid="+ rs.getString(1) + "\">删除</a><br>");
	}
	Link.close();
%>
</body>
<br><a href="welcomeadmin.jsp?id=<%out.print(id);%>">返回首页</a>
</html>