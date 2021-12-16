<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align:center;">회원탈퇴</h1>

<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/deleteId">
	아이디	<input type="text" name="id_customer" value="${sessionScope.id_customer }" readonly="readonly"><br>
	비밀번호 	<input type="password" name="pwd"><br>
	<
</form>
</div>
</body>
</html>