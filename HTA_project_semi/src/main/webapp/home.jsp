<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<main id="audio-main" role="main">
			
		<div class="audio-container audio-flex-between">
				
			<div class="main-right">
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>문학</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">국내문학</a></li>
						<li><a href="/song_semi/edit/category1.jsp">영미문학</a></li>
						<li><a href="/song_semi/edit/category1.jsp">독일문학</a></li>
						<li><a href="/song_semi/edit/category1.jsp">러시아문학</a></li>
						<li><a href="#">프랑스문학</a></li>
						<li><a href="#">일본문학</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>역사</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">세계사</a></li>
						<li><a href="/song_semi/edit/category1.jsp" style="color: lightgray;">서양사</a></li>
						<li><a href="#">동양사</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>철학</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">철학사</a></li>
						<li><a href="/song_semi/edit/category1.jsp">서양철학</a></li>
						<li><a href="#">동양철학</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>과학</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">물리학</a></li>
						<li><a href="/song_semi/edit/category1.jsp">화학</a></li>
						<li><a href="#">수학</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>예술</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">미술</a></li>
						<li><a href="/song_semi/edit/category1.jsp">음악</a></li>
						<li><a href="#">사진</a></li>
						<li><a href="#">영화</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>경제 / 경영</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">경제</a></li>
						<li><a href="/song_semi/edit/category1.jsp">경영</a></li>
						<li><a href="#">마케팅</a></li>
						<li><a href="#">투자</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>사회</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">정치</a></li>
						<li><a href="/song_semi/edit/category1.jsp">지리</a></li>
						<li><a href="#">교육</a></li>
						<li><a href="#">법</a></li>
					</ul>
				</div>
				<div class="main-category" onmouseover="showCategory(event)">
					<div class="main-category-title-wrap">
						<a href="/song_semi/edit/category1.jsp">
							<h3>요리 / 음식</h3>
						</a>
					</div>

					<ul class="main-category-lists" style="display:none;">
						<li><a href="/song_semi/edit/category1.jsp">한식</a></li>
						<li><a href="/song_semi/edit/category1.jsp">양식</a></li>
						<li><a href="#">중식</a></li>
						<li><a href="#">주류</a></li>
						<li><a href="#">커피 / 차</a></li>
					</ul>
				</div>
			</div>
			
			<div class="audio-main-left">

				<div id="audio-today" class="audio-section">
					<div class="audio-header">
						<h2>오늘의 추천 작품</h2>
					</div>

					<div class="audio-body">
						<div class="audio-slide-wrap">
							<div class="audio-slide audio-flex-between">
								<img src="img/woghs.jpg">
								<div class="txt-wrap">
									<h3>[재혼황후]오디오 드라마</h3>
									<p>오디오 드라마도 만나는 레전드 웹소설!</p>
								</div>
							</div>

							<button type="button" class="btn btn-left"></button>
							<button type="button" class="btn btn-right"></button>
						</div>
					</div>
				</div>

				<div id="audio-original" class="audio-section">

					<div class="audio-header">
						<h2>이달의 추천 소설</h2>
					</div>

					<div class="audio-body">
						
						<ul class="audio-flex-between">
							<li>
								<a href="#">
									<img src="img/kimyung.png">
									<h3>완벽한 아이</h3>
									<span class="author">김영하</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="img/kimyung.png">
									<h3>완벽한 아이</h3>
									<span class="author">김영하</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="img/kimyung.png">
									<h3>완벽한 아이</h3>
									<span class="author">김영하</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="img/kimyung.png">
									<h3>완벽한 아이</h3>
									<span class="author">김영하</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="img/kimyung.png">
									<h3>완벽한 아이</h3>
									<span class="author">김영하</span>
								</a>
							</li>
						</ul>

						<button type="button" class="btn-right"></button>
					</div>
				</div>

				<div id="audio-playlist" class="audio-section">

					<div class="audio-header">
						<h2>화제의 책소식</h2>
						<p>당신을 위해 매일 새롭게 업데이트 됩니다.</p>

						<a href="#" class="link-total">전체보기</a>
					</div>

					<div class="audio-body">
						
						<ul class="audio-flex-between">
							<li>
								<a href="#">
									<div class="image-wrap">
										<img src="img/KBS_News.jpg">
										
										<i class="icon-play"></i>
									</div>

									<h3>KBS 뉴스</h3>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap">
										<img src="img/KBS_News.jpg">
										
										<i class="icon-play"></i>
									</div>

									<h3>KBS 뉴스</h3>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap">
										<img src="img/KBS_News.jpg">
										
										<i class="icon-play"></i>
									</div>

									<h3>KBS 뉴스</h3>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="image-wrap">
										<img src="img/KBS_News.jpg">
										
										<i class="icon-play"></i>
									</div>

									<h3>KBS 뉴스</h3>
								</a>
							</li>
						</ul>

						<button type="button" class="btn-right"></button>
					</div>
				</div>

				<div id="audio-book" class="audio-section">
					
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
			</div>

			
		</div>
	</main>

