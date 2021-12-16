<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
<script type="text/javascript">
window.onload=function(){
	let cover=document.getElementsByClassName("img_cover");
	for(let i=0;i<cover.length;i++){
		if(cover[i].height!=180){
			cover[i].style.marginTop=(178-cover[i].height)+"px";
		}
	}
	
	let list=document.getElementsByClassName("img_search");
	for(let i = 0; i < list.length; i++){
		if(list[i].height!=180){
			list[i].style.marginTop=(180-list[i].height)+"px";
		}
	}
}
function showCategory(e){
	let cts=e.currentTarget.childNodes;
	cts[3].style.display="";
	e.currentTarget.style.backgroundColor="#f0f8ff";
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
		
		<a href="${cp}/home"><img src="<%=request.getContextPath() %>/image/logo1.png" id="logo"></a>
			<form action="${cp }/header/search">
				<div class="search_wrap">
					<input type="text" name="keyword">
					<button type="submit">검색</button>
				</div>
			</form>
			<div id="main_right">
				<img src="<%=request.getContextPath() %>/image/main_ship.png">
			</div>
			
		</div>
			
		<div id="navbar">
				<ul>
				<c:choose>
					<c:when test="${empty sessionScope.id_customer }">
						<li><a href="${cp}/loginForm">로그인</a></li>
						<li><a href="${cp}/joinForm">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><span style="color:white;">[${sessionScope.id_customer }님 반갑습니다.]</span>  <a href="${cp}/logout">로그아웃</a></li>
						<li><a href="${cp}/updateForm">정보수정</a></li>
					</c:otherwise>
				</c:choose>
					<li><a href="${cp}/cart">장바구니</a></li>
					<li><a href="${cp}/order">주문내역</a></li>
					<li><a href="${cp}/admin">관리자페이지</a></li>
				</ul>
		</div>
		
</header>
	
