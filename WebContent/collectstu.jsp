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
	sql = "select eid, sname, mark, fullmark, student.sid from result, student where result.sid = student.sid order by student.sid, eid;";
	rs = Link.select(sql);
	int last = 0;
	while (rs.next()){
		int eid = rs.getInt(1);
		String sname = rs.getString(2);
		int mark = rs.getInt(3);
		int fullmark = rs.getInt(4);
		int sid = rs.getInt(5);
		if (sid != last) {
			out.println("学生：" + sname + "<br>");
			last = sid;
		}
		out.println("考试第" + eid + "套试卷，获得" + mark + "分， 满分为" + fullmark + "<br>");
		out.println();
	}
%>
<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>