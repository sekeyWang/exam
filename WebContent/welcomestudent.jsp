<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	Welcome !<%String acc = request.getParameter("id"); acc = new String(acc.getBytes("iso-8859-1"), "utf-8"); out.println(" "+ acc);%>!<br><br>
	<a href = "exam.jsp<%out.println("?id=" + acc);%>">参加考试</a><br><br><!-- 搞定 -->
	<a href = "checkresult.jsp<%out.println("?id=" + acc);%>">查看成绩</a><br><br><!-- 搞定 -->
	<a href = "modifypsw.jsp<%out.println("?id=" + acc);%>">修改密码</a><br><br><!-- 搞定 -->
	<a href = "rule.html">显示考试规则</a><br><br><!-- 搞定 -->
	<a href = "login.jsp">退出</a><br><br>
</body>
</html>