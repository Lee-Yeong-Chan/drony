<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>비행지도</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
			#map{
				width: 550px; 
				height: 450px;
			}
			.overlaybox{
				position: relative;
				display: inline-block;
				background: #284a6e no-repeat;
				padding : 10px;
				border-radius: 10px;
				color: #fff;
			}
		</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<!-- Header -->
			<%@include file="header.jsp" %> 
			<section id="main">
				<div class="container">
					<div class="row">
						<!-- sidebar -->
						<%@include file="boardsidebar.jsp" %>
						<!-- sidebar끝 -->
						<!-- Main -->
						<div class="col-9 col-12-medium imp-medium">
								<div class="content">
									<article class="box page-content">
										<header>
											<h3>비행 지도</h3>
										</header>
									</article>
								</div>
							<article class="box page-content">
								<div id="map">
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eeea66c563498d245de93e3e9e6c7a59"></script>
								<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
								<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eeea66c563498d245de93e3e9e6c7a59 API Key&libraries=services,clusterer"></script>
								<script>
									var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
									var mapOption = { //지도를 생성할 때 필요한 기본 옵션
										center: new kakao.maps.LatLng(34.950798382552, 127.48720558448), //지도의 중심좌표.
										level: 5 //지도의 레벨(확대, 축소 정도)
									};
									var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
								</script>
								</div>	
								
							</article>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- Scripts -->
		<script src="assets/js/proj4.js"></script>
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	</body>
</html>