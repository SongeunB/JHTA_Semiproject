<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function eraseAll(){
		
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
</script>
</head>
<body>
<h1 style="text-align:center;">회원정보 수정</h1>

<div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/updateForm">
	아이디	<input type="text" name="id_customer" value="${sessionScope.id_customer }" readonly="readonly"><br>
	비밀번호 	<input type="password" name="pwd" ><br>
	이름 	<input type="text" name="name" value="${vo.name }"><br>
	이메일	<input type="text" name="email" ><br>
	전화번호	<input type="text" name="phone" ><br>
	주소
		<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address1" id="sample6_address" placeholder="주소">
		<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소"><br><br>
	<input type="submit" value="수정">
	<input type="button" value="취소" onclick="eraseAll()"> |
	<a href="${pageContext.request.contextPath}/deleteId">회원탈퇴</a>
</form>

</div>
</body>
</html>