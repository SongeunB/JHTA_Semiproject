<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function eraseAll(){
		
	}
</script>
</head>
<body>
<h1 style="text-align:center;">회원정보 수정</h1>

<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/updateForm">
	아이디	<input type="text" name="id_customer" value="${sessionScope.id_customer }" readonly="readonly"><br>
	비밀번호 	<input type="password" name="pwd" ><br>
	이름 	<input type="text" name="name" value="${vo.name }"><br>
	이메일	<input type="text" name="email" ><br>
	전화번호	<input type="text" name="phone" ><br>
	주소 	<input type="text" name="address"><br>
	<input type="submit" value="수정">
	<input type="button" value="취소" onclick="eraseAll()">
	<a href="${pageContext.request.contextPath}/deleteId">회원탈퇴</a>
</form>
</div>
</body>
</html>