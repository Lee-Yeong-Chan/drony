<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>DRONY</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<div id="page-wrapper">
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<!-- Content -->
							<article class="box page-content userjoin">
								<header class="join">
									<h2>회 원 가 입</h2>
								</header>
								<section class="join-form">
									<form action="JoinUserCon" method="post">
										<b>아이디</b><br>
										<input type="text" name="id"><br>
										<b>비밀번호</b><br>
										<input type="password" name="pw"><br>
										<b>이름</b><br>
										<input type="text" name="name"><br>
										<b>이메일</b><br>
										<input type="text" name="email"><br>
										<b>전화번호</b><br>
										<input type="text" name="phone"><br>
										<input type="submit" value="회원가입" class="submit-btn">
									</form>
								</section>
								
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