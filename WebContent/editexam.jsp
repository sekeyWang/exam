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
	sql = "select eid, title from exam;";
	rs = Link.select(sql);
	
	while (rs.next()){
		out.println("<br>第" + rs.getString(1) + "套试卷：" + rs.getString(2) + "<br>");
		out.println("<a href = \"updateexam.jsp?eid="+ rs.getString(1) + "&id=" + id + "\">编辑</a>");
		out.println("<a href = \"deleteexam.jsp?eid="+ rs.getString(1) + "&id=" + id + "\">删除</a><br>");
	}
	Link.close();
%>
</body>
<br><a href="#" onclick="history.back()">返回上一页</a>
</html>