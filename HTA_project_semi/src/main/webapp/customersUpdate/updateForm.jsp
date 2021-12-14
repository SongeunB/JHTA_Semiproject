<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/updateForm">
	회원 아이디<br>
	<input type="text" name="id" value="${vo.id }" readonly="readonly"><br>
	비밀번호<br>
	<input type="password" name="pwd" value="${vo.pwd }"><br>
	이름<br>
	<input type="text" name="name" value="${vo.name }"><br>
	이메일<br>
	<input type="text" name="email" value="${vo.email }"><br>
	전화번호<br>
	<input type="text" name="phone" value="${vo.phone }"><br>
	주소<br>
	<input type="text" name="address" value="${vo.address }"><br>
	<input type="submit" value="저장">
</form>
</body>
</html>