<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	$("#frm").submit(function(){
		if($("#id_item").val() == ""){
			$("#id_item").focus();
			alert("도서 번호를 입력하세요.");
			return false;
		}
		if($("#title").val() == ""){
			$("#title").focus();
			alert("도서명을 입력하세요.");
			return false;
		}
		if($("#author").val()==""){
			$("#author").focus();
			alert("작가명을 입력하세요.");
			return false;
		}
		if($("#publisher").val()==""){
			$("#publisher").focus();
			alert("출판사를 입력하세요.");
			return false;
		}
		if($("#ymd").val()==""){
			$("#ymd").focus();
			alert("출판일을 입력하세요.");
			return false;
		}
		if($("#price").val()==""){
			$("#price").focus();
			alert("도서가격을 입력하세요.");
			return false;
		}
		if($("#stock").val()==""){
			$("#stock").focus();
			alert("도서수량을 입력하세요.");
			return false;
		}
		if($("#bookImage").val()==""){
			$("#bookImage").focus();
			alert("표지이미지를 등록해주세요.");
			return false;
		}
		if($("#bookImage1").val()==""){
			$("#bookImage1").focus();
			alert("표지이미지 1을 등록해주세요");
			return false;
		}
		if($("#genre").val()==""){
			$("#genre").focus();
			alert("도서종류를 선택해주세요");
			return false;
		}
	});
});
</script>
</head>
<body>
	<div id = "wrap">
				<div class="top_cate">
			<jsp:include page="${requestScope.header1 }"></jsp:include>
				</div>
			<div id="container">
			<!-- 메인 컨텐츠 -->
			<div class="contents">
						<div class="contentsTop">
					<h2>도서 등록</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
					<form method="post" action="${pageContext.request.contextPath}/goods/insert" id = "frm" name="goodsForm" enctype="multipart/form-data">
						<table>
						<tr>
							<th style="width: 100px;">도서 번호</th>
								<td>
									<input type="text" name="id_item" id="id_item" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">도서명</th>
								<td>
									<input type="text" name="title" id="title" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">도서 수량</th>
								<td>
									<input type="text" name="stock" id="stock" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">도서 가격</th>
								<td>
									<input type="text" name="price" id="price" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">도서종류</th>
								<td>
									<input type="text" name="genre" id="genre" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">세부장르</th>
								<td>
									<input type="text" name="genre_detail" id="genre_detail" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">작가</th>
								<td>
									<input type="text" name="author" id="author" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">원어제목</th>
								<td>
									<input type="text" name="org_title" id="org_title" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">원어작가</th>
								<td>
									<input type="text" name="org_author" id="org_author" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">역자</th>
								<td>
									<input type="text" name="translator" id="translator" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">출판사</th>
								<td>
									<input type="text" name="publisher" id="publisher" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">출판일</th>
								<td>
									<input type="text" name="ymd" id="ymd" />
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">책 소개</th>
								<td><textarea rows="13" cols="56" 
									name="text" id="text"></textarea>
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">표지 이미지</th>
								<td>
									 <input type="file" name="bookImage" id="bookImage" >
								</td>
						</tr>
						<tr>
							<th style="width: 100px;">상세 이미지</th>
								<td>
									<input type="file" name="bookImage1" id="bookImage1" >
								</td>
						</tr>
						</table>
						<input type = "submit" value = "등록하기">
					</form>
					</div>
			</div>
			</div>
		</div>
		<jsp:include page="${requestScope.footer }"></jsp:include>
	</div>
</body>
</html>