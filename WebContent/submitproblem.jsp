<%@page import="com.sun.org.glassfish.gmbal.Description"%>
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
	String des = request.getParameter("description");
	des = new String(des.getBytes("iso-8859-1"), "utf-8");
	String type = request.getParameter("type");
	int tp = Integer.valueOf(type);
	String[] opt = request.getParameterValues("option");
	for (int i = 0; i < opt.length; i++){
		opt[i] = new String(opt[i].getBytes("iso-8859-1"), "utf-8");
	}
	String ans = request.getParameter("answer");
	ans = new String(ans.getBytes("iso-8859-1"), "utf-8");
	
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select pid from problem order by pid desc limit 1;";
	rs = Link.select(sql);
	rs.next();
	int pid = rs.getInt(1) + 1;
	if (tp == 1 || tp == 2)
		sql = "insert into problem values(" + pid + ", '" + des + "', '" + opt[0] + "', '"+ opt[1] + "', '" + opt[2] + "', '" + opt[3] + "', '" + ans + "', '" + type + "');";
	else
		sql = "insert into problem values(" + pid + ", '" + des + "', '" +  "', '"+  "', '" +  "', '" +  "', '" + ans + "', '" + type + "');";
//	out.println(sql);
	Link.insert(sql);
	out.println("题目添加成功");	
%>
<br><br><a href = "welcomeadmin.jsp?id=<%String id = request.getParameter("id");out.print(id);%>">返回主页</a><br>
</body>
</html>