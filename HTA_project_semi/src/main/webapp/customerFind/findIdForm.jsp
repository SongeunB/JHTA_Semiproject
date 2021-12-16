<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align:center;">아이디 찾기</h1>

<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/findId">
	이름 	<input type="text" name="name" ><br>
	이메일	<input type="text" name="email"><br>
	<div>${requestScope.findResult }</div>
	<input type="submit" value="찾기"><input type="button" value="취소" onclick="eraseAll()">
</form>
</div>
</body>
</html>