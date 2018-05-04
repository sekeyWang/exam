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
	String eid = request.getParameter("eid");
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	
	sql = "delete from link where eid = " + eid;
	Link.insert(sql);
	
	sql = "delete from result where eid = " + eid;
	Link.insert(sql);
	
	sql = "delete from exam where eid = " + eid;
	Link.insert(sql);
		
	out.println("删除成功！");
	Link.close();
%>
<br><br><a href = "welcomeadmin.jsp?id=<%String id = request.getParameter("id");out.print(id);%>">返回主页</a><br>
</body>
</html>