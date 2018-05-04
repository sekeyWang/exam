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
<form action = "addtoexam.jsp?id=<%String id = request.getParameter("id");out.print(id);%>" method = post>
	请输入标题：
	<input name = "title" type="text" value = ''><br><br>
	设置考试时间：
	<input name = "hour" type="text" value = 0>小时
	<input name = "min" type="text" value = 0>分钟
	<input name = "sec" type="text" value = 0>秒<br><br>
	设置题目分数<br><br>
<%
	String[] problems = request.getParameterValues("problems");
	
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	int idx = 0;
	for (int i = 0; i < problems.length; i++){
		idx++;
		sql = "select intro from problem where pid = " + problems[i];
		rs = Link.select(sql);
		rs.next();
		out.println(idx + "." + rs.getString(1) + "<br>");
		out.println("<input name = \"problems\" type = \"hidden\" value = " + problems[i] + ">");
		out.println("分数：" + "<input name = \"points\" type=\"text\" value = 0>" + "<br><br>");
	}
%>
	<input type = "submit" value = "确定">
</form>

</body>
</html>