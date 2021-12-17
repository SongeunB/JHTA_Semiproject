<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<div id="container">
			<div class="contents">
						<div class="contentsTop">
					<h2>로그인</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
					<form method="post" action="${pageContext.request.contextPath }/loginForm">
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
						<br><div>${requestScope.errMsg }</div><br>
						<input type = "submit" value = "로그인">
					</form>
					<a href="${pageContext.request.contextPath}/findId">아이디 찾기</a> | <a href="${pageContext.request.contextPath}/findPwd">비밀번호 찾기</a>
					<br><br>
					</div>
			</div>
			</div>
		</div>
		
<!-- <div style="text-align:center;">
<form method="post" action="${pageContext.request.contextPath }/loginForm">
	아이디 <input type="text" name="id_customer"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div>${requestScope.errMsg }</div>
	<input type="submit" value="로그인"><br>	
</form>
	
	<a href="${pageContext.request.contextPath}/findId">아이디 찾기</a> | <a href="${pageContext.request.contextPath}/findPwd">비밀번호 찾기</a>
</div>
-->