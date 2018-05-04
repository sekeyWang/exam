<%@page import="exam.JDBCTest"%>
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
	String pid = request.getParameter("pid");
	String id = request.getParameter("id");
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	sql = "delete from link where pid = " + pid;
//	out.println(sql + "<br>");
	Link.insert(sql);
	sql = "delete from problem where pid = " + pid;
//	out.println(sql + "<br>");
	Link.insert(sql);
	out.println("删除成功！");
%>
<br><a href="editproblem.jsp?id=<%out.print(id);%>">返回上一页</a>
</body>
</html>