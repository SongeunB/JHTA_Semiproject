<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<main id="admin_wrapper" role="main">
	<div id="admin_container" class="container">
		<div id="admin_top" class="admin_wrap flex-center">
			<a href="${cp}/goodsUp" class="admin_box">
				<img src="${cp}/image/icons8-books.png" class="admin_icon"/>
				<span>도서등록</span>
			</a>
			<a href="button" onclick="${cp}/OrderManage" class="admin_box">
				<img src="${cp}/image/icons8-order.png" class="admin_icon"/>
				<span>주문관리</span>
			</a>
		</div>
		<div id="admin_bottom" class="admin_wrap flex-center">
			<a href="${cp}/searchD" class="admin_box">
				<img src="${cp}/image/icons8-sales.png" class="admin_icon"/>
				<span>매출관리</span>
			</a>
			<a href="${cp}/banner" class="admin_box">
				<img src="${cp}/image/icons8-banner.png" class="admin_icon"/>
				<span>배너관리</span>
			</a>
		</div>
	</div>
</main>