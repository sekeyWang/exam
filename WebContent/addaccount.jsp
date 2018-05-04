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
	String acc = request.getParameter("account");
	String pas = request.getParameter("password");
	JDBCTest Link = new JDBCTest();
	Link.open();
	ResultSet rs = Link.select("select sid from student order by sid desc limit 1");
	rs.next();
	int number = rs.getInt(1) + 1;
	try{
		String sql = "insert into student values(";
		sql += number;
		sql += ", " + "'" + acc + "'";
		sql += ", " + "'" + pas + "'" + ")";
//		out.println(sql);
		Link.insert(sql);
		out.println("添加成功");
	}
	catch (Exception e) {
		e.printStackTrace();
		out.println("添加失败 已经存在这个账号");
	}
	Link.close();
%>

<br><br><a href = "login.jsp">返回主页</a><br>
</body>
</html>