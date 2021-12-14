<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

				
				
				<h1>${vo.title }</h1>
				<div id="audio-book" class="audio-section">
					
					<div class="audio-header">
						<h2>"<%=request.getParameter("keyword") %>" 에 대한 검색 '총 <%=request.getAttribute("count") %>개'</h2>
					</div>
					
					<div class="audio-body">
						<ul class="audio-flex-between2">
						<c:forEach  var="vo" items="${list }"> <!-- @@@@@@@@@@@@@@@@@@@@@@ -->
							<li>
								<a href="#">
									<div class="image-wrap ">
										<center><a href="${pageContext.request.contextPath}/detail?id_item=${vo.id_item}"><img src="<%=request.getContextPath() %>/img_cover/${vo.id_item }.jpg" class="img_search"></a></center>
									</div>
									
									<h3>${vo.title }</h3>
									<span class="author-1">${vo.author }</span>
									<span class="author-2">${vo.org_author }</span>
									<span class="price">${vo.price }</span> 
								</a>
							</li>
							</c:forEach>
							

						<!-- <button type="button" class="btn-right"></button> -->
						

					</div>

				</div>


			
				</div>
				

			
		</div>
		
	</main>

