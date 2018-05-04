<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "submitproblem.jsp?id=<%String id = request.getParameter("id");out.print(id);%>" method = post>
	题目描述<br><textarea name="description" style="width:200px;height:80px;"></textarea><br><br>
	题目类型:
	<input name = "type" type = radio value = 1 checked = "true">单选题
	<input name = "type" type = radio value = 2>多选题
	<input name = "type" type = radio value = 3>判断题
	<input name = "type" type = radio value = 4>填空题
	<br>选项（如果是判断题或者填空题则不用填）<br>
	A:<input type="text" name="option"><br>
	B:<input type="text" name="option"><br>
	C:<input type="text" name="option"><br>
	D:<input type="text" name="option"><br>
	正确答案(选择题为选项ABCD,判断题为T/F):<input type="text" name="answer"><br>
	<input type = "submit" value = "添加">
</form>
<br><a href="#" onclick="history.back()">返回上一页</a>
</body>
</html>