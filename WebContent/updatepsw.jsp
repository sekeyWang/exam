<%@page import="exam.JDBCTest"%>
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
	String acc = request.getParameter("id");
	String npsw = request.getParameter("password");
	String sql = "update student set spassword = '" + npsw + "' where sname = '" + acc + "';";
//	out.println(sql);
	JDBCTest Link = new JDBCTest();
	try{
		Link.open();
		Link.insert(sql);
		Link.close();
		out.println("修改成功");
	}catch (Exception e) {
		e.printStackTrace();
		out.println("修改失败");
	}
	Link.close();
%>

<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>