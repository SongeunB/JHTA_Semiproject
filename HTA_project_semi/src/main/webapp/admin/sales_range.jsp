<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>



<main class="sales_wrapper" role="main">
			
	<div id="salesD_container" class="sales_container flex-between">
				
		<div class="main_nav">
			<div class="main-category">
				<h3>매출조회</h3>
				<ul class="main-category-lists">
					<li><a href="${cp}/searchD">일자별 조회</a></li>
					<li><a href="${cp}/searchM">월별 조회</a></li>
					<li><a href="${cp}/searchR" style="border-bottom:1px solid black;">기간별 조회</a></li>
					<li><a href="${cp}/searchB">상품별 월누적 매출</a></li>
				</ul>
			</div>
		</div>
		<div class="main_wrap">
			<h3>매출조회 - 기간별 상세조회</h3>
			<table id="salesR_table">
				<tr>
					<th colspan="7">
						<select id="year1" size="1"></select>	
						<select id="month1" size="1"></select>	
						<select id="date1" size="1"></select>
						<span>&nbsp;~&nbsp;</span>
						<select id="year2" size="1"></select>	
						<select id="month2" size="1"></select>	
						<select id="date2" size="1"></select>
						<input type="button" value="조회" onclick=selectDate()>
						<span id="err_msg"></span>
					</th>
				</tr>
				<tr>
					<th style="width:50px;">&nbsp;&nbsp;</th>
					<th style="width:270px;">일자</th>
					<th style="width:200px;">총 판매수량</th>
					<th style="width:230px;">매출액</th>
				</tr>
			</table>
		</div>
	</div>
</main>

<script type="text/javascript">
	var today = new Date(); 
	var year1=document.getElementById("year1");
	var month1=document.getElementById("month1");
	var date1=document.getElementById("date1");
	var year2=document.getElementById("year2");
	var month2=document.getElementById("month2");
	var date2=document.getElementById("date2");
	
	window.onload=function() {
		for(let i=2000; i<=today.getFullYear(); i++) {
		   	let opt1=document.createElement("option");
			opt1.value=i-2000;
			if(i==today.getFullYear()) { opt1.selected=true; }
			opt1.text=i;
			year1.add(opt1);
			let opt2=document.createElement("option");
			opt2.value=i-2000;
			if(i==today.getFullYear()) { opt2.selected=true; }
			opt2.text=i;
			year2.add(opt2);
		}
		    
		for(let i=1; i<=12; i++) {
			let opt1=document.createElement("option");
			opt1.value=i;
			if(i<10) { opt1.value="0"+i; }
			if(i==today.getMonth()+1) { opt1.selected=true; }
			opt1.text=i;
			if(i<10) { opt1.text="0"+i; }
			month1.add(opt1);
			let opt2=document.createElement("option");
			opt2.value=i;
			if(i<10) { opt2.value="0"+i; }
			if(i==today.getMonth()+1) { opt2.selected=true; }
			opt2.text=i;
			if(i<10) { opt2.text="0"+i; }
			month2.add(opt2);
		}
			
		for(let i=1; i<=31; i++){
			let opt1=document.createElement("option");
			opt1.value=i;
			if(i<10) { opt1.value="0"+i; }
			if(i==today.getDate()) { opt1.selected=true; }
			opt1.text=i;
			if(i<10) { opt1.text="0"+i; }
			date1.add(opt1);
			let opt2=document.createElement("option");
			opt2.value=i;
			if(i<10) { opt2.value="0"+i; }
			if(i==today.getDate()) { opt2.selected=true; }
			opt2.text=i;
			if(i<10) { opt2.text="0"+i; }
			date2.add(opt2);
		}
	}
    
	let table=document.getElementById("salesR_table");
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
				if(list.err_msg==null) {
					for(let i=0;i<list.length;i++) {
						let tr=document.createElement("tr");
						tr.innerHTML="<td>"+(i+1)+"</td>"+
									"<td>"+list[i].order_date+"</td>"+
									"<td>"+list[i].item_count+"</td>"+
									"<td>"+list[i].total_price+"</td>";
						table.appendChild(tr);
						totalP=parseInt(totalP)+parseInt(list[i].total_price);
					}
					let tr=document.createElement("tr");
					tr.innerHTML="<th colspan='7'> 해당기간 매출총액 "+totalP+" 원 </th>";
					table.appendChild(tr);
				}else {
					let err_msg=document.getElementById("err_msg");
					err_msg.innerHTML=list.err_msg;
				}
				
			}
		};
		let param="sYear1="+year1.value+"&sMonth1="+month1.value+"&sDate1="+date1.value+
					"&sYear2="+year2.value+"&sMonth2="+month2.value+"&sDate2="+date2.value;
		xhr.open('post','${cp}/searchR',true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}

</script>