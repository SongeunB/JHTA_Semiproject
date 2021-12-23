<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.fp.id_customer.value == "" || document.fp.id_customer.value.length < 0){ 
			alert("아이디를 입력해주세요")
			document.fp.id_customer.focus();
			return false;
		}
		if(document.fp.email.value == "" || document.fp.email.value.length < 0){ 
			alert("이메일을 입력해주세요")
			document.fp.email.focus();
			return false;
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
<div id="container">
			<div class="contents">
						<div class="contentsTop">
					<h2>비밀번호 찾기</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
						<form method="post" action="${pageContext.request.contextPath }/findPwd" name="fp" onsubmit="return check()">
							<table>
								<tr>
							<th style="width: 100px;">아이디</th>
								<td>
									<input type="text" name="id_customer" ><br>
								</td>
								</tr>
								<tr>
								<th style="width: 100px;">이메일</th>
								<td>
									<input type="text" name="email"><br>
								</td>
								</tr>
							</table>
							<br><div>${requestScope.findResult }</div>
							<input type="submit" value="찾기">
							</form>
					</div>
				</div>
		</div>
	</div>
	
	
</body>
</html>