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
	String type = request.getParameter("type");
	out.println(type);
	
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql = null;
	if (type.equals("student")){
		try{
			sql = "select * from student where sname = '" + acc + "' and spassword = '" + pas + "';";
			ResultSet rs = Link.select(sql);
			rs.next();
			rs.getBoolean(1);
			response.sendRedirect("welcomestudent.jsp?id=" + acc); 
		}
		catch (Exception e) {
			e.printStackTrace();
			out.println("账号密码错误");
		}
	}
	if (type.equals("admin")){
		try{
			sql = "select * from admin where aname = '" + acc + "' and apassword = '" + pas + "';";
			ResultSet rs = Link.select(sql);
			rs.next();
			rs.getBoolean(1);
			response.sendRedirect("welcomeadmin.jsp?id=" + acc); 
		}
		catch (Exception e) {
			e.printStackTrace();
			out.println("账号密码错误");
		}
	}
	Link.close();
	
%>		
<br><br><a href = "login.jsp">返回</a><br><br>
</body>
</html>