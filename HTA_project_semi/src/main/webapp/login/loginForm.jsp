<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">

<script type="text/javascript">
	function check(){
		if(document.login.id_customer.value == "" || document.login.id_customer.value.length < 0){ 
			alert("아이디를 입력해주세요")
			document.login.id_customer.focus();
			return false;
		}
		if(document.login.pwd.value == "" || document.login.pwd.value.length < 0){ 
			alert("비밀번호를 입력해주세요")
			document.login.pwd.focus();
			return false;
		}
	}
</script>

<div id="container">
			<div class="contents">
						<div class="contentsTop">
					<h2>로그인</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
					<form method="post" action="${pageContext.request.contextPath }/loginForm" name="login" onsubmit="return check();" >
						<table>
						<tr>
							<th style="width: 100px;">아이디</th>
								<td>
									<input type="text" name="id_customer"><br>
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">비밀번호</th>
								<td>
									<input type="password" name="pwd"><br>
								</td>
						</tr>
						</table>
						<br><div>${requestScope.errMsg }</div>
						<input type = "submit" value = "로그인">
					</form>
					<a href="${pageContext.request.contextPath}/findId">아이디 찾기</a> | <a href="${pageContext.request.contextPath}/findPwd">비밀번호 찾기</a>
					<br><br>
					</div>
			</div>
			</div>
		</div>