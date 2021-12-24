<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>



<main class="sales_wrapper" role="main">
			
	<div id="salesM_container" class="sales_container flex-between">
				
		<div class="main_nav">
			<div class="main-category">
				<h3>매출조회</h3>
				<ul class="main-category-lists">
					<li><a href="${cp}/searchD">일자별 조회</a></li>
					<li><a href="${cp}/searchM">월별 조회</a></li>
					<li><a href="${cp}/searchR">기간별 조회</a></li>
					<li><a href="${cp}/searchB" style="border-bottom:1px solid black;">상품별 월누적 매출</a></li>
				</ul>
			</div>
		</div>
		<div class="main_wrap">
			<h3>매출조회 - 상품별 월누적 매출</h3>
			<table id="salesB_table">
				<tr>
					<th colspan="7">
						<select id="year" size="1"></select>	
						<select id="month" size="1"></select>
						<input type="button" value="조회" onclick=selectDate()>
					</th>
				</tr>
				<tr>
					<th style="width:50px;">&nbsp;&nbsp;</th>
					<th style="width:250px;">상품코드</th>
					<th style="width:250px;">상품명</th>
					<th style="width:90px;">단가</th>
					<th style="width:70px;">수량</th>
					<th style="width:100px;">매출액</th>
				</tr>
			</table>
		</div>
	</div>
</main>

<script type="text/javascript">
var today = new Date(); 
var year=document.getElementById("year");
var month=document.getElementById("month");

window.onload=function() {
	for(let i=2000; i<=today.getFullYear(); i++) {
    	let opt=document.createElement("option");
		opt.value=i-2000;
		if(i==today.getFullYear()) { opt.selected=true; }
		opt.text=i;
		year.add(opt);
	}
    
	for(let i=1; i<=12; i++) {
		let opt=document.createElement("option");
		opt.value=i;
		if(i<10) { opt.value="0"+i; }
		if(i==today.getMonth()+1) { opt.selected=true; }
		opt.text=i;
		if(i<10) { opt.text="0"+i; }
		month.add(opt);
	}
}

let table=document.getElementById("salesB_table");
function selectDate() {
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function() {
		if(xhr.readyState==4 && xhr.status==200) {
			let trs=table.childNodes;
			if(trs.length>1) {
				for(let i=trs.length-1; i>1; i--) {
					table.removeChild(trs.item(i));
				}
			}
			
			let data=xhr.responseText;
			let list=JSON.parse(data);
			let totalP=0;
			for(let i=0;i<list.length;i++) {
				let tr=document.createElement("tr");
				tr.innerHTML="<td>"+(i+1)+"</td>"+
							"<td>"+list[i].id_item+"</td>"+
							"<td>"+list[i].title+"</td>"+
							"<td>"+list[i].item_price+"</td>"+
							"<td>"+list[i].item_count+"</td>"+
							"<td>"+list[i].total_price+"</td>";
				table.appendChild(tr);
			}
		}
	};
	let param="sYear="+year.value+"&sMonth="+month.value;
	xhr.open('post','${cp}/searchB',true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send(param);
}

</script>