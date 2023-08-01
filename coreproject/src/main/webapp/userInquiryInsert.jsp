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
   					
					<!-- sidebar -->
   					<%@include file="boardsidebar.jsp" %>
   					<!-- sidebar끝 -->
					
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