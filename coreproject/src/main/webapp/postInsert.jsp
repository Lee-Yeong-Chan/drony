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
	<body>
		<form action="insertPostCon" method="post">
			<h1> 제목 : <input type="text" name="title"></h1>
			<div>
				<div> 분야 : <select name="w_kind">
						<option value="">선택</option>
						<option value="P">방역·방제·살포</option>
						<option value="M">측량</option>
						<option value="S">촬영</option>
						<option value="T">물류·운송</option>
						<option value="E">기타</option>
					</select>
				</div>
				<div> 이미지 : <input type="file" name="img"> </div>
				<div> 내용 : <input type="text" name="content"></div>
				<div> 첨부파일 : <input type="file" name="file"></div>
				<div> 단가 : <input type="text" name="price"></div>
			</div>
<<<<<<< Upstream, based on branch 'master' of https://github.com/2022-SMHRD-DCX-BigData-7/DRONY.git
			<input type="submit" value="등록">
=======
			<input type="submit" value="작성완료">
>>>>>>> dbe7e38 hihi
			</form>
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