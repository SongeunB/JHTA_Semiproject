<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1 style="text-align:center;">로그인</h1>
<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/loginForm">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<input type="submit" value="로그인">	
</form>
</div>