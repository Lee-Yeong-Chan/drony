<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>게시물 올리기</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">
  	 		
   		<!-- Header -->
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
										<h1><a href="pestControl.jsp">방역·방제·살포</a></h1>
									</article>
		   						</li>
		   						<li>
									<article class="box side-info">
										<h1><a href="measure.jsp">측량</a></h1>
									</article>
								</li>
								<li>
									<article class="box side-info">
										<h1><a href="shooting.jsp">촬영</a></h1>
									</article>
								</li>
								<li>
									<article class="box side-info">
										<h1><a href="transport.jsp">물류·운송</a></h1>
									</article>
								</li>
								<li>
									<article class="box side-info">
										<h1><a href="etc.jsp">기타</a></h1>
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
   									<h3></h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<div id="insert" class="mypagetable" style="margin-left: 30px;">
   									<form action="insertPostCon" method="post" enctype="multipart/form-data">
	   									<table class="noticetable" height="180px">
	   										<tr>
	   											<td>제목</td>
	   											<td><input type="text" name="title"></td>
	   										</tr>
	   										<tr>
	   											<td>분야</td>
	   											<td><select name="w_kind">
													<option value="">선택</option>
													<option value="P">방역·방제·살포</option>
													<option value="M">측량</option>
													<option value="S">촬영</option>
													<option value="T">물류·운송</option>
													<option value="E">기타</option>
												</select></td>
	   										</tr>
	   										<tr>
	   											<td>이미지업로드</td>
	   											<td><input type="file" name="file"></td>
	   										</tr>
	   										<tr>
	   											<td>첨부파일</td>
	   											<td><input type="file" name="file"></td>
	   										</tr>
	   										<tr>
	   											<td>단가</td>
	   											<td><input type="text" name="price"></td>
	   										</tr>
	   										<tr>
	   											<td>내용</td>
	   											<td><textarea type="text" name="content"></textarea></td>
	   										</tr>
	   										<tr style="text-align: right;">
	   											<td colspan='2'><input type="submit" value="작성"></td>
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