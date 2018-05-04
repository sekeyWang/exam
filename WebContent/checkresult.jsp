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
来看成绩吧<br><br>
<%
	String id = request.getParameter("id");
	JDBCTest Link = new JDBCTest(); Link.open();	
	String sql; ResultSet rs;
	sql = "select eid, mark, fullmark from result, student where result.sid = student.sid and student.sname = '" + id +"' order by rid;";
	Link.select(sql);
	rs = Link.select(sql);
	int idx = 0;
	while(rs.next()){
		idx++;
		out.println("<br>您参加的第"+ idx +"次考试结果:<br>");
		out.println("在第" + rs.getString(1) + "套试卷中，你获得了" + rs.getString(2) + "分，满分为" + rs.getString(3) + "分<br>");
	}
	if (idx == 0) out.println("你还没考过试");
%>
<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>