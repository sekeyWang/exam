<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "checklogin.jsp" method = post>
	请输入账号:<input name = "account" type="text"><BR>
	请输入密码:<input name = "password" type="password"><BR>
	<input type = "submit" value = "登录">
	<a href = "register.jsp">注册</a><br>
	学生登录<input checked = "true" name = "type" type = "radio" value = "student">
	管理员登录<input name = "type" type = "radio" value = "admin">
</form>
	
</body>
</html>