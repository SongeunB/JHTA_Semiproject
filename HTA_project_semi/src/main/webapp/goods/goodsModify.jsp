<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 수정</title>
<link rel="stylesheet" type="text/css" href="css/goods/goodsUp.css" />
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn1").click(function(){
		if($("#btn1").attr("value") == "삭제"){
			$("#btn1").attr("value","삭제취소");
			$("#fileDel").val("${vo.bookimage}");
			$("#imageView").html(
					"<input type='file' name='bookimage' >");
		}else{
			$("#btn1").attr("value","삭제");
			$("#fileDel").val("");
			$("#imageView").html("");
		}
	});
});
$(function(){
	$("#btn2").click(function(){
		if($("#btn2").attr("value") == "삭제"){
			$("#btn2").attr("value","삭제취소");
			$("#fileDel1").val("${vo.bookimage1}");
			$("#imageView1").html(
					"<input type='file' name='vo.bookimage1' >");
		}else{
			$("#btn2").attr("value","삭제");
			$("#fileDel1").val("");
			$("#imageView1").html("");
		}
	});
});

</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="${requestScope.header1 }"></jsp:include>
		<div id="container">
			<!-- 메인 컨텐츠 -->
			<div class="contents">
				<div class="contentsTop">
					<h2>도서 수정</h2>
				</div>
				<br>
				<div class="relCon">
					<div class="table11" id="ustiInfo" align="center">
						<form action="${pageContext.request.contextPath}/goods/modify" method="post" id = "frm" name="goodsForm"
							enctype="multipart/form-data">
							<table>
								<tr>
									<th style="width: 100px;">도서 번호</th>
									<td>${vo.id_item}</td>
								</tr>
								<tr>
									<th style="width: 100px;">도서명</th>
									<td>${vo.title }</td>
								</tr>
								<tr>
									<th style="width: 100px;">도서 수량</th>
									<td><input type="text" name="stock" id="stock" 
										value="${vo.stock}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">도서 가격</th>
									<td><input type="text" name="price" id="price"
										value="${vo.price}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">도서 종류</th>
									<td><input type="text" name="genre" id="genre"
										value="${vo.genre}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">세부장르</th>
									<td><input type="text" name="genre_detail" id="genre_detail"
										value="${vo.genre_detail}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">작가</th>
									<td><input type="text" name="author" id="author"
										value="${vo.author}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">원어제목</th>
									<td><input type="text" name="org_title" id="org_title"
										value="${vo.org_title}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">원어작가</th>
									<td><input type="text" name="org_author" id="org_author"
										value="${vo.org_author}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">역자</th>
									<td><input type="text" name="translator" id="translator"
										value="${vo.translator}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">출판사</th>
									<td><input type="text" name="publisher" id="publisher"
										value="${vo.publisher}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">출판일</th>
									<td><input type="text" name="ymd" id="ymd"
										value="${vo.ymd}" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">도서 설명</th>
									<td><textarea rows="13" cols="56" name="content"
											id="content" ></textarea></td>
								</tr>

								<tr>
									<th style="width: 100px;">메인 이미지</th>
									<td>${vo.bookimage }<input type="button" id="btn1"
										value="삭제" /> <img src="goods/update/${vo.bookimage }"
										width="30" height="30" />
									</td>
								</tr>
								<tr>
									<th style="width: 100px;">메인 이미지</th>
									<td><div id="imageView"></div>
									</td>
								</tr>
								<tr>
									<th style="width: 100px;">상세 이미지1</th>
									<td>${vo.bookimage1 }<input type="button" id="btn2"
										value="삭제" /> <img src="goods/update/${vo.bookimage1}"
										width="30" height="30" />
									</td>
								</tr>
								<tr>
									<th style="width: 100px;">상세 이미지1</th>
									<td><div id="imageView1"></div>
									</td>
								</tr>
							</table>
							<input type="submit" value="수정 완료"> 
							<input type="hidden" name="fileDel" id="fileDel" /> 
							<input type="hidden" name="fileDel1" id="fileDel1" /> 
							<input type="hidden" name="id_item" id="id_item" value="${vo.id_item }" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="${requestScope.footer }"></jsp:include>
	</div>
</body>
</html>