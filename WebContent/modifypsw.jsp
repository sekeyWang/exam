<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "updatepsw.jsp?id=<%String acc = request.getParameter("id");out.println(acc);%>" method = post>
	请输入新的密码<br>
	<input name = "password" type="password"><BR>
	<input type = "submit" value = "确定">
</form>

<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>