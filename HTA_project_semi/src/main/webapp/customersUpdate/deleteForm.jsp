<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	if(document.di.pwd.value == "" || document.di.pwd.value.length < 0){ 
		alert("비밀번호를 입력해주세요")
		document.di.pwd.focus();
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
					<h2>회원 탈퇴</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
						<form method="post" action="${pageContext.request.contextPath }/deleteId" name="di" onsubmit="return check()">
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
									<input type="password" name="pwd"><br>
								</td>
								</tr>
							</table>
							<input type="submit" value="탈퇴">
							</form>
					</div>
				</div>
		</div>
	</div>
</body>
</html>