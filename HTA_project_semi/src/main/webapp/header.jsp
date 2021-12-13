<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function showCategory(e){
	let cts=e.currentTarget.childNodes;
	cts[3].style.display="";
	e.currentTarget.style.backgroundColor="#f0f8ff";
	e.currentTarget.addEventListener('mouseout',removeCategory);
}
function removeCategory(e){
	let cts=e.currentTarget.childNodes;
	cts[3].style.display="none";
	e.currentTarget.style.backgroundColor="#ffffff";
}
</script>
<title>3조문고</title>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<header id="main-header">
		<div class="search_area">
		
		<img src="image/logo1.png" id="logo">
		
			<div class="search_wrap">
				<input type="text">
				<button type="button"></button>
			</div>
			
			<div id="main_right">
				<a href="${cp}/home"><img src="image/main_ship.png"></a>
			</div>
			
		</div>
			
		<div id="navbar">
				<ul>
					<li><a href="${cp}/loginForm">로그인</a></li>
					<li><a href="${cp}/joinForm">회원가입</a></li>
					<li><a href="${cp}/cart">장바구니</a></li>
					<li><a href="${cp}/order">주문내역</a></li>
					<li><a href="${cp}/admin">관리자페이지</a></li>
				</ul>
		</div>
		
</header>
	
