<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-weapper">
		
		<!-- Hearder -->
		<%@include file="header.jsp" %>
		
		<!-- Main -->
		<section id="main">
			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
		
							<!-- Sidebar 시작-->
   								<ul class="divided">
   									<li>
   										<article class="box side-info">
											<h1><a href="notice.jsp">공지사항</a></h1>
										</article>
									</li>
									<c:choose>
										<c:when test="${not empty loginUser or not empty loginExpert}">
											<c:choose>
												<c:when test="${not empty loginUser}">
												 <li>
												 	<article class="box side-info">
															<h1><a href="userInquiry.jsp">문의사항</a></h1>
													</article>
												</li>	
											</c:when>
										 	<c:otherwise>
													<li>
														<article class="box side-info">
															<h1><a href="expertInquiry.jsp">문의사항</a></h1>
														</article>
													</li>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li>
												<article class="box side-info">
													<h1><a href="login.jsp">문의사항</a></h1>
												</article>
											</li>
										</c:otherwise>
									</c:choose>
									<li>											
										<article class="box side-info">
											<h1><a href="sale.jsp">판매업체</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="repair.jsp">수리업체</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="repair.jsp">비행지도</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="https://drone.onestop.go.kr/" target="_blank">원스탑민원서비스</a></h1>
										</article>
									</li>
								</ul>
											
   						</div>
   					</div>
					<!-- Sidebar 끝-->		
					
					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>문의사항</h3>
   								</header>							
											
								<!-- 여기서부터 오른쪽 페이지 수정되는 부분-->												
								<div id="insert" class="mypagetable" style="margin-left: 30px;">
								
								<form action="insertUserInquiryCon" method="post" enctype="multipart/form-data">
									<table class="noticetable" height="180px">
										<tr>
											<td>제목</td>
											<td><input type="text" name="title"></td>
										</tr>
										<tr>
											<td>첨부파일</td>
											<td><input type="text" name="file"></td>
										</tr>
										<tr>
											<td>내용</td>
											<td>
												<textarea rows="7" name="content"></textarea>
											</td>
										</tr>
										<tr style="text-align: right;">
											<td colspan='2'><input type="submit" value="추가"></td>
										</tr>
									</table>
								</form>
							</div>
						</article>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
		
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	</body>
</html>