<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<style>
table.order_history {
 width:1000px;
  border-collapse: collapse;
  text-align: center;
  line-height: 1.5;
}
table.order_history thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
table.order_history tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.order_history td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
#img {
	width:150px;
	height:150px;
}
</style>

<script>
function orderList() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4 && xhr.status==200) {
			let orderList = document.getElementById("orderList");
			let child = orderList.childNodes; 
			for(let i = child.length-1; i >= 0; i--) { 
				let c = child.item(i);
				orderList.removeChild(c);
			}
			
			let data = xhr.responseText;
			let order = JSON.parse(data);
			let os = document.getElementById("os").value;
			
			for(let i = 0; i < order.length; i++) {
				let id_item = order[i].id_item;
				let order_date = order[i].order_date;
				let total_price = order[i].total_price;
				let item_count = order[i].item_count;
				let order_status = order[i].order_status;
				let order_num = order[i].order_num;
				let item_price = order[i].item_price;
				let title = order[i].title;
				
				let tr = document.createElement("tr");
				let td1 = document.createElement("td");
				let td2 = document.createElement("td");
				let td3 = document.createElement("td");
				let td4 = document.createElement("td");
				let td5 = document.createElement("td");
				let td6 = document.createElement("td");
				
				if(os=='b'&&order_status=='주문대기') {
					td1.innerHTML = "<img src='${cp}/img_cover/" + id_item + ".jpg' id=img>";
					td2.innerHTML = title;
					td3.innerHTML = order_date;
					td4.innerHTML = order_num;
					td5.innerHTML = item_price + " / " + item_count  + "<br>" + total_price;
					td6.innerHTML = order_status + "<br>" + "<a href='javascript:delOrder("+order_num+")'><input type='button' value='주문취소신청'></a>";
					
					orderList.appendChild(tr);
					orderList.appendChild(td1);
					orderList.appendChild(td2);
					orderList.appendChild(td3);
					orderList.appendChild(td4);
					orderList.appendChild(td5);
					orderList.appendChild(td6);
				} else if(os=='g'&&order_status=='배송완료') {
					td1.innerHTML = "<img src='${cp}/img_cover/" + id_item + ".jpg' id=img>";
					td2.innerHTML = title;
					td3.innerHTML = order_date;
					td4.innerHTML = order_num;
					td5.innerHTML = item_price + " / " + item_count  + "<br>" + total_price;
					td6.innerHTML = order_status;
					
					orderList.appendChild(tr);
					orderList.appendChild(td1);
					orderList.appendChild(td2);
					orderList.appendChild(td3);
					orderList.appendChild(td4);
					orderList.appendChild(td5);
					orderList.appendChild(td6);
				} else if(os=='j'&&order_status=='주문취소대기') {
					td1.innerHTML = "<img src='${cp}/img_cover/" + id_item + ".jpg' id=img>";
					td2.innerHTML = title;
					td3.innerHTML = order_date;
					td4.innerHTML = order_num;
					td5.innerHTML = item_price + " / " + item_count  + "<br>" + total_price;
					td6.innerHTML = order_status;
					
					orderList.appendChild(tr);
					orderList.appendChild(td1);
					orderList.appendChild(td2);
					orderList.appendChild(td3);
					orderList.appendChild(td4);
					orderList.appendChild(td5);
					orderList.appendChild(td6);
				}
			}
		}
	};
	xhr.open('post', '${cp}/orderHistory?id=${sessionScope.id_customer}', true);
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xhr.send();
}

function delOrder(order_num) {
	let xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4 && xhr.status==200) {
			let data = xhr.responseText;
			let json = JSON.parse(data);
			if(json.result=='success') {
				orderList();
			} else {
				alert("주문 취소 실패");
			}
		}
	};
	xhr.open('post', '${cp}/orderHistory/delete?order_num='+order_num, true);
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xhr.send();
}

window.onload=function() {
	orderList();
}
</script>

<table class="order_history">
	<thead>
		<tr>
			<th colspan="2">상품정보</th>
			<th>주문일자</th>
			<th>주문번호</th>
			<th>주문금액(수량)</th>
			<th><select id="os" onchange="orderList()"><option value="b">주문대기</option><option value="g">구매확정</option><option value="j">주문취소신청</option></select></th>
		</tr>
	</thead>
	<tbody id="orderList">	
		<!-- <tr>
		
			<td><img src="${cp}/img_cover/${vo.id_item }.jpg" id="img"></td>
			<td>${vo.title }</td>
			<td>${vo.order_date }</td>
			<td>${vo.order_num }</td>
			<td>${vo.item_price } / ${vo.item_count }<br>${vo.total_price }</td>
			<td>${vo.order_status }<br><input type="button" value="주문취소"></td>
		 
		</tr>-->
	</tbody>
</table>

