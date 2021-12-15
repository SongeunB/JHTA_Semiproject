<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<main id="cart_wrapper" role="main">
	<div id="cart_container" class="container">
		<h1>장바구니</h1>
		<div id="cart_list_wrap">
			<p>고객 아이디  ${id_customer}</p>
			<c:forEach var="vo" items="${list}">
				<div class="cart_list flex-between">
					<img src="${cp}/img_cover/${vo.id_item}.jpg" class="img_cover"><br>
					<div class="cart_list_right">
						<p>
							책제목: ${vo.title} &nbsp;&nbsp;
							가격: ${vo.price} &nbsp;&nbsp;
							수량: ${vo.item_count}  
						</p>
					</div>
				</div>
			</c:forEach>
		</div>	
	</div>
</main>
