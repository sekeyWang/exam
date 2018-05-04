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

<div id="showTimes"></div>
<%
	String sql; ResultSet rs;
	JDBCTest Link = new JDBCTest(); Link.open();	
	String fav = request.getParameter("paper");
	String id = request.getParameter("id");
	
	sql = "select * from exam where eid = " + fav;
	rs = Link.select(sql);
	rs.next();
	int t = rs.getInt(2);
  	long current_time=System.currentTimeMillis();
  	long end_time=current_time + 1000 * t;
    long time=end_time-current_time;
%>
<script>
var second = <%= time / 1000%>; // 剩余秒数
// 写一个方法，将秒数专为天数
	var toDays = function(){
 		var s = second % 60; // 秒
 		var mi = (second - s) / 60 % 60; // 分钟
 		var h =  ((second - s) / 60 - mi ) / 60 % 24; // 小时
		return "剩余：" + h + "小时" + mi + "分钟" + s + "秒";
	}
//然后写一个定时器
	window.setInterval(function(){
 		second--;
 		if (second == 0) window.location.href="exam.jsp?id=<%out.print(id);%>";
 		document.getElementById("showTimes").innerHTML = toDays ();
	}, 1000);
</script>
<%
	sql = "select intro,choice1,choice2,choice3,choice4,ptype,points from problem, link where problem.pid = link.pid and eid = " + fav;
	
	rs = Link.select(sql);
	ResultSetMetaData m=null;//获取列信息
	m=rs.getMetaData();	   
	int columns=m.getColumnCount();
	int idx = 0;
	String url = "submit.jsp?test=" + fav + "&id=" + id;
	out.println("<form action = " + url + " method = post>");
	while (rs.next()){
		out.println(++idx + ".");
		out.println(rs.getString(1) + "<br>(本题分数为:"+ rs.getString(7) +")<br>");
		int type = rs.getInt(6);
		if (type == 1){
			out.println("<input name=\"" + idx + "\" type=\"radio\" value=\"A\" />" + rs.getString(2));
			out.println("<input name=\"" + idx + "\" type=\"radio\" value=\"B\" />" + rs.getString(3));
			out.println("<input name=\"" + idx + "\" type=\"radio\" value=\"C\" />" + rs.getString(4));
			out.println("<input name=\"" + idx + "\" type=\"radio\" value=\"D\" />" + rs.getString(5));
		}
		if (type == 2){
			out.println("<input name=\"" + idx + "\" type=\"checkbox\" value=\"A\" />" + rs.getString(2));
			out.println("<input name=\"" + idx + "\" type=\"checkbox\" value=\"B\" />" + rs.getString(3));
			out.println("<input name=\"" + idx + "\" type=\"checkbox\" value=\"C\" />" + rs.getString(4));
			out.println("<input name=\"" + idx + "\" type=\"checkbox\" value=\"D\" />" + rs.getString(5));
		}
		if (type == 3){
			out.println("<input name=\"" + idx + "\" type=\"radio\" value=\"T\" />是");
			out.println("<input name=\"" + idx + "\" type=\"radio\" value=\"F\" />否");
		}
		if (type == 4){
			out.println("<input name = \"" + idx + "\" type=\"text\">");
		}
		out.print("<br>");
//		out.println(type);
//		for (int i = 1; i <= columns; i++)
//			out.println(rs.getString(i));
		out.println("<br>");
	}
	Link.close();
%>
	<input type = "submit" value = "提交"><br>
</form>
</body>
</html>