<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<main id="orderManage-main" role="main" style="overflow: unset;">
	<div class="audio-container audio-flex-between" style="align-items: normal;">
		<div class="orderManage-left">
			<div id="menu-visual"><h2>ORDER</h2>
			<div class="orderManage-menu" value="1" onclick="menuClick(event)">주문접수</div>
			<div class="orderManage-menu" value="2" onclick="menuClick(event)">환불,취소</div>
			<!--<div class="orderManage-menu" value="3" onclick="menuClick(event)">검색</div> -->
			</div>
		</div>
		<div class="orderManage-right">
			<div id="area1">
				<h1>대기 중 
					<span>
						<!--<button class="miniButton" onclick='searchOrder()'><i class="fas fa-search"></i></button>  -->
						<button class="miniButton" onclick='reloadTable("area1_table1","주문대기")'><i class="fas fa-sync"></i></button>
					</span>
				</h1>
				<table class="data-head">
					<tr>
						<th style="width: 50px;"><input type="checkbox" value="area1_table1_ck" onclick="check10(this)"></th>
						<th style="width:70px;">번호</th>
						<th style="width:130px;">계정</th>
						<th style="width:120px;">이름</th>
						<th style="width:140px;">총금액</th>
						<th>날짜</th>
					</tr>
				</table>
				<div class="table-wrap">
				<table class="data-body" id="area1_table1">
					<c:forEach var="vo" items="${area1_table1_list}" varStatus="status">
					<tr class="real-row" onclick="showData(this, event)">
						<td style="width: 50px;"><input type="checkbox" value="${vo.order_num}" onclick="checkBox(this)" class="area1_table1_ck"></td>
						<td style="width:70px;">${vo.order_num}</td>
						<td style="width:130px;">${vo.id_customer}</td>
						<td style="width:120px;">${vo.name_order}</td>
						<td style="width:140px;">${vo.total_price}</td>
						<td>${vo.order_date}</td>
					</tr>
					<tr class="hide-data">
						<td colspan="6">
							<table class="inner-table">
								<tr>
									<td>전화번호</td><td colspan="3">${vo.phone_order}</td>
								</tr>
								<tr>
									<td>이메일</td><td colspan="3">${vo.email_order}</td>
								</tr>
								<tr>
									<td>주소</td><td colspan="3">${fn:split(vo.address_order,'@')[1]}</td>
								</tr>
								<tr>
									<td>우편번호</td><td colspan="3">${fn:split(vo.address_order,'@')[0]}</td>
								</tr>
								<tr class="rowDummy">
									<td rowspan="3" style="width:130px;"><img src="${cp}/img_cover/dummy.jpg" class="data-img"></td>
									<td style="width: 250px;font-size: 12px;" class="isbn">isbn empty</td>
									<td rowspan="3" class="cnt">cnt</td>
									<td rowspan="3" class="price">price</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="title">title empty</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="author">author empty</td>
								</tr>
							</table>
						</td>
					</tr>
					<c:set var="area1_table1_list_end" value="${status.count}"/>
					</c:forEach>
					<c:if test="${area1_table1_list_end ne 10}">
						<c:forEach var="i" begin="0" end="${9-area1_table1_list_end}">
						<tr>
						</tr>
						</c:forEach>
					</c:if>
				</table>
				</div>
				<div class="page-controller">
					<div class="page" id="area1_table1_page">
						<i class="fas fa-caret-left" style="width:16px; cursor:pointer;" onclick="sideButton('area1_table1',-1,0)"></i>
						<div value="1@1@1" style="background:white; color:#49689b;" onclick="movePage(this)">1</div>
						<input type="hidden" value="${area1_table1_pageCount}">
						<c:forEach	var="i" begin="2" end="5">
							<c:choose>
								<c:when test="${i<=area1_table1_pageCount}">
								<div value="${i}@1@1" onclick="movePage(this)">${i}</div>
								</c:when>
								<c:otherwise>
								<div value="${i}@1@1" onclick="movePage(this)" style="display: none;">${i}</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<i class="fas fa-caret-right" style="width:16px; cursor:pointer;" onclick="sideButton('area1_table1',1,0)"></i>
					</div>
					<span class="rowCount">총 <span id="area1_table1_totalCnt">${area1_table1_count}</span>건 | 선택 <span id="area1_table1_choiceCnt">0</span>건</span>
				</div>
				<div class="button-wrap">
					<button type="button" class="bigButton" style="margin-bottom:40px;" onclick="exeUpdate(1,'배송중')"><i class="fas fa-check"></i>&nbsp;접수</button>
					<button type="button" class="bigButton" style="margin-bottom:40px;" onclick="exeUpdate(2,'주문취소')"><i class="fas fa-ban"></i>&nbsp;취소</button>
				</div>
				<h1>배송 중 
					<span>
						<!--<button class="miniButton" onclick='searchOrder()'><i class="fas fa-search"></i></button> 
						<button class="miniButton" onclick='reloadTable("area1_table1","주문대기")'><i class="fas fa-sync"></i></button>-->
					</span>
				</h1>
				<table class="data-head">
					<tr>
						<th style="width: 50px;"><input type="checkbox" value="area1_table2_ck" onclick="check10(this)"></th>
						<th style="width:70px;">번호</th>
						<th style="width:130px;">계정</th>
						<th style="width:120px;">이름</th>
						<th style="width:140px;">총금액</th>
						<th>날짜</th>
					</tr>
				</table>
				<div class="table-wrap">
				<table class="data-body" id="area1_table2">
					<c:forEach var="vo" items="${area1_table2_list}" varStatus="status">
					<tr class="real-row" onclick="showData(this, event)">
						<td style="width: 50px;"><input type="checkbox" value="${vo.order_num}" onclick="checkBox(this)" class="area1_table2_ck"></td>
						<td style="width:70px;">${vo.order_num}</td>
						<td style="width:130px;">${vo.id_customer}</td>
						<td style="width:120px;">${vo.name_order}</td>
						<td style="width:140px;">${vo.total_price}</td>
						<td>${vo.order_date}</td>
					</tr>
					<tr class="hide-data">
						<td colspan="6">
							<table class="inner-table">
								<tr>
									<td>전화번호</td><td colspan="3">${vo.phone_order}</td>
								</tr>
								<tr>
									<td>이메일</td><td colspan="3">${vo.email_order}</td>
								</tr>
								<tr>
									<td>주소</td><td colspan="3">${fn:split(vo.address_order,'@')[1]}</td>
								</tr>
								<tr>
									<td>우편번호</td><td colspan="3">${fn:split(vo.address_order,'@')[0]}</td>
								</tr>
								<tr class="rowDummy">
									<td rowspan="3" style="width:130px;"><img src="${cp}/img_cover/dummy.jpg" class="data-img"></td>
									<td style="width: 250px;font-size: 12px;" class="isbn">isbn empty</td>
									<td rowspan="3" class="cnt">cnt</td>
									<td rowspan="3" class="price">price</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="title">title empty</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="author">author empty</td>
								</tr>
							</table>
						</td>
					</tr>
					<c:set var="area1_table2_list_end" value="${status.count}"/>
					</c:forEach>
					<c:if test="${area1_table2_list_end ne 10}">
						<c:forEach var="i" begin="0" end="${9-area1_table2_list_end}">
						<tr>
						</tr>
						</c:forEach>
					</c:if>
				</table>
				</div>
				<div class="page-controller">
					<div class="page" id="area1_table2_page">
						<i class="fas fa-caret-left" style="width:16px; cursor:pointer;" onclick="sideButton('area1_table2',-1,1)"></i>
						<div value="1@1@2" style="background:white; color:#49689b;" onclick="movePage(this)">1</div>
						<input type="hidden" value="${area1_table2_pageCount}">
						<c:forEach	var="i" begin="2" end="5">
							<c:choose>
								<c:when test="${i<=area1_table2_pageCount}">
								<div value="${i}@1@2" onclick="movePage(this)">${i}</div>
								</c:when>
								<c:otherwise>
								<div value="${i}@1@2" onclick="movePage(this)" style="display: none;">${i}</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<i class="fas fa-caret-right" style="width:16px; cursor:pointer;" onclick="sideButton('area1_table2',1,1)"></i>
					</div>
					<span class="rowCount">총 <span id="area1_table2_totalCnt">${area1_table2_count}</span>건 | 선택 <span id="area1_table2_choiceCnt">0</span>건</span>
				</div>
				<div class="button-wrap">
					<button type="button" class="bigButton" style="margin-bottom:40px;" onclick="exeUpdate(3,'배송완료')">배송완료</button>
				</div>
			</div>
			<div id="area2" style="display: none;">
				<h1>취소 접수 
					<span>
						<!--<button class="miniButton" onclick='searchOrder()'><i class="fas fa-search"></i></button> -->
						<button class="miniButton" onclick='reloadTable("area2_table3","취소신청")'><i class="fas fa-sync"></i></button>
					</span>
				</h1>
				<table class="data-head">
					<tr>
						<th style="width: 50px;"><input type="checkbox" value="area2_table3_ck" onclick="check10(this)"></th>
						<th style="width:70px;">번호</th>
						<th style="width:130px;">계정</th>
						<th style="width:120px;">이름</th>
						<th style="width:140px;">총금액</th>
						<th>날짜</th>
					</tr>
				</table>
				<div class="table-wrap">
				<table class="data-body" id="area2_table3">
					<c:forEach var="vo" items="${area2_table3_list}" varStatus="status">
					<tr class="real-row" onclick="showData(this, event)">
						<td style="width: 50px;"><input type="checkbox" value="${vo.order_num}" onclick="checkBox(this)" class="area2_table3_ck"></td>
						<td style="width:70px;">${vo.order_num}</td>
						<td style="width:130px;">${vo.id_customer}</td>
						<td style="width:120px;">${vo.name_order}</td>
						<td style="width:140px;">${vo.total_price}</td>
						<td>${vo.order_date}</td>
					</tr>
					<tr class="hide-data">
						<td colspan="6">
							<table class="inner-table">
								<tr>
									<td>전화번호</td><td colspan="3">${vo.phone_order}</td>
								</tr>
								<tr>
									<td>이메일</td><td colspan="3">${vo.email_order}</td>
								</tr>
								<tr>
									<td>주소</td><td colspan="3">${fn:split(vo.address_order,'@')[1]}</td>
								</tr>
								<tr>
									<td>우편번호</td><td colspan="3">${fn:split(vo.address_order,'@')[0]}</td>
								</tr>
								<tr class="rowDummy">
									<td rowspan="3" style="width:130px;"><img src="${cp}/img_cover/dummy.jpg" class="data-img"></td>
									<td style="width: 250px;font-size: 12px;" class="isbn">isbn empty</td>
									<td rowspan="3" class="cnt">cnt</td>
									<td rowspan="3" class="price">price</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="title">title empty</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="author">author empty</td>
								</tr>
							</table>
						</td>
					</tr>
					<c:set var="area2_table3_list_end" value="${status.count}"/>
					</c:forEach>
					<c:if test="${area2_table3_list_end ne 10}">
						<c:forEach var="i" begin="0" end="${9-area2_table3_list_end}">
						<tr>
						</tr>
						</c:forEach>
					</c:if>
				</table>
				</div>
				<div class="page-controller">
					<div class="page" id="area2_table3_page">
						<i class="fas fa-caret-left" style="width:16px; cursor:pointer;" onclick="sideButton('area2_table3',-1,2)"></i>
						<div value="1@2@3" style="background:white; color:#49689b;" onclick="movePage(this)">1</div>
						<input type="hidden" value="${area2_table3_pageCount}">
						<c:forEach	var="i" begin="2" end="5">
							<c:choose>
								<c:when test="${i<=area2_table3_pageCount}">
								<div value="${i}@2@3" onclick="movePage(this)">${i}</div>
								</c:when>
								<c:otherwise>
								<div value="${i}@2@3" onclick="movePage(this)" style="display: none;">${i}</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<i class="fas fa-caret-right" style="width:16px; cursor:pointer;" onclick="sideButton('area2_table3',1,2)"></i>
					</div>
					<span class="rowCount">총 <span id="area2_table3_totalCnt">${area2_table3_count}</span>건 | 선택 <span id="area2_table3_choiceCnt">0</span>건</span>
				</div>
				<div class="button-wrap">
					<button type="button" class="bigButton" style="margin-bottom:40px;" onclick="exeUpdate(4,'주문취소')">처리완료</button>
				</div>
			</div>
			<div id="area_dummy" style="display: none;">
			<table class="data-body" id="dummy_table1">
					<tr class="real-row" onclick="showData(this, event)">
						<td style="width: 50px;"><input type="checkbox" value="61" onclick="checkBox(this)" class="dummy_ck"></td>
						<td style="width:70px;">61</td>
						<td style="width:130px;">user1</td>
						<td style="width:120px;">홍길동1</td>
						<td style="width:140px;">11000</td>
						<td>2021-12-22</td>
					</tr>
					<tr class="hide-data">
						<td colspan="6">
							<table class="inner-table">
								<tr>
									<td>전화번호</td><td colspan="3" class="phone">010-1234-1234</td>
								</tr>
								<tr>
									<td>이메일</td><td colspan="3" class="email">user1@gmail.com</td>
								</tr>
								<tr>
									<td>주소</td><td colspan="3" class="address">서울시 마포구 백범로 71 숨도빌딩 1층</td>
								</tr>
								<tr>
									<td>우편번호</td><td colspan="3" class="address">12345</td>
								</tr>
								<tr class="rowDummy">
									<td rowspan="3" style="width:130px;"><img src="/test_semi_test/img_cover/dummy.jpg" class="data-img"></td>
									<td style="width: 250px;font-size: 12px;" class="isbn">isbn empty</td>
									<td rowspan="3" class="cnt">cnt</td>
									<td rowspan="3" class="price">price</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="title">title empty</td>
								</tr>
								<tr class="rowDummy">
									<td style="width: 250px;font-size: 12px;" class="author">author empty</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<a href="${pageContext.request.contextPath}/home" class="linkButton"><i class="fas fa-home"></i></a>
		</div>
	</div>
</main>
<script type="text/javascript">
let realRowCopy;
let hideDataCopy;
window.onload=function(){
	realRowCopy=document.getElementById("dummy_table1").getElementsByTagName("tbody")[0].getElementsByClassName("real-row")[0].cloneNode(true);
	hideDataCopy=document.getElementById("dummy_table1").getElementsByTagName("tbody")[0].getElementsByClassName("hide-data")[0].cloneNode(true);
	console.log(hideDataCopy);
	console.log(realRowCopy);
}
function menuClick(e){
	document.getElementById("menu-visual").style.backgroundPosition="0 "+(e.target.attributes[1].value*50)+"px";
	if(e.target.attributes[1].value==1){
		document.getElementById("area1").style.display="";
		document.getElementById("area2").style.display="none";
	}else{
		document.getElementById("area2").style.display="";
		document.getElementById("area1").style.display="none";
	}
}
function showData(row, e){
	let hideRow=row.nextElementSibling;
	if(!(e.target.type=="checkbox") && hideRow.getElementsByClassName("cnt")[0].textContent=="cnt"){
		hideRow.style.display="contents";
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let jd=JSON.parse(data);
				if(jd.code=='fail'){
					alert("조회실패");
				}else{
					let rowDummy=hideRow.getElementsByClassName("rowDummy");
					for(let i=0;i<jd.list.length;i++){
						if(i==0){
							rowDummy[0].getElementsByTagName("img")[0].src="${pageContext.request.contextPath}/img_cover/"+jd.list[i].isbn+".jpg";
							rowDummy[0].getElementsByClassName("isbn")[0].textContent=jd.list[i].isbn;
							rowDummy[0].getElementsByClassName("cnt")[0].textContent=jd.list[i].item_count;
							rowDummy[0].getElementsByClassName("price")[0].textContent=jd.list[i].item_price;
							rowDummy[1].getElementsByClassName("title")[0].textContent=jd.list[i].title;
							rowDummy[2].getElementsByClassName("author")[0].textContent=jd.list[i].author;
						}else{
							let rowDummyCopy1=rowDummy[0].cloneNode(true);
							let rowDummyCopy2=rowDummy[1].cloneNode(true);
							let rowDummyCopy3=rowDummy[2].cloneNode(true);
							hideRow.getElementsByClassName("inner-table")[0].appendChild(rowDummyCopy1);
							hideRow.getElementsByClassName("inner-table")[0].appendChild(rowDummyCopy2);
							hideRow.getElementsByClassName("inner-table")[0].appendChild(rowDummyCopy3);
							rowDummy[3*i].getElementsByTagName("img")[0].src="${pageContext.request.contextPath}/img_cover/"+jd.list[i].isbn+".jpg";
							rowDummy[3*i].getElementsByClassName("isbn")[0].textContent=jd.list[i].isbn;
							rowDummy[3*i].getElementsByClassName("cnt")[0].textContent=jd.list[i].item_count;
							rowDummy[3*i].getElementsByClassName("price")[0].textContent=jd.list[i].item_price;
							rowDummy[3*i+1].getElementsByClassName("title")[0].textContent=jd.list[i].title;
							rowDummy[3*i+2].getElementsByClassName("author")[0].textContent=jd.list[i].author;
						}
					}
				}
			}
		}
		param="checkFunc=1&order_num="+row.getElementsByTagName("td")[1].textContent;
		xhr.open("post","${pageContext.request.contextPath}/OrderManage",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
		xhr.send(param);
	}else if(e.target.type=="checkbox"){
		
	}else{
		hideRow.style.display=((hideRow.style.display=="contents")?"none":"contents");
	}
}
let movePageKey=["1@1@1","1@1@2","1@2@3"];
function movePage(pageNum){
	let pageKey=pageNum.attributes[0].value;
	if(movePageKey[parseInt(pageKey.split("@")[2])-1]!=pageKey){
		movePageKey[parseInt(pageKey.split("@")[2])-1]=pageKey;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let jd=JSON.parse(data);
				if(jd.code=='fail'){
					alert("조회실패");
				}else{
					let tbody=document.getElementById(jd.id_table).getElementsByTagName("tbody")[0];
					tbody.innerHTML="";
					let listLength=jd.list.length;
					for(let i=0;i<listLength;i++){
						tbody.appendChild(realRowCopy.cloneNode(true));
						let rr=tbody.getElementsByClassName("real-row")[i].getElementsByTagName("td");
						rr[0].getElementsByTagName("input")[0].value=jd.list[i].order_num;
						rr[0].getElementsByTagName("input")[0].classList.replace("dummy_ck",jd.id_table+"_ck");
						rr[0].getElementsByTagName("input")[0].checked=pmCheck(jd.id_table, jd.list[i].order_num);
						rr[1].textContent=jd.list[i].order_num;
						rr[2].textContent=jd.list[i].id_customer;
						rr[3].textContent=jd.list[i].name_order;
						rr[4].textContent=jd.list[i].total_price;
						rr[5].textContent=jd.list[i].order_date;
						tbody.appendChild(hideDataCopy.cloneNode(true));
						let hd=tbody.getElementsByClassName("hide-data")[i];
						hd.getElementsByClassName("phone")[0].textContent=jd.list[i].phone_order;
						hd.getElementsByClassName("email")[0].textContent=jd.list[i].email_order;
						hd.getElementsByClassName("address")[0].textContent=jd.list[i].address_order.split("@")[1];
						hd.getElementsByClassName("address")[1].textContent=jd.list[i].address_order.split("@")[0];
					}
					if(listLength<10){
						for(let i=0;i<10-listLength;i++){
							tbody.appendChild(document.createElement("tr"));
						}
					}
					let pageBox=document.getElementById(jd.id_table+"_page").getElementsByTagName("div");
					for(let i=0;i<pageBox.length;i++){
						if(pageBox[i].style.color=="rgb(73, 104, 155)"){
							pageBox[i].style.color="#ffffff";
							pageBox[i].style.backgroundColor="transparent";
						}
					}
					pageNum.style.color="#49689b";
					pageNum.style.backgroundColor="#ffffff";
				}
			}
		}
		param="checkFunc=2&line="+pageKey;
		xhr.open("post","${pageContext.request.contextPath}/OrderManage",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
		xhr.send(param);
	}
}
function sideButton(table_id, num, key){
	let tag=["@1@1","@1@2","@2@3"];
	let pageZone=document.getElementById(table_id+"_page");
	let maxNum=parseInt(pageZone.getElementsByTagName("input")[0].value);
	let pageCode=movePageKey[key];
	let currNum=parseInt(pageCode.split('@')[0]);
	let nextNum=currNum+(num);
	if(nextNum>0 && maxNum>1 && nextNum<=maxNum){
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let jd=JSON.parse(data);
				if(jd.code=='fail'){
					alert("조회실패");
				}else{
					let tbody=document.getElementById(jd.id_table).getElementsByTagName("tbody")[0];
					tbody.innerHTML="";
					let listLength=jd.list.length;
					for(let i=0;i<listLength;i++){
						tbody.appendChild(realRowCopy.cloneNode(true));
						let rr=tbody.getElementsByClassName("real-row")[i].getElementsByTagName("td");
						rr[0].getElementsByTagName("input")[0].value=jd.list[i].order_num;
						rr[0].getElementsByTagName("input")[0].classList.replace("dummy_ck",jd.id_table+"_ck");
						rr[0].getElementsByTagName("input")[0].checked=pmCheck(jd.id_table, jd.list[i].order_num);
						rr[1].textContent=jd.list[i].order_num;
						rr[2].textContent=jd.list[i].id_customer;
						rr[3].textContent=jd.list[i].name_order;
						rr[4].textContent=jd.list[i].total_price;
						rr[5].textContent=jd.list[i].order_date;
						tbody.appendChild(hideDataCopy.cloneNode(true));
						let hd=tbody.getElementsByClassName("hide-data")[i];
						hd.getElementsByClassName("phone")[0].textContent=jd.list[i].phone_order;
						hd.getElementsByClassName("email")[0].textContent=jd.list[i].email_order;
						hd.getElementsByClassName("address")[0].textContent=jd.list[i].address_order.split("@")[1];
						hd.getElementsByClassName("address")[1].textContent=jd.list[i].address_order.split("@")[0];
					}
					if(listLength<10){
						for(let i=0;i<10-listLength;i++){
							tbody.appendChild(document.createElement("tr"));
						}
					}
					let pageBox=document.getElementById(jd.id_table+"_page").getElementsByTagName("div");
					let keyNum=Math.floor((nextNum-1)/5);
					for(let i=0;i<pageBox.length;i++){
						pageBox[i].style.color="#ffffff";
						pageBox[i].style.backgroundColor="transparent";
						pageBox[i].textContent=(keyNum*5)+(i+1);
						pageBox[i].style.display="";
						pageBox[i].attributes[0].value=((keyNum*5)+(i+1))+tag[key];
						console.log(pageBox[i].attributes[0].value);
					}
					for(let i=0;i<pageBox.length;i++){
						if((keyNum*5)+(i+1)==nextNum){
							pageBox[i].style.color="#49689b";
							pageBox[i].style.backgroundColor="#ffffff";
						}else if((keyNum*5)+(i+1)>maxNum){
							pageBox[i].style.display="none";
						}
					}
					movePageKey[key]=nextNum+tag[key];
				}
			}
		}
		param="checkFunc=2&line="+nextNum+tag[key];
		xhr.open("post","${pageContext.request.contextPath}/OrderManage",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
		xhr.send(param);
	}
}
function pmCheck(id, value_id){
	switch(id){
	case "area1_table1": return area1_table1_ck.includes(value_id);
	case "area1_table1_clear": area1_table1_ck.length=0;
						break;
	case "area1_table2": return area1_table2_ck.includes(value_id);
	case "area1_table2_clear": area1_table2_ck.length=0;
						break;
	case "area2_table3": return area2_table3_ck.includes(value_id);
	case "area2_table3_clear": area2_table3_ck.length=0;
						break;
	}
}
let area1_table1_ck=[];
let area1_table2_ck=[];
let area2_table3_ck=[];
function checkBox(choice){
	switch(choice.className){
	case "area1_table1_ck": exeCheck(area1_table1_ck, choice.checked, choice.value);
							document.getElementById("area1_table1_choiceCnt").textContent=area1_table1_ck.length;
							break;
	case "area1_table2_ck": exeCheck(area1_table2_ck, choice.checked, choice.value);
							document.getElementById("area1_table2_choiceCnt").textContent=area1_table2_ck.length;
							break;
	case "area2_table3_ck": exeCheck(area2_table3_ck, choice.checked, choice.value);
							document.getElementById("area2_table3_choiceCnt").textContent=area2_table3_ck.length;
							break;
	}
	console.log(area1_table1_ck);
	console.log(area1_table2_ck);
	console.log(area2_table3_ck);
}
function exeCheck(chArray, chBool, order_num){
	if(chBool){
		chArray.push(order_num);
	}else{
		chArray.splice(chArray.indexOf(order_num), 1);
	}
}
function check10(choice){
	let chBox=document.getElementsByClassName(choice.value);
	for(let i=0;i<chBox.length;i++){
		if(choice.checked){
			if(!(chBox[i].checked)){
				chBox[i].checked=true;
				checkBox(chBox[i]);
			}
		}else{
			if(chBox[i].checked){
				chBox[i].checked=false;
				checkBox(chBox[i]);
			}
		}
	}
}
function reloadTable(table_id, order_status){
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			let data=xhr.responseText;
			let jd=JSON.parse(data);
			if(jd.code=='fail'){
				alert("조회실패");
			}else{
				let tbody=document.getElementById(table_id).getElementsByTagName("tbody")[0];
				tbody.innerHTML="";
				let listLength=jd.list.length;
				for(let i=0;i<listLength;i++){
					tbody.appendChild(realRowCopy.cloneNode(true));
					let rr=tbody.getElementsByClassName("real-row")[i].getElementsByTagName("td");
					rr[0].getElementsByTagName("input")[0].value=jd.list[i].order_num;
					rr[0].getElementsByTagName("input")[0].classList.replace("dummy_ck",table_id+"_ck");
					rr[0].getElementsByTagName("input")[0].checked=pmCheck(table_id+"_clear", "");
					rr[1].textContent=jd.list[i].order_num;
					rr[2].textContent=jd.list[i].id_customer;
					rr[3].textContent=jd.list[i].name_order;
					rr[4].textContent=jd.list[i].total_price;
					rr[5].textContent=jd.list[i].order_date;
					tbody.appendChild(hideDataCopy.cloneNode(true));
					let hd=tbody.getElementsByClassName("hide-data")[i];
					hd.getElementsByClassName("phone")[0].textContent=jd.list[i].phone_order;
					hd.getElementsByClassName("email")[0].textContent=jd.list[i].email_order;
					hd.getElementsByClassName("address")[0].textContent=jd.list[i].address_order.split("@")[1];
					hd.getElementsByClassName("address")[1].textContent=jd.list[i].address_order.split("@")[0];
				}
				if(listLength<10){
					for(let i=0;i<10-listLength;i++){
						tbody.appendChild(document.createElement("tr"));
					}
				}
				let pageBox=document.getElementById(table_id+"_page").getElementsByTagName("div");
				let pointNum=Math.floor((parseInt(jd.page_count)-1)/5); //1
				for(let i=0;i<pageBox.length;i++){
					if(i==0){
						pageBox[i].style.color="#49689b";
						pageBox[i].style.backgroundColor="#ffffff";
						pageBox[i].textContent='1';
						pageBox[i].attributes[0].value='1@'+table_id.substring(4,5)+"@"+table_id.charAt(table_id.length-1);
					}else if(i>0 && i<(parseInt(jd.page_count))){
						pageBox[i].style.color="#ffffff";
						pageBox[i].style.backgroundColor="transparent";
						pageBox[i].style.display="";
						pageBox[i].textContent=i+1;
						pageBox[i].attributes[0].value=(i+1)+'@'+table_id.substring(4,5)+"@"+table_id.charAt(table_id.length-1);
					}else{
						pageBox[i].style.color="#ffffff";
						pageBox[i].style.backgroundColor="transparent";
						pageBox[i].style.display="none";
						pageBox[i].textContent=i+1;
						pageBox[i].attributes[0].value=(i+1)+'@'+table_id.substring(4,5)+"@"+table_id.charAt(table_id.length-1);
					}
				}
				movePageKey[parseInt(table_id.charAt(table_id.length-1))-1]="1@"+table_id.substring(4,5)+"@"+table_id.charAt(table_id.length-1);
				document.getElementById(table_id+"_totalCnt").textContent=jd.count;
				document.getElementById(table_id+"_choiceCnt").textContent="0";
			}
		}
	}
	param="checkFunc=3&order_status="+order_status;
	xhr.open("post","${pageContext.request.contextPath}/OrderManage",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	xhr.send(param);
}
function exeUpdate(num, update_status){
	let table_array=[];
	let reload_status=[];
	let num_line='';
	switch(num){
		case 1: table_array.push('area1_table1');
				table_array.push('area1_table2');
				reload_status.push('주문대기');
				reload_status.push('배송중');
				num_line=area1_table1_ck.join("','");
				break;
		case 2: table_array.push('area1_table1');
				reload_status.push('주문대기');
				num_line=area1_table1_ck.join("','");
				break;
		case 3: table_array.push('area1_table2');
				reload_status.push('배송중');
				num_line=area1_table2_ck.join("','");
				break;
		case 4: table_array.push('area2_table3');
				reload_status.push('취소신청');
				num_line=area2_table3_ck.join("','");
				break;
	}
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		let data=xhr.responseText;
		let jd=JSON.parse(data);
		if(jd.code=='fail'){
			alert("업데이트 실패");
		}else{
			for(let i=0;i<table_array.length;i++){
				reloadTable(table_array[i], reload_status[i]);
			}
		}
	}
	param="checkFunc=4&update_status="+update_status+"&num_line="+num_line;
	xhr.open("post","${pageContext.request.contextPath}/OrderManage",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	xhr.send(param);
}
</script>