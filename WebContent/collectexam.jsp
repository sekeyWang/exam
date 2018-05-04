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
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select eid, avg(mark) from result group by eid order by eid;";
	rs = Link.select(sql);
	while (rs.next()){
		out.println("第" + rs.getString(1) + "套试卷的平均分是：" + rs.getString(2) + "<br><br>");
	}
%>
<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>