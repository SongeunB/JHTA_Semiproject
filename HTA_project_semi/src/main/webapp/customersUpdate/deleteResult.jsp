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
<c:choose>
	<c:when test="${requestScope.result=='success' }">
		<br><br>
		<div id="box" style="text-align:center; top:300px;">
		<img src="<%=request.getContextPath() %>/image/logo.png">
		<br><br><br>
		<h1 style="font-size:2em;">회원탈퇴가 완료되었습니다.</h1><br>
		<br>
				<p>이용해주셔서 감사합니다.</p>
		</div>
	</c:when>
	<c:otherwise>
		<h1>회원탈퇴 실패</h1>
	</c:otherwise>
</c:choose>
<br><br><br><br>
<div style="text-align:center;">
<a href="${pageContext.request.contextPath }/home">메인페이지로</a>
<br><br>
</div>
</body>
</html>