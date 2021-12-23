<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
<div id="container">
			<div class="contents">
<c:choose>
	<c:when test="${requestScope.result=='success' }">
		<div id="imgbox" style="text-align:center; width:80%; height:">
		<img src="<%=request.getContextPath() %>/image/logo1.png">
		</div>
		<h1 style="text-align:center;">환영합니다!</h1><br>
		<div id="wrapper" style="background-color:grey;">
		<br>
		<p style="text-align:center">아이디 : ${id_customer } </p> <br>
		<p style="text-align:center">이름 : ${name } </p> <br>
		<p style="text-align:center">이메일 : ${email } </p> <br>
		</div>
	</c:when>
	<c:otherwise>
		<h1>회원가입 실패</h1>
	</c:otherwise>
</c:choose>
			</div>
</div>
<div style="text-align:center;">
<a href="${pageContext.request.contextPath }/loginForm">로그인</a> | <a href="${pageContext.request.contextPath }/home">메인페이지로</a>
</div>
</body>
</html>