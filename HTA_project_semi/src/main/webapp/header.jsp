<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>3조문고</title>
</head>
<body>

<header id="main-header">
		<div class="search_area">
		
		<img  src="image/logo1.png">
		
			<div class="search_wrap">
				<input type="text">
				<button type="button"></button>
			</div>
			
			<div id="main_right">
			<div id="account">
				<!-- <p>네이버를 더 안전하고 편안하게 이용하세요</p> -->
				<a href="#">로그인</a>
				<!-- 
				<div class="account_sub">
					<div class="left">
						<span>아이디</span>
						<span>비밀번호 찾기</span>
					</div>
					<span>회원가입</span>
				</div>
				 -->
			</div>
			</div>
			
		</div>
			
		<div id="navbar">
				<ul>
					<li><a href="${pageContext.request.contextPath }/loginForm">회원가입</a></li>
					<li><a href="${pageContext.request.contextPath }/cart">장바구니</a></li>
					<li><a href="${pageContext.request.contextPath }/order">주문내역</a></li>
					<li><a href="${pageContext.request.contextPath }/admin">관리자페이지</a></li>
				</ul>
		</div>
		
</header>
	
