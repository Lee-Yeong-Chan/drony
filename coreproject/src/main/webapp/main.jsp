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
		<section id="banner">
			<div class="content">
				<h2>Welcome to DRONY</h2>
				<p>A free responsive site template built on HTML5, CSS3, and some other stuff</p>
				<a href="#main" class="button scrolly">Alright let's go</a>
			</div>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- Highlight -->
						<section class="box highlight">
							<ul class="special">
								<li><a href="#" class="icon solid"><img src="images/farm.png"><p>방역·방제·살포</p></a></li>
								<li><a href="#" class="icon solid"><img src="images/measure.png"><p>측량</p></a></li>
								<li><a href="#" class="icon solid"><img src="images/camera.png"><p>촬영</p></a></li>
								<li><a href="#" class="icon solid"><img src="images/delivery.png"><p>물류·운송</p></a></li>
								<li><a href="#" class="icon solid"><img src="images/hobbydrone.png"><p>기타</p></a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
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

	</body>
</html>