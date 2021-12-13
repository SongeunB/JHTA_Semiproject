<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<main id="detail_wrapper" role="main">
	<div id="detail_container" class="container">
		<div id="detail_top" class="flex-between">
			<img src="${cp}/img_cover/9788972756231.jpg" id="cover_img">
			<div id="info_right">
				<div class="info_right_wrap">
					<a href="${cp}"><span class="info_genre">${vo.genre}</span></a>
					<span class="info_genre">></span>
					<a href="${cp}"><span class="info_genre">${vo.genre_detail}</span></a>
				</div>
				<div class="info_right_wrap">
					<h3>${vo.title}</h3>
					<span>${vo.org_title}</span>
				</div>
				<div class="info_right_wrap">
					<ul>
						<li>
							<a href="${cp}">${vo.author}</a>
							<a href="${cp}">${vo.org_author}</a>
							지음</li>
						<li>
							<a href="${cp}">${vo.translator}</a>
							옮김</li>
						<li>
							<a href="${cp}">${vo.publisher}</a>
							출판</li>
						<li>${vo.ymd} 출간</li>
					</ul>
				</div>
				<div class="info_right_wrap">
					<ul>
						<li><span>가격</span> <span id="info_price">${vo.price}</span>원 </li>
						<li><span>배송비</span> 한권만 사도 무료배송</li>
					</ul>
				</div>
				<div id="order_btn_wrap">
					<input type="button" value="장바구니 담기" class="order_btn">
					<input type="button" value="바로주문" class="order_btn">
				</div>
			</div>
		</div>
		<div id="detail_bottom">
			<div class="info_right_wrap">
				<h4>기본정보</h4>
				<p>ISBN: ${vo.id_item}</p>
				<p>분류:
					<a href="${cp}"><span class="info_genre">${vo.genre}</span></a>
					<span class="info_genre">></span>
					<a href="${cp}"><span class="info_genre">${vo.genre_detail}</span></a></p>
			</div>
			<img src="${cp}/image/detail_sample1.jpg" id="detail_info_img">
		</div>
		
								
	</div>	
</main>
