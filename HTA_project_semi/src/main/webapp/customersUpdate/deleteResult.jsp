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
		<h1 style="text-align:center;">탈퇴가 완료되었습니다.</h1><br>
	</c:when>
	<c:otherwise>
		<h1>회원탈퇴 실패</h1>
	</c:otherwise>
</c:choose>
<div style="text-align:center;">
<a href="${pageContext.request.contextPath }/home">메인페이지로</a>
</div>
</body>
</html>