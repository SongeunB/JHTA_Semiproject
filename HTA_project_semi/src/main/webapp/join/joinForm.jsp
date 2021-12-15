<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1 style="text-align:center;">회원 가입</h1>
    
<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/joinForm" name="cj" onsubmit="return check();">
	아이디 <input type="text" name="id_customer"><input type="button" value="중복체크" onclick="winopen()"><br>
	비밀번호 <input type="password" name="pwd"><br>
	이름 <input type="text" name="name"><br>
	이메일 <input type="text" name="email"><br>
	전화번호 <input type="text" name="phone"><br>
	주소 <input type="text" name="address"><br>
	<input type="submit" value="가입">	
</form>

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
		if(document.cj.address.value == "" || document.cj.address.value.length < 0){ 
			alert("주소를 입력해주세요")
			
			document.cj.address.focus();
			return false;
		}
	}
	
	function winopen(){
		if(document.cj.id_customer.value =="" || document.cj.id_customer.value.length < 0){
			alert("아이디를 입력해주세요")
			document.cj.id_customer.focus();
		}else{
			window.open("joinIdCheck.jsp?id_customer="+document.cj.id_customer.value,"","width=500, height=300");
		}
	}
</script>
</div>