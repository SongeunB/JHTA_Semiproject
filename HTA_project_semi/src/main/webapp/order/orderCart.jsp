<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<script>
function check() {
	let chk = document.getElementById("chk");
	let read = document.getElementsByClassName("read");
	if(chk.checked==true) {
		for(let i = 0; i < read.length; i++) {
			read[i].readOnly = false;	
		}
	} else {
		for(let i = 0; i < read.length; i++) {
			read[i].readOnly = true;	
		}
	}
}
window.onload=function() {
	let a = document.getElementById("order_form");
	let r = document.getElementsByClassName("read");
	for(let i = 0; i < r.length; i++) {
		r[i].style.border = "0";	
	}
	a.style.marginTop = 20+"px";
	a.style.marginLeft = 	a.scrollWidth - (a.scrollWidth/1.5)+"px";
}

function insert_order() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4 && xhr.status==200) {
			let data = xhr.responseText;
			let json = JSON.parse(data);
			if(json.code=='success') {
				alert("주문이 완료되었습니다.");
			} else {
				alert("주문 실패");
			}
		}
	};
	let name_order = document.getElementById("name_order").value;
	let phone_order = document.getElementById("phone_order").value;
	let email_order = document.getElementById("email_order").value;
	let address_order = document.getElementById("address_order").value;
	
	let it = document.getElementsByName("id_item");	
	let ic = document.getElementsByName("item_count");	
	let ip = document.getElementsByName("item_price");	
	let id_item = [];
	let item_count = [];
	let item_price = [];
	for(let i = 0; i < it.length; i++) {
		id_item[i] += it[i].value;
		item_count[i] += ic[i].value; 
		item_price[i]+= ip[i].value;
	}
	//let id_item = document.getElementById("id_item").value;
	//let item_count = document.getElementById("item_count").value;
	//let item_price = document.getElementById("item_price").value;
	
	let param = "name_order=" + name_order + "&phone_order=" + phone_order + "&email_order=" + email_order +
							"&address_order=" + address_order + "&id_item=" + id_item + "&item_count=" + item_count + "&item_price=" + item_price; 
	xhr.open('post', '${cp}/order/cart/insert', true);
	// post 방식으로 보낼 경우는 아래와 같은 설정을 해줘야한다.
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xhr.send(param);
}

</script>

<form action="${cp }/order/cart" method="post" id="order_form">
	<h3>수령자 정보 &nbsp<input type="checkbox" id="chk" onclick="check()"></h3>
	<table>
			<tr>
				<th>수령인</th>
				<td><input type="text" id="name_order" value="${cVo.name }" readonly class="read"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="phone_order" value="${cVo.phone }" readonly class="read"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email_order" value="${cVo.email }" readonly class="read"></td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td><input type="text" id="address_order" value="${cVo.address }" readonly style="width: 500px" class="read"></td>
			</tr>
	</table>
	<br>
	<h3>상품 정보</h3>
	<table>
		<tr>
			<th>상품 정보</th>
			<th>제목</th>
			<th>수량</th>
			<th>주문금액</th>
		</tr>
		<c:forEach  var="vo" items="${list }">
		<tr>
			<td><img src="${cp}/img_cover/${vo.id_item }.jpg"></td>
			<td>${vo.title }</td>
			<td>${vo.item_count }</td>
			<td>${vo.item_count*vo.price }</td>
		</tr>
		<input type="hidden" id="id_item" name="id_item" value="${vo.id_item }">
		<input type="hidden" id="item_price" name="item_price" value="${vo.price }">
		<input type="hidden" id="item_count" name="item_count" value="${vo.item_count }">
		</c:forEach>
	</table>
</form>
<input type="submit" value="주문하기" onclick="insert_order()">
