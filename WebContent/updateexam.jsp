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
	JDBCTest Link = new JDBCTest();
	Link.open();
	String sql;
	ResultSet rs;
	sql = "select ti from exam where eid = " + eid;
	rs = Link.select(sql);
	rs.next();
	int s = rs.getInt(1);
	int h = s / 3600;
	s = s % 3600;
	int m = s / 60;
	s = s % 60;
%>
<form action = "updateexam2.jsp?eid=<%out.print(eid);%>" method = post>
	设置考试时间：
	<input name = "hour" type="text" value = <%out.print(h);%>>小时
	<input name = "min" type="text" value = <%out.print(m);%>>分钟
	<input name = "sec" type="text" value = <%out.print(s);%>>秒<br><br>
	设置题目分数<br><br>
<%
	int idx = 0;
	sql = "select intro, problem.pid, link.points from link, problem where link.pid = problem.pid and eid = " + eid;
	rs = Link.select(sql);
	while (rs.next()){
		idx++;
		out.println(idx + "." + rs.getString(1) + "<br>");
		out.println("<input name = \"problems\" type = \"hidden\" value = " + rs.getString(2) + ">");
		out.println("分数：" + "<input name = \"points\" type=\"text\" value = " + rs.getString(3) + ">" + "<br><br>");
	}
%>
	<input type = "submit" value = "确定">
</form>
<br><a href="#" onclick="history.back()">返回上一页</a>

</body>
</html>