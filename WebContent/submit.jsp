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
	String test = request.getParameter("test");
	JDBCTest Link = new JDBCTest();
	Link.open();
	
	String sql = "select answer, points from problem, link where problem.pid = link.pid and eid = " + test;
	ResultSet rs = Link.select(sql);
	int idx = 0, mark = 0, totalmark = 0;
	while (rs.next()){
		idx++;
		String corans = rs.getString(1);
//		out.println(corans);
		String[] answer = request.getParameterValues(String.valueOf(idx));
		if (answer.length > 1){
			for (int i = 1; i < answer.length; i++) answer[0] += answer[i];
		}
//		out.println(" "+ answer[0] + "<br>");
		if (answer[0].equals(corans)) {
//			out.println("yes<br>");
			mark += rs.getInt(2);
		}
//		else out.println("no<br>");
		totalmark += rs.getInt(2);
	}
	out.println("您本次考试的分数是:" + mark + "/" + totalmark);
	sql = "select sid from student where sname = '" + id + "';";
	System.out.println(sql);
	rs = Link.select(sql);
	rs.next();
	int sid = rs.getInt(1);
	
	sql = "select rid from result order by rid desc limit 1;";
	rs = Link.select(sql);
	rs.next();
	int rid = rs.getInt(1) + 1;

	sql = "insert into result values(" + test +", " + sid + ", " + rid + ", " + mark + ", "+totalmark + ")"; 
	System.out.println(sql);
	Link.insert(sql);
//	for (int i = 0; i < answer.length; i++) out.println(answer[i]);
	Link.close();
%>
<br><a href="welcomestudent.jsp?id=<%out.println(id);%>">返回首页</a>
</body>
</html>