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
	String[] problems = request.getParameterValues("problems");
	String[] points = request.getParameterValues("points");
	String hour = request.getParameter("hour"); int h = Integer.parseInt(hour);
	String min = request.getParameter("min"); int m = Integer.parseInt(min);
	String sec = request.getParameter("sec"); int s = Integer.parseInt(sec);
	String title = request.getParameter("title");
	s += m * 60 + h * 3600;
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "update exam set ti = " + s + " where eid = " + eid;
	Link.insert(sql);
//	out.println(sql + "<br>");
	for (int i = 0; i < problems.length; i++){
		sql = "update link set points = " + points[i] + " where eid = " + eid + " and pid = " + problems[i];
		Link.insert(sql);
//		out.println(sql + "<br>");
	}
	out.print("修改成功！");
	Link.close();
%>
</body>
<br><br><a href = "welcomeadmin.jsp">返回主页</a><br>
</html>