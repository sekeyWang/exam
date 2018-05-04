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
欢迎参加考试<br>
请选择试卷<br>
<%
	String sql = null;
	JDBCTest Link = new JDBCTest();
	Link.open();
	sql = "select eid from exam;";
	ResultSet rs = Link.select(sql);
	String id = request.getParameter("id");
%>
<form action = "taketest.jsp?id=<%out.print(id);%>" method = "post">
	<select name = "paper">
	<%
		while (rs.next()){
			out.println("<option value = \"" + rs.getInt(1) + "\"" + "> 第" + rs.getInt(1) + "套试卷</option>");
		}
	%>
	</select>
	<input type = "submit" value ="确定">
</form>	
	
<br><a href="welcomestudent.jsp?id=<%out.print(id);%>">返回上一页</a>
</body>
</html>