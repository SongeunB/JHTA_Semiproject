<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">



function check_pw(){
	 
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}

function email_change(){

	if(document.cj.email2.options[document.cj.email2.selectedIndex].value == '0'){
	 document.cj.email3.disabled = true;
	 document.cj.email3.value = "";
	}

	if(document.cj.email2.options[document.cj.email2.selectedIndex].value == '9'){
	 document.cj.email3.disabled = false;
	 document.cj.email3.value = "";
	 document.cj.email3.focus();
	}else{
	 document.cj.email3.disabled = true;
	 document.cj.email3.value = document.cj.email2.options[document.cj.email2.selectedIndex].value;
	}
}

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
		if(document.cj.email1.value == "" || document.cj.email1.value.length < 0){ 
			alert("이메일을 입력해주세요")
			document.cj.email1.focus();
			return false;
		}
		if(document.cj.phone1.value == "" || document.cj.phone1.value.length < 0){ 
			alert("전화번호를 입력해주세요")
			document.cj.phone1.focus();
			return false;
		}
		if(document.cj.phone2.value == "" || document.cj.phone2.value.length < 0){ 
			alert("전화번호를 입력해주세요")
			document.cj.phone2.focus();
			return false;
		}
		if(document.cj.phone3.value == "" || document.cj.phone3.value.length < 0){ 
			alert("전화번호를 입력해주세요")
			document.cj.phone3.focus();
			return false;
		}
		if(document.cj.address1.value == "" || document.cj.address1.value.length < 0){ 
			alert("주소를 입력해주세요")
			document.cj.address1.focus();
			return false;
		}
		if(document.cj.address2.value == "" || document.cj.address2.value.length < 0){ 
			alert("상세주소를 입력해주세요")
			document.cj.address2.focus();
			return false;
		}
	}

</script>
</head>
<body>



<c:set var="phoneNum" value="${vo.phone }"/>

<c:set var="addr" value="${vo.address }"/>
<c:set var="addrArray" value="${fn:split(addr,'@') }"/>

<c:set var="email" value="${vo.email }"/>
<c:set var="emailArray" value="${fn:split(email,'@') }"/>
 
<div id="container">
			<div class="contents">
						<div class="contentsTop">
					<h2>회원정보 수정</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
					<form method="post" action="${pageContext.request.contextPath }/updateForm" name="cj" onsubmit="return check();">
						<table>
						<tr>
							<th style="width: 100px;">아이디</th>
								<td>
									<input type="text" name="id_customer" value="${sessionScope.id_customer }" readonly="readonly"><br>
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">비밀번호</th>
								<td>
									<input type="password" name="pwd" id="pw" onchange="check_pw()"><span style="font-size:0.5em; color:grey;">&nbsp;&nbsp;&nbsp; 6글자 이상, 16글자 이하 // 특수문자(!,@,#,$,%)를 포함해주세요 </span><br>
								</td>
						</tr>
						<tr>
							<th style="width: 120px;">비밀번호 확인</th>
								<td>
									<input type="password" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span><br>
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">이름</th>
								<td>
									<input type="text" name="name" maxlength="5" value="${vo.name }"><br>
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">이메일</th>
								<td>
									<input type="text" name="email1" maxlength="15" value="${emailArray[0] }">  @
									<input type="text" name="email3" value="" disabled>
									<select name="email2" onchange="email_change()">
								    <option value="0" >선택하세요</option>
								    <option value="9">직접입력</option>
								    <option value="naver.com">naver.com</option>
								    <option value="gmail.com">gmail.com</option>
								    <option value="hanmail.net">hanmail.net</option>
								    <option value="nate.com">nate.com</option>
								    </select>
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">핸드폰</th>
								<td>
									<select name="phone1">
								    <option value="">::선택::</option>
								    <option value="010">010</option>
								    <option value="011">011</option>
								    <option value="016">016</option>
								    <option value="017">017</option>
								    <option value="018">018</option>
								  	</select>
									<input type="text" name="phone2" size="4" maxlength="4" value="${fn:substring(phoneNum,4,8) }">
									<input type="text" name="phone3" size="4" maxlength="4" value="${fn:substring(phoneNum,9,13) }">
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">주소</th>
								<td>
									<input type="text" name="addrNum" id="sample6_postcode" placeholder="우편번호" value="${addrArray[0]}">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<br>
									<input type="text" name="address1" id="sample6_address" placeholder="주소" size="40" value="${addrArray[1]}">
									<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소" size="35" value="${addrArray[2]}"><br>
								</td>
						</tr>
						</table>
						<input type="submit" value="수정">	
					</form>
					</div>
			</div>
			</div>
			<div style="text-align:right">
					<a href="${pageContext.request.contextPath}/deleteId">회원탈퇴</a>
					</div>	
		</div>
</body>
<script type="text/javascript">
window.onload = function(){
	  engAndNumberFunc(document.getElementById("id_customer"));
	  engAndNumberFunc(document.getElementById("email1"));
	  onlyNumberFunc(document.getElementById("phone2"));
	  onlyNumberFunc(document.getElementById("phone3"));
	  onlyKorFunc(document.getElementById("name"));
	}

	function engAndNumberFunc(t){
	  var regexp = /[^a-z0-9]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}

	function onlyNumberFunc(t){
	  var regexp = /[^0-9]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}

	function onlyEngFunc(t){
	  var regexp = /[^a-z]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}

	function onlyKorFunc(t){
	  var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}

	function korAndNumberFunc(t){
	  var regexp = /[^ㄱ-ㅎ가-힣0-9]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}
</script>
</html>