<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>



<main id="detail_wrapper" role="main">
	<div id="detail_container" class="container">
		<div id="detail_top" class="flex-between">
			<img src="${cp}/img_cover/${vo.id_item}.jpg" id="cover_img">
			<div id="info_right">
				<div class="info_right_wrap">
					<a href="${cp}/category?genre=${vo.genre}">
						<span class="info_genre">${vo.genre}</span></a>
					<span class="info_genre">></span>
					<a href="${cp}/category?genre=${vo.genre}&genre_detail=${vo.genre_detail}">
						<span class="info_genre">${vo.genre_detail}</span></a>
				</div>
				<div class="info_right_wrap">
					<h3>${vo.title}</h3>
					<span id="info_org_title">${vo.org_title}</span>
				</div>
				<div class="info_right_wrap">
					<ul>
						<li>
							<a href="${cp}/header/search?keyword=${vo.author}">${vo.author}</a>
							<a href="${cp}/header/search?keyword=${vo.org_author}">${vo.org_author}</a>
							지음</li>
						<li>${vo.translator} 옮김</li>
						<li>${vo.publisher} 출판</li>
						<li>${vo.ymd} 출간</li>
					</ul>
				</div>
				<div class="info_right_wrap">
					<ul>
						<li><span style="width:100px;">가격</span> <span id="info_price">${vo.price}</span>원 </li>
						<li><span style="width:100px;">배송비</span> 한권만 사도 무료배송</li>
					</ul>
				</div>
				<form action="${cp}/order" id="order_form">
					<label for="item_count" style="width:100px;">수량</label>
					<c:choose>
						<c:when test="${vo.stock==0}">
							<span style="color:red;"> 일시품절 </span>
						</c:when>
						<c:otherwise>
							<input type="hidden" value="${vo.id_item}" name="id_item">
							<input type="number" id="item_count" name="item_count" min="1" max="${vo.stock}" value="1" required="required">
							<span> (재고수량 ${vo.stock}) </span>
							<br>
							<div class="order_btn_wrap" class="flex-between">
								<c:choose>
									<c:when test="${sessionScope.id_customer=='admin'}">
										<a href="${cp}/goodsModify?id_item=${vo.id_item}" class="order_btn_a">
										<input type="button" value="상품수정" class="order_btn"></a>
									</c:when>
									<c:otherwise>
										<input type="button" value="장바구니 담기" class="order_btn" onclick="insert_cart()">
										<a href="javascript:insert_order()">
										<input type="submit" value="바로주문" class="order_btn">
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</form>
				<div id="msg_wrap">
					<span id="cart_msg">장바구니에 담겼습니다.</span>
					<a href="${cp}/cart" id="move_cart"><i class="fas fa-shopping-cart"></i>이동</a>
				</div>
			</div>
		</div>
		<div id="detail_bottom">
			<div class="info_right_wrap">
				<h4>기본정보</h4>
				<p>ISBN: ${vo.id_item}</p>
				<p>분류:
					<a href="${cp}/category?genre=${vo.genre}">
						<span class="info_genre">${vo.genre}</span></a>
					<span class="info_genre">></span>
					<a href="${cp}/category?genre=${vo.genre}&genre_detail=${vo.genre_detail}">
						<span class="info_genre">${vo.genre_detail}</span></a></p>
			</div>
			<c:choose>
				<c:when test="${vo.id_item=='9788937434488'}">
					<img src="${cp}/img_cover/${vo.id_item}_1.jpg" id="detail_info_img">
				</c:when>
				<c:otherwise>
					<img src="${cp}/img_cover/9788970845371_1.jpg" id="detail_info_img">
				</c:otherwise>
			</c:choose>
		</div>				
	</div>	
</main>

<script type="text/javascript">
	function insert_cart() {
		if(${empty sessionScope.id_customer}) {
			alert("로그인이 필요합니다.");
		}else {
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function() {
				if(xhr.readyState==4 && xhr.status==200) {
					let data=xhr.responseText;
					let cart=JSON.parse(data);
					let msg_wrap=document.getElementById("msg_wrap");
					let span=document.getElementById("cart_msg");
					if(cart.result==false) {
						span.innerHTML="장바구니 담기 실패";
					}else {
						msg_wrap.style="display: block;"
					}
				}
			};
			let item_count=document.getElementById("item_count").value;
			let param="id=${sessionScope.id_customer}&id_item=${vo.id_item}&item_count="+item_count;
			xhr.open('post','${cp}/cart',true);
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhr.send(param);
		}	
	}
	
	function insert_order() {
		let item_count=document.getElementById("item_count").value;
	 	// let id = <%=(String)request.getSession().getAttribute("id_customer")%>;
		if(item_count==0 || item_count==null) {
			alert("수량을 입력하세요");
			return;
		}
		location.href="${cp}/order?id=${sessionScope.id_customer}&id_item=${vo.id_item}&title=${vo.title}&item_price=${vo.price}&item_count="+item_count;	
	}
</script>
