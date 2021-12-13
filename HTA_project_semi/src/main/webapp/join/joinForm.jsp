<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1>회원 가입</h1>
<form method="post" action="${pageContext.request.contextPath }/joinForm">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	이름 <input type="text" name="name"><br>
	이메일 <input type="text" name="email"><br>
	전화번호 <input type="text" name="phone"><br>
	주소 <input type="text" name="addr"><br>
	<input type="submit" value="가입">	
</form>