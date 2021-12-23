<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugin/spectrum.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
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
		
		<a href="${cp}/home"><img src="<%=request.getContextPath() %>/image/logo.png" id="logo"></a>
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
						<li><a href="${cp}/loginForm"><i class="fas fa-user"></i>&nbsp; 로그인</a></li>
						<li><a href="${cp}/joinForm"><i class="fas fa-users"></i>&nbsp; 회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><span style="color:white;">[${sessionScope.id_customer }님 반갑습니다.] &nbsp; </span>  <a href="${cp}/logout"><i class="fas fa-user-check"></i>&nbsp; 로그아웃</a></li>
						<li><a href="${cp}/updateForm"><i class="fas fa-pen"></i>&nbsp; 정보수정</a></li>
					</c:otherwise>
				</c:choose>
					<li><a href="${cp}/cart"><i class="fas fa-shopping-cart"></i>&nbsp; 장바구니</a></li>
					<li><a href="${cp}/order"><i class="fas fa-list"></i>&nbsp; 주문내역</a></li>
					<c:if test="${sessionScope.id_customer=='admin'}">
					<li><a href="${cp}/admin"><i class="fas fa-wrench"></i>&nbsp; 관리자페이지</a></li>
					</c:if>
				</ul>
		</div>
		
</header>
	
