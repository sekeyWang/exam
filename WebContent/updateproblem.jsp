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
	String pid = request.getParameter("pid");
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select intro, choice1, choice2, choice3, choice4, answer, ptype from problem where pid = " + pid;
	rs = Link.select(sql);
	rs.next();
	String des = rs.getString(1);
	String op1 = rs.getString(2);
	String op2 = rs.getString(3);
	String op3 = rs.getString(4);
	String op4 = rs.getString(5);
	String ans = rs.getString(6);
	int type = rs.getInt(7);
%>
<form action = "submitproblem2.jsp?pid=<%out.print(pid);%>&id=<%String id = request.getParameter("id");out.print(id);%>" method = post>
	题目描述<br><textarea name="description" style="width:200px;height:80px;"><%out.print(des);%></textarea><br><br>
<%
	if (type == 1 || type == 2){
		out.println("A:<input type=\"text\" name=\"option\" value=\"" + op1 + "\"><br>");
		out.println("B:<input type=\"text\" name=\"option\" value=\"" + op2 + "\"><br>");
		out.println("C:<input type=\"text\" name=\"option\" value=\"" + op3 + "\"><br>");
		out.println("D:<input type=\"text\" name=\"option\" value=\"" + op4 + "\"><br>");
		out.println("<input type = \"hidden\" name = \"type\" value = 1>");
	}
	else out.println("<input type = \"hidden\" name = \"type\" value = 0>");
	
%>
	正确答案:<input type="text" name="answer" value="<%out.print(ans);%>"><br>
	<input type = "submit" value = "更改">
</form>
</body>
</html>