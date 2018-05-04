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
	String[] problems = request.getParameterValues("problems");
	String[] points = request.getParameterValues("points");
	String hour = request.getParameter("hour"); int h = Integer.parseInt(hour);
	String min = request.getParameter("min"); int m = Integer.parseInt(min);
	String sec = request.getParameter("sec"); int s = Integer.parseInt(sec);
	String title = request.getParameter("title");
	title = new String(title.getBytes("iso-8859-1"), "utf-8");
	s += m * 60 + h * 3600;
//	for (int i = 0; i < problems.length; i++) out.print(problems[i]);
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select eid from exam order by eid desc limit 1;";
	rs = Link.select(sql);
	rs.next();
	int eid = rs.getInt(1) + 1;
	sql = "insert into exam values(" + eid + ", " + s + ", '" + title + "')";
	Link.insert(sql);
	for (int i = 0; i < problems.length; i++){
		sql = "insert into link values(" + eid + ", " + problems[i] + ", " + points[i] + ")";
		Link.insert(sql);
	}
	out.println("添加成功");
%>
</body>
<br><br><a href = "welcomeadmin.jsp?id=<%String id = request.getParameter("id");out.print(id);%>">返回主页</a><br>
</html>