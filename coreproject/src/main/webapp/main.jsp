<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>DRONY</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="header.jsp" %> 

		<!-- Banner -->
		<div id="banner">
			<div class="content">
				<h2>Welcome to DRONY</h2>
				<p>내게 필요한 드론 전문가를 찾아보세요</p>
				<a href="pestControl.jsp" class="button scrolly">Alright let's go</a>
			</div>
		</div>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- Highlight -->
						<section class="box highlight">
							<ul class="special">
								<li><a href="pestControl.jsp" class="icon solid"><img src="images/farm.png"><p>방역·방제·살포</p></a></li>
								<li><a href="measure.jsp" class="icon solid"><img src="images/measure.png"><p>공간정보·측량</p></a></li>
								<li><a href="shooting.jsp" class="icon solid"><img src="images/camera.png"><p>영상촬영·편집</p></a></li>
								<li><a href="transport.jsp" class="icon solid"><img src="images/delivery.png"><p>물류·운송</p></a></li>
								<!-- <li><a href="etc.jsp" class="icon solid"><img src="images/hobbydrone.png"><p>기타</p></a></li> -->
							</ul>
						</section>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer -->
		<%@include file="footer.jsp" %>
	</div>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>

		<!-- 작은화면 메뉴 -->
		<%@include file="navPanel.jsp" %>
	</body>
</html>