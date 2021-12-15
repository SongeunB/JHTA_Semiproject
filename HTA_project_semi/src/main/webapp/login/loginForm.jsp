<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1 style="text-align:center;">로그인</h1>
<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/loginForm">
	아이디 <input type="text" name="id_customer"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div>${requestScope.errMsg }</div>
	<input type="submit" value="로그인"><br>	
</form>
	<input type="button" value="아이디찾기">
	<input type="button" value="비밀번호찾기">
</div>