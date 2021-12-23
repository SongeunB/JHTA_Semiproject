<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main id="banner_wrapper" role="main" style="background:#f0fcff;padding-top:50px;padding-bottom:25px;">
<div id="banner_container" class="container" style="width:900px;">
<div id="total-wrap">
<h1>BANNER</h1>
<div id="audio-today" class="audio-section">
	<div class="audio-header">
		<h2></h2>
	</div>
	<div class="audio-body">
		<div class="audio-slide-wrap" id="banner"  
		style="background: linear-gradient(to right, #8ae3c8, #376ddb);
		width:760px;">
			<div class="audio-slide audio-flex-between">
				<img src="img_cover/dummy.jpg" id="bannerImg">
				<div class="txt-wrap" id="bannerTxt" style="height:220px; width:450px; color:white;">
					<h3 style="font-style:italic;" id="bannerH3">CONTENT</h3>
					<p id="bannerP">작가 &nbsp;『제목』</p>
				</div>
			</div>
		</div>
	</div>
</div>
<input type='text' id="custom1" />
<input type='text' id="custom2"/>
<input type='text' id="custom3"/>
<br>
<span class="pickerTag">left-color</span><span class="pickerTag">right-color</span><span class="pickerTag">font-color</span>
<br>
<div id="hiddenBox">
	<c:forEach var="vo" items="${bannerList}">
	<input type="hidden" id="${vo.id_item}" value='${vo.sentence}@${vo.left_color}@${vo.right_color}@${vo.font_color}'>
	</c:forEach>
</div>
<div id="inputForm">
LIST
<button class="miniButton" onclick='reloadList()'><i class="fas fa-sync"></i></button><br>
<select name="bannerList" id="bannerList" onchange="showBanner()">
	<c:forEach var="vo" items="${bannerList}">
	<option value="${vo.id_item}">${vo.author} &nbsp;『${vo.title}』</option>
	</c:forEach>
</select>
<br>
<label class="checkLabel"><input class="checkRadio" type="radio" name="checkFunc" value="1" checked>등록</label>
<label class="checkLabel"><input class="checkRadio" type="radio" name="checkFunc" value="2">수정</label>
<label class="checkLabel"><input class="checkRadio" type="radio" name="checkFunc" value="3">삭제</label>
<br>
ISBN&nbsp;<span style="color:gray;font-size:13px;">13자리</span>
<button class="miniButton" onclick='getBook()'><i class="fas fa-search"></i></button><br>
<input type='text' id='isbn' onclick='changeBlack()'>
<br>
CONTENT&nbsp;<span style="color:gray;font-size:13px;">한글 100자</span>
<button class="miniButton" onclick='setH3()'><i class="fas fa-pen"></i></button><br>
<textarea id='sentence' cols='48' rows='5'></textarea>
<input type='button' onclick='postData()'  value='SUBMIT' class="bigButton">
</div>
<div id="resultCode">
	<h3></h3>
</div>
<a href="${pageContext.request.contextPath}/home" class="linkButton"><i class="fas fa-home"></i></a>
</div>
<script type="text/javascript">
function getBook(){
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			let data=xhr.responseText;
			let jd=JSON.parse(data);
			if(jd.code=='fail'){
				document.getElementById("isbn").style.color="#b60606";
			}else{
				document.getElementById("isbn").style.color="#00ae1d";
				document.getElementById("bannerImg").src="img_cover/"+jd.isbn+".jpg";
				document.getElementById("bannerP").innerHTML=jd.author+" &nbsp;『"+jd.title+"』";
			}
		}
	}
	let isbn=document.getElementById("isbn").value;
	param="checkFunc=4&isbn="+isbn;
	xhr.open("post","${pageContext.request.contextPath}/banner",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	xhr.send(param);
}
function setH3(){
	let sentence=document.getElementById("sentence").value;
	document.getElementById("bannerH3").innerHTML=sentence;
}
function showBanner(){
	let bannerList=document.getElementById("bannerList");
	let isbn=bannerList.options[bannerList.selectedIndex].value;
	let data=document.getElementById(isbn).value.split("@");
	document.getElementById("bannerP").innerHTML=bannerList.options[bannerList.selectedIndex].text;
	document.getElementById("bannerImg").src="img_cover/"+isbn+".jpg";
	document.getElementById("bannerH3").innerHTML=data[0];
	document.getElementById("banner").style.background="linear-gradient(to right,"+data[1]+","+data[2]+")";
	document.getElementById("bannerTxt").style.color=data[3];
	document.getElementById("isbn").value=isbn;
	document.getElementById("isbn").style.color="#00ae1d";
	$("#custom1").spectrum("set", data[1]);
	$("#custom2").spectrum("set", data[2]);
	$("#custom3").spectrum("set", data[3]);
	document.getElementById("sentence").value=data[0];
}
function changeBlack(){
	document.getElementById("isbn").style.color="#000000";
}
function reloadList(){
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			let data=xhr.responseText;
			let jd=JSON.parse(data);
			if(jd.code=='fail'){
				alert("새로고침 오류");
			}else{
				let hiddenData="";
				let bannerData="";
				for(let i=0;i<jd.list.length;i++){
					hiddenData+='<input type="hidden" id="'+jd.list[i].isbn+'" value=\''+jd.list[i].sentence+'@'+jd.list[i].left_color+'@'+jd.list[i].right_color+'@'+jd.list[i].font_color+'\'>';
					bannerData+='<option value="'+jd.list[i].isbn+'">'+jd.list[i].author+' &nbsp;『'+jd.list[i].title+'』</option>';
				}
				document.getElementById("hiddenBox").innerHTML=hiddenData;
				document.getElementById("bannerList").innerHTML=bannerData;
			}
		}
	}
	param="checkFunc=5";
	xhr.open("post","${pageContext.request.contextPath}/banner",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	xhr.send(param);
}
function postData(){
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			let data=xhr.responseText;
			let jd=JSON.parse(data);
			let result=document.getElementById("resultCode");
			if(jd.code=='fail'){
				result.innerHTML="<h3><i class='fa fa-times'></i>&nbsp;"+jd.msg+"</h3>";
				result.style.color="#b60606";
			}else{
				result.innerHTML="<h3><i class='fa fa-check'></i>&nbsp;"+jd.msg+"</h3>";
				result.style.color="#00ae1d";
			}
		}
	}
	let checkFunc=document.querySelector("input[name='checkFunc']:checked").value;
	let isbn=document.getElementById("isbn").value;
	let param=null;
	if(checkFunc!='3'){
		let sentence=document.getElementById("sentence").value;
		let left_color=$('#custom1').spectrum("get").toHexString();
		let right_color=$('#custom2').spectrum("get").toHexString();
		let font_color=$('#custom3').spectrum("get").toHexString();
		param="checkFunc="+checkFunc+"&isbn="+isbn+"&sentence="+sentence+"&left_color="+left_color+"&right_color="+right_color+"&font_color="+font_color;
	}else{
		param="checkFunc="+checkFunc+"&isbn="+isbn;
	}
	xhr.open("post","${pageContext.request.contextPath}/banner",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	xhr.send(param);
}
</script>
</div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/spectrum.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#custom1").spectrum({
		preferredFormat: "hex",
		flat: true,
		showInitial: true,
		showInput: true,
		color: "#ffffff",
		move: function(color) {
			$("#banner").css("background","linear-gradient(to right,"+color.toHexString()+", "+$('#custom2').spectrum('get')+")");
		}
	});
	$("#custom2").spectrum({
	    preferredFormat: "hex",
	    flat: true,
	    showInitial: true,
	    showInput: true,
	    color: "#ffffff",
	    move: function(color) {
	    	$("#banner").css("background","linear-gradient(to right,"+$('#custom1').spectrum('get')+", "+color.toHexString()+")");
	    }
	});
	$("#custom3").spectrum({
	    preferredFormat: "hex",
	    flat: true,
	    showInitial: true,
	    showInput: true,
	    color: "#ffffff",
	    move: function(color) {
	    	$("#bannerTxt").css("color",color.toHexString());
	    }
	});
});
</script>