<%@page import="semi.dao.CustomersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id_customer = request.getParameter("id_customer");
CustomersDao cdao = CustomersDao.getInstance();


int result = cdao.joinIdCheck(id_customer);
if (result == 1){
	out.print("사용가능한 아이디입니다");
	%>
	 <input type="button" value="아이디 사용하기" onclick="result();">
	<%
	
}else if(result == 0){
	out.print("중복된 아이디입니다");
}else{
	out.print("에러 발생!"); 
}

%>

<fieldset>	
	<form action="joinIdCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="userid" value="<%=id_customer%>">
		<input type="submit" value="중복 확인">
	</form>
</fieldset>

<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
    function result(){
    	
    	opener.document.cj.id.value = document.wfr.userid.value;
    	    	
    	opener.document.cj.id.readOnly=true;
    	
    	window.close();
    }
 
 </script>

</body>
</html>