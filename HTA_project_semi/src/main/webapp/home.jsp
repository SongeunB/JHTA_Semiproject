<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<main id="audio-main" role="main">
			
		<div class="audio-container audio-flex-between">
				
			<div class="main-right">
				<div class="main-category" onmouseover="showCategory(event)" onmouseout="removeCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
				<c:set var="ctdummy" value="${fn:split(category[0],'@')[0]}"/>
						<h3>${ctdummy}</h3>
					</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
				<c:forEach var="ctString" items="${category}">
				<c:set var="ct" value="${fn:split(ctString,'@')}"/>
				<c:choose>
					<c:when test="${ct[0]!=ctdummy}">
							</ul>
						</div>
						<div class="main-category" onmouseover="showCategory(event)" onmouseout="removeCategory(event)">
							<div class="main-category-title-wrap">
								<a href="/song_semi/edit/category1.jsp">
								<h3>${ct[0]}</h3>
								</a>
								</div>
								<ul class="main-category-lists" style="display:none;">
									<li><a href="/song_semi/edit/category1.jsp">${ct[1]}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/song_semi/edit/category1.jsp">${ct[1]}</a></li>
					</c:otherwise>
				</c:choose>
				<c:set var="ctdummy" value="${ct[0]}"/>
				</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="audio-main-left">

				<div id="audio-today" class="audio-section">
					<div class="audio-header">
						<h2>오늘의 추천 작품</h2>
					</div>

					<div class="audio-body">
						<div class="audio-slide-wrap" onclick="location.href='${pageContext.request.contextPath}/detail?id_item=${banner.id_item}';" style="background: linear-gradient(to right, ${banner.left_color}, ${banner.right_color});">
							<div class="audio-slide audio-flex-between">
								<img src="img_cover/${banner.id_item}.jpg">
								<div class="txt-wrap" style="height:220px; width:450px;">
									<h3 style="font-style:italic;color:white;">${banner.sentence}</h3>
									<p style="color:white;">${banner.author} &nbsp;『${banner.title}』</p>
								</div>
							</div>

							<!--<button type="button" class="btn btn-left"><i class="bi bi-chevron-left"></i></button>
							<button type="button" class="btn btn-right"><i class="bi bi-chevron-right"></i></button>  -->
						</div>
					</div>
				</div>

				<div class="audio-original" class="audio-section">

					<div class="audio-header">
						<h2>새로 나온 책</h2>
						<p>최근 출간된 책을 만나보세요.</p>
						
						<a href="#" class="link-total">전체보기</a>
					</div>

					<div class="audio-body">
						
						<ul class="audio-flex-between">
						<c:forEach var="newVo" items="${newList}">
							<li>
								<a href="${pageContext.request.contextPath}/detail?id_item=${newVo.id_item}">
									<img src="img_cover/${newVo.id_item}.jpg" class="img_cover">
									<h3>${newVo.title}</h3>
									<span class="author">${newVo.author}</span>
								</a>
							</li>
						</c:forEach>
						</ul>

						<!--<button type="button" class="btn-right"></button> -->
					</div>
				</div>

				<div class="audio-original" class="audio-section" style="margin-top:80px;">

					<div class="audio-header">
						<h2>BEST 셀러</h2>
						<p>지난 달 사람들이 많이 찾은 책을 만나보세요.</p>
						
						<a href="#" class="link-total">전체보기</a>
					</div>

					<div class="audio-body" style="margin-bottom:100px;">
						
						<ul class="audio-flex-between">
						<c:forEach var="bestVo" items="${bestList}">
							<li>
								<a href="${pageContext.request.contextPath}/detail?id_item=${bestVo.id_item}">
									<img src="img_cover/${bestVo.id_item}.jpg" class="img_cover">
									<h3>${bestVo.title}</h3>
									<span class="author">${bestVo.author}</span>
								</a>
							</li>
						</c:forEach>
						</ul>

						<!--<button type="button" class="btn-right"></button> -->
					</div>
				</div>

			<!--  <div id="audio-book" class="audio-section">
					
					<div class="audio-header">
						<h2>주간 베스트 TOP 100</h2>
					</div>
					<div class="audio-body">
						
						<ul class="audio-flex-between">
							<li>
								<a href="#">
									<div class="image-wrap ">
										<img src="https://via.placeholder.com/120">
										<span class="time">2시간</span>
									</div>
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author-1">백송은</span>
									<span class="author-2">백송은</span>
									<span class="price">대여 3,500원</span>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap ">
										<img src="https://via.placeholder.com/120">
										<span class="time">2시간</span>
									</div>
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author-1">백송은</span>
									<span class="author-2">백송은</span>
									<span class="price">대여 3,500원</span>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap ">
										<img src="https://via.placeholder.com/120">
										<span class="time">2시간</span>
									</div>
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author-1">백송은</span>
									<span class="author-2">백송은</span>
									<span class="price">대여 3,500원</span>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap ">
										<img src="https://via.placeholder.com/120x110">
										<span class="time">2시간</span>
									</div>
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author-1">백송은</span>
									<span class="author-2">백송은</span>
									<span class="price">대여 3,500원</span>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap ">
										<img src="https://via.placeholder.com/120x130">
										<span class="time">2시간</span>
									</div>
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author-1">백송은</span>
									<span class="author-2">백송은</span>
									<span class="price">대여 3,500원</span>
								</a>
							</li>
						</ul>

						<button type="button" class="btn-right"></button>
						

					</div>

				</div>


				<div id="audio-channel" class="audio-section">
					
					<div class="audio-header">
						<h2>새로 나온 작품</h2>
					</div>
					<div class="audio-body">
						
						<ul class="audio-flex-between">
							<li>
								<a href="#">
									<img src="https://via.placeholder.com/120">
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author">백송은</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="https://via.placeholder.com/120">
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author">백송은</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="https://via.placeholder.com/120">
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author">백송은</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="https://via.placeholder.com/120">
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author">백송은</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="https://via.placeholder.com/120">
									
									<h3>Title 1 Title 1 Title 1</h3>
									<span class="author">백송은</span>
								</a>
							</li>
						</ul>

						<button type="button" class="btn-right"></button>
						
					</div>
				</div>
			</div>-->

			
		</div>
	</main>

