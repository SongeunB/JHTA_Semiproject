<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <h1 style="text-align:center;">회원 가입</h1>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
           
            var addr = '';
            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
          
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

var xhr=null;
function idCheck(){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=success;
	let id_customer=document.getElementById("id_customer").value;
	if(id_customer==""){	
		document.getElementById("idcheck").innerHTML="";
		return;
	}
	xhr.open('post','idcheck.jsp?id_customer=' + id_customer, true);
	xhr.send();
}
function success(){
	if(xhr.readyState==4 && xhr.status==200){
					
		let xml=xhr.responseXML;
		let exist=xml.getElementsByTagName("exist")[0].textContent;
		let span=document.getElementById("idcheck");
		if(exist=='true'){
			span.innerText = "중복된 아이디가 존재합니다";
		}else {
			span.innerText = "사용 가능한 아이디입니다.";
		}
	}
}
</script>

<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/joinForm" name="cj" onsubmit="return check();">
	아이디 <input type="text" name="id_customer" id="id_customer" onkeyup="idCheck()"><span id="idcheck"></span><br>
	비밀번호 <input type="password" name="pwd"><br>
	이름 <input type="text" name="name"><br>
	이메일 <input type="text" name="email"><br>
	전화번호 <input type="text" name="phone"><br>
	주소
		<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address1" id="sample6_address" placeholder="주소">
		<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소"><br><br>
	<input type="submit" value="가입">	
</form>
</div>
<script type="text/javascript">
	function check(){
		if(document.cj.id_customer.value == "" || document.cj.id_customer.value.length < 0){ 
			alert("아이디를 입력해주세요")
			document.cj.id_customer.focus();
			return false;
		}
		if(document.cj.pwd.value == "" || document.cj.pwd.value.length < 0){ 
			alert("비밀번호를 입력해주세요")
			document.cj.pwd.focus();
			return false;
		}
		if(document.cj.name.value == "" || document.cj.name.value.length < 0){ 
			alert("이름을 입력해주세요")
			document.cj.name.focus();
			return false;
		}
		if(document.cj.email.value == "" || document.cj.email.value.length < 0){ 
			alert("이메일을 입력해주세요")
			document.cj.email.focus();
			return false;
		}
		if(document.cj.phone.value == "" || document.cj.phone.value.length < 0){ 
			alert("전화번호를 입력해주세요")
			document.cj.phone.focus();
			return false;
		}
		if(document.cj.sample6_address.value == "" || document.cj.sample6_address.value.length < 0){ 
			alert("주소를 입력해주세요")
			document.sample6_address.pwd.focus();
			return false;
		}
		if(document.cj.sample6_detailAddress.value == "" || document.cj.sample6_detailAddress.value.length < 0){ 
			alert("상세주소를 입력해주세요")
			document.cj.sample6_detailAddress.focus();
			return false;
		}
	}
	
</script>