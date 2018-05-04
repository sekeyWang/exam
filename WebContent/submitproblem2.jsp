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
	String id = request.getParameter("id");
	String pid = request.getParameter("pid");
	String Type = request.getParameter("type");
	String des = request.getParameter("description");
	des = new String(des.getBytes("iso-8859-1"), "utf-8");
	
	String[] opt = request.getParameterValues("option");	
	if (Type.equals("1")) for (int i = 0; i < opt.length; i++){
		opt[i] = new String(opt[i].getBytes("iso-8859-1"), "utf-8");
	}

	String ans = request.getParameter("answer");
	ans = new String(ans.getBytes("iso-8859-1"), "utf-8");
	
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	if (Type.equals("0")) sql = "update problem set intro='" + des + "',answer='" + ans + "' where pid = " + pid;
	else sql = "update problem set intro='" + des + "', choice1='" + opt[0] + "', choice2='" + opt[1] +"', choice3='" + opt[2] +"', choice4='" + opt[3] +"', answer='" + ans + "' where pid = " + pid;
	Link.insert(sql);
	out.println("修改成功！");
%>
<br><br><a href = "welcomeadmin.jsp?id="<%out.print(id);%>>返回主页</a><br>
</body>
</html>