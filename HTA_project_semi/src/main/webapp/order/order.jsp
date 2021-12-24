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

function good() {
	alert("주문이 확인되었습니다.");
}
</script>

<form action="${cp }/order" method="post" id="order_form">
	<h3>수령자 정보 &nbsp<input type="checkbox" id="chk" onclick="check()"></h3>
	<table>
			<tr>
				<th>수령인</th>
				<td><input type="text" name="name_order" value="${cVo.name }" readonly class="read"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone_order" value="${cVo.phone }" readonly class="read"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email_order" value="${cVo.email }" readonly class="read"></td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td><input type="text" name="address_order" value="${cVo.address }" readonly style="width: 500px" class="read"></td>
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
		<tr>
			<td><img src="${cp}/img_cover/<%=request.getParameter("id_item") %>.jpg"></td>
			<td><%=request.getParameter("title") %></td>
			<td><%=request.getParameter("item_count") %></td>
			<td><%=Integer.parseInt(request.getParameter("item_count")) * Integer.parseInt(request.getParameter("item_price"))%></td>
		</tr>
	</table>
	<input type="hidden" name="id_item" value="<%=request.getParameter("id_item")%>">
	<input type="hidden" name="item_price" value="<%=request.getParameter("item_price")%>">
	<input type="hidden" name="item_count" value="<%=request.getParameter("item_count")%>">
	<input type="submit" value="주문하기"  onclick="good()">
</form>